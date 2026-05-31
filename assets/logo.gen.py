#!/usr/bin/env python3
# scintilla.nvim logo: an amethyst "mirrorball" — a faceted sphere of tiles,
# lit from the upper-left so facets range from deep purple to bright lavender.
import math

CX,CY,R = 110,160,104        # ball center + radius (inside the gem box)
NLAT, NLON = 8, 12           # tile rows / columns (kept low = simple, catchy)
LATMAX = math.radians(84)

# light direction (upper-left, toward viewer)
Lx,Ly,Lz = -0.5,0.55,0.66
ln=math.sqrt(Lx*Lx+Ly*Ly+Lz*Lz); Lx,Ly,Lz=Lx/ln,Ly/ln,Lz/ln

DARK=(0x2f,0x14,0x5e); LIGHT=(0xc5,0xa3,0xf3); SPEC=(0xf1,0xea,0xff)

def lerp(a,b,t): return tuple(round(a[k]+(b[k]-a[k])*t) for k in range(3))
def hx(c): return "#%02x%02x%02x"%c
def hsh(i,j): return (i*73856093 ^ j*19349663) & 0xffff

def proj(lat,lon):
    x=CX + R*math.cos(lat)*math.sin(lon)
    y=CY - R*math.sin(lat)
    return (round(x,1),round(y,1))

facets=[]
for j in range(NLAT):
    lat0=-LATMAX + (2*LATMAX)*j/NLAT
    lat1=-LATMAX + (2*LATMAX)*(j+1)/NLAT
    for i in range(NLON):
        lon0=-math.pi/2 + math.pi*i/NLON
        lon1=-math.pi/2 + math.pi*(i+1)/NLON
        p=[proj(lat0,lon0),proj(lat0,lon1),proj(lat1,lon1),proj(lat1,lon0)]
        latc=(lat0+lat1)/2; lonc=(lon0+lon1)/2
        nx=math.cos(latc)*math.sin(lonc); ny=math.sin(latc); nz=math.cos(latc)*math.cos(lonc)
        b=max(0.0,nx*Lx+ny*Ly+nz*Lz)**1.15
        col=lerp(DARK,LIGHT,b)
        r=hsh(i,j)
        if b>0.88 and r%100<45: col=SPEC          # tight specular sparkle
        elif r%100<6: col=SPEC                     # a few scattered glints
        pts=" ".join(f"{x},{y}" for x,y in p)
        facets.append(f'    <polygon points="{pts}" fill="{hx(col)}"/>')
facets="\n".join(facets)

svg=f'''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 320" width="1200" height="320"
     font-family="ui-monospace, 'SF Mono', 'JetBrains Mono', Menlo, monospace">
  <defs>
    <radialGradient id="glow" cx="0.5" cy="0.5" r="0.5">
      <stop offset="0" stop-color="#af87ff" stop-opacity="0.55"/>
      <stop offset="1" stop-color="#af87ff" stop-opacity="0"/>
    </radialGradient>
    <radialGradient id="sheen" cx="0.36" cy="0.32" r="0.7">
      <stop offset="0" stop-color="#ffffff" stop-opacity="0.35"/>
      <stop offset="0.4" stop-color="#ffffff" stop-opacity="0"/>
    </radialGradient>
    <clipPath id="ball"><circle cx="{CX}" cy="{CY}" r="{R}"/></clipPath>
  </defs>

  <rect width="1200" height="320" rx="30" fill="#0e0024"/>

  <!-- centered: gem(220) + gap(64) + wordmark(760) = 1044, margins 78 -->
  <g transform="translate(78,0)">
    <circle cx="{CX}" cy="{CY}" r="160" fill="url(#glow)"/>

    <!-- mirrorball facets -->
    <g clip-path="url(#ball)" stroke="#0e0024" stroke-width="1.2" stroke-linejoin="round">
{facets}
    </g>
    <!-- soft top-left sheen + crisp rim -->
    <circle cx="{CX}" cy="{CY}" r="{R}" fill="url(#sheen)"/>
    <circle cx="{CX}" cy="{CY}" r="{R}" fill="none" stroke="#d9c8ff" stroke-opacity="0.5" stroke-width="1.5"/>

    <!-- wordmark -->
    <text x="284" y="176" font-size="98" font-weight="700" fill="#f4eeff"
          textLength="760" lengthAdjust="spacing" letter-spacing="-2">scintilla<tspan fill="#af87ff">.nvim</tspan></text>
    <text x="664" y="222" font-size="27" fill="#8676a6" text-anchor="middle"
          textLength="560" lengthAdjust="spacing">DEEP&#160;&#160;GEMSTONE&#160;&#160;COLORSCHEMES</text>
  </g>
</svg>
'''
open("/Users/piacsek/projects/mineral.nvim/assets/logo.svg","w").write(svg)
print("wrote logo.svg  tiles:",NLAT*NLON)
