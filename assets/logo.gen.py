#!/usr/bin/env python3
# Generate the scintilla.nvim logo: a faceted amethyst druzy cluster (low-poly,
# tessellated triangles clipped to a crystalline silhouette) + wordmark.
import math

# ---- amethyst silhouette (chunky geode chunk, broad crystal points on top) ----
SIL = [
    (40,284),(26,236),(28,184),(40,150),(56,120),(72,82),(92,118),(104,104),
    (118,70),(134,110),(152,86),(170,126),(184,158),(190,202),(180,246),
    (158,278),(120,292),(80,288),
]
sil_pts = " ".join(f"{x},{y}" for x,y in SIL)
xs=[p[0] for p in SIL]; ys=[p[1] for p in SIL]
x0,x1=min(xs)-2,max(xs)+2; y0,y1=min(ys)-2,max(ys)+2

# ---- purple ramp: deep at the tips (top) -> light lavender at the base ----
RAMP=[(0.0,(0x34,0x1d,0x63)),(0.45,(0x76,0x52,0xc0)),(1.0,(0xcf,0xbb,0xf5))]
HI=(0xec,0xe1,0xff)   # sparkle facet
LO=(0x29,0x15,0x52)   # crevice facet

def ramp(t):
    t=max(0.0,min(1.0,t))
    for i in range(len(RAMP)-1):
        a,ca=RAMP[i]; b,cb=RAMP[i+1]
        if a<=t<=b:
            f=(t-a)/(b-a)
            return tuple(round(ca[k]+(cb[k]-ca[k])*f) for k in range(3))
    return RAMP[-1][1]

def shade(c,d):  # lighten/darken
    return tuple(max(0,min(255,round(v+d))) for v in c)

def hx(c): return "#%02x%02x%02x"%c
def h(i,j): return (i*73856093 ^ j*19349663) & 0xffff   # deterministic jitter

S=24.0
cols=int(math.ceil((x1-x0)/S))+1; rows=int(math.ceil((y1-y0)/S))+1
# jittered shared lattice -> irregular, organic facets (not a uniform grid)
def pt(i,j):
    r=h(i,j)
    jx=((r%17)-8)*0.85; jy=(((r>>5)%17)-8)*0.85
    return (x0+i*S+jx, y0+j*S+jy)
tris=[]
for j in range(rows):
    for i in range(cols):
        a=pt(i,j); b=pt(i+1,j); c=pt(i,j+1); d=pt(i+1,j+1)
        if (i+j)%2==0:
            quads=[(a,b,c),(b,d,c)]
        else:
            quads=[(a,b,d),(a,d,c)]
        for k,tri in enumerate(quads):
            tris.append((i,j,k,tri))

facets=[]
for (i,j,k,tri) in tris:
    cyc=sum(p[1] for p in tri)/3.0
    t=(cyc-y0)/(y1-y0)
    base=ramp(t)
    r=h(i*2+k,j)
    jitter=((r%40)-16)          # -16..23 lightness jitter
    col=shade(base,jitter)
    pick=r%100
    if pick<12: col=HI          # sparkle
    elif pick<18: col=LO        # crevice
    pts=" ".join(f"{round(x,1)},{round(y,1)}" for x,y in tri)
    facets.append(f'    <polygon points="{pts}" fill="{hx(col)}"/>')
facets="\n".join(facets)

svg=f'''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 320" width="1200" height="320"
     font-family="ui-monospace, 'SF Mono', 'JetBrains Mono', Menlo, monospace">
  <defs>
    <radialGradient id="glow" cx="0.5" cy="0.5" r="0.5">
      <stop offset="0" stop-color="#af87ff" stop-opacity="0.5"/>
      <stop offset="1" stop-color="#af87ff" stop-opacity="0"/>
    </radialGradient>
    <clipPath id="mass"><polygon points="{sil_pts}"/></clipPath>
  </defs>

  <rect width="1200" height="320" rx="30" fill="#0e0024"/>

  <!-- centered: gem(220) + gap(64) + wordmark(760) = 1044, margins 78 -->
  <g transform="translate(78,0)">
    <circle cx="110" cy="160" r="160" fill="url(#glow)"/>

    <!-- faceted amethyst druzy: tessellated crystal facets clipped to the cluster -->
    <g clip-path="url(#mass)" stroke="#1c0f3a" stroke-width="0.9" stroke-linejoin="round" stroke-opacity="0.55">
{facets}
    </g>
    <!-- crystal silhouette edge -->
    <polygon points="{sil_pts}" fill="none" stroke="#0e0024" stroke-width="3" stroke-linejoin="round"/>
    <polygon points="{sil_pts}" fill="none" stroke="#d9c8ff" stroke-width="1" stroke-opacity="0.35" stroke-linejoin="round"/>

    <!-- wordmark -->
    <text x="284" y="176" font-size="98" font-weight="700" fill="#f4eeff"
          textLength="760" lengthAdjust="spacing" letter-spacing="-2">scintilla<tspan fill="#af87ff">.nvim</tspan></text>
    <text x="664" y="222" font-size="27" fill="#8676a6" text-anchor="middle"
          textLength="560" lengthAdjust="spacing">DEEP&#160;&#160;GEMSTONE&#160;&#160;COLORSCHEMES</text>
  </g>
</svg>
'''
open("/Users/piacsek/projects/mineral.nvim/assets/logo.svg","w").write(svg)
print("wrote logo.svg  facets:",len(facets.splitlines()))
