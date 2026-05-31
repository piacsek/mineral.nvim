# showcase.ex — syntax sampler for scintilla.nvim screenshots
defmodule Scintilla.Gem do
  @moduledoc """
  A gemstone with a hue and a set of cut facets.
  Demonstrates structs, typespecs, guards, and pattern matching.
  """

  @enforce_keys [:id, :name, :hue]
  defstruct id: nil, name: "", hue: "#000000", facets: [], rare?: false

  @type hue :: <<_::56>>
  @type t :: %__MODULE__{
          id: pos_integer(),
          name: String.t(),
          hue: hue(),
          facets: [String.t()],
          rare?: boolean()
        }

  @max_facets 64
  @default_hue "#7d5fff"

  @doc "Build a gem, falling back to the house violet when no hue is given."
  @spec new(pos_integer(), String.t(), keyword()) :: t()
  def new(id, name, opts \\ []) when is_integer(id) and id > 0 do
    %__MODULE__{
      id: id,
      name: name,
      hue: Keyword.get(opts, :hue, @default_hue),
      facets: opts |> Keyword.get(:facets, []) |> Enum.take(@max_facets),
      rare?: Keyword.get(opts, :rare?, false)
    }
  end

  @doc "Pretty label, starring rare gems."
  @spec label(t()) :: String.t()
  def label(%__MODULE__{rare?: true, name: name}), do: "★ #{name}"
  def label(%__MODULE__{name: name}), do: name

  @doc "Sum the facet count across a list of gems."
  @spec total_facets([t()]) :: non_neg_integer()
  def total_facets(gems) do
    gems
    |> Stream.map(&length(&1.facets))
    |> Enum.reduce(0, fn count, acc -> acc + count end)
  end
end

defprotocol Sparkle do
  @doc "How brightly a thing sparkles, 0.0..1.0"
  def intensity(thing)
end

defimpl Sparkle, for: Scintilla.Gem do
  def intensity(%{rare?: true}), do: 1.0
  def intensity(%{facets: facets}) when length(facets) > 8, do: 0.75
  def intensity(_gem), do: 0.4
end

# A quick demo pipeline
gems = [
  Scintilla.Gem.new(1, "Amethyst", hue: "#9b59b6", facets: ~w(table crown pavilion)),
  Scintilla.Gem.new(2, "Ruby", rare?: true)
]

for gem <- gems, intensity = Sparkle.intensity(gem), intensity > 0.5 do
  IO.puts("#{Scintilla.Gem.label(gem)} sparkles at #{intensity}")
end
