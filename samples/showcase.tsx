// showcase.tsx — syntax sampler for scintilla.nvim screenshots
import { useState, useEffect, useMemo, type FC } from "react";
import { z } from "zod";

const API_BASE = "https://api.example.com/v2" as const;
const MAX_RETRIES = 3;

type Status = "idle" | "loading" | "success" | "error";

interface Gem {
  id: number;
  name: string;
  hue: `#${string}`;
  facets: readonly string[];
  rare?: boolean;
}

const GemSchema = z.object({
  id: z.number().int().positive(),
  name: z.string().min(1),
  hue: z.string().regex(/^#[0-9a-f]{6}$/i),
});

/**
 * Fetch a gem by id, retrying on transient failures.
 * @throws when the response shape is invalid
 */
async function fetchGem(id: number, signal?: AbortSignal): Promise<Gem> {
  for (let attempt = 1; attempt <= MAX_RETRIES; attempt++) {
    const res = await fetch(`${API_BASE}/gems/${id}`, { signal });
    if (res.ok) {
      return GemSchema.parse(await res.json()) as Gem;
    }
    console.warn(`attempt ${attempt} failed: ${res.status}`);
  }
  throw new Error(`gem ${id} unreachable after ${MAX_RETRIES} tries`);
}

export const GemCard: FC<{ gem: Gem; onPick: (g: Gem) => void }> = ({
  gem,
  onPick,
}) => {
  const [status, setStatus] = useState<Status>("idle");
  const label = useMemo(
    () => (gem.rare ? `★ ${gem.name}` : gem.name),
    [gem],
  );

  useEffect(() => {
    const controller = new AbortController();
    setStatus("loading");
    fetchGem(gem.id, controller.signal)
      .then(() => setStatus("success"))
      .catch(() => setStatus("error"));
    return () => controller.abort();
  }, [gem.id]);

  return (
    <article className="gem-card" data-status={status} style={{ color: gem.hue }}>
      <h2>{label}</h2>
      <ul>
        {gem.facets.map((facet, i) => (
          <li key={i}>{facet}</li>
        ))}
      </ul>
      <button disabled={status === "loading"} onClick={() => onPick(gem)}>
        {status === "loading" ? "Loading…" : "Pick"}
      </button>
    </article>
  );
};
