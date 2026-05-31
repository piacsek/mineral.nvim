#!/usr/bin/env python3
# scintilla.nvim social preview (1280x640, GitHub spec): just the amethyst
# mirrorball, centered on the deep background. Reuses the logo's facet model.
import math

W,H = 1280,640
CX,CY,R = 640,320,212
NLAT,NLON = 8,12
LATMAX = math.radians(84)
Lx,Ly,Lz = -0.5,0.55,0.66
ln=math.sqrt(Lx*Lx+Ly*Ly+Lz*Lz); Lx,Ly,Lz=Lx/ln,Ly/ln,Lz/ln
DARK=(0x2f,0x14,0x5e); LIGHT=(0xc5,0xa3,0xf3)

def lerp(a,b,t): return tuple(round(a[k]+(b[k]-a[k])*t) for k in range(3))
def hx(c): return "#%02x%02x%02x"%c
def proj(lat,lon): return (round(CX+R*math.cos(lat)*math.sin(lon),1), round(CY-R*math.sin(lat),1))

facets=[]
for j in range(NLAT):
    lat0=-LATMAX+(2*LATMAX)*j/NLAT; lat1=-LATMAX+(2*LATMAX)*(j+1)/NLAT
    for i in range(NLON):
        lon0=-math.pi/2+math.pi*i/NLON; lon1=-math.pi/2+math.pi*(i+1)/NLON
        p=[proj(lat0,lon0),proj(lat0,lon1),proj(lat1,lon1),proj(lat1,lon0)]
        latc=(lat0+lat1)/2; lonc=(lon0+lon1)/2
        nx=math.cos(latc)*math.sin(lonc); ny=math.sin(latc); nz=math.cos(latc)*math.cos(lonc)
        b=max(0.0,nx*Lx+ny*Ly+nz*Lz)**1.15
        pts=" ".join(f"{x},{y}" for x,y in p)
        facets.append(f'    <polygon points="{pts}" fill="{hx(lerp(DARK,LIGHT,b))}"/>')
facets="\n".join(facets)

svg=f'''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {W} {H}" width="{W}" height="{H}">
  <defs>
    <radialGradient id="glow" cx="0.5" cy="0.5" r="0.5">
      <stop offset="0" stop-color="#af87ff" stop-opacity="0.55"/>
      <stop offset="1" stop-color="#af87ff" stop-opacity="0"/>
    </radialGradient>
    <radialGradient id="sheen" cx="0.36" cy="0.32" r="0.7">
      <stop offset="0" stop-color="#d9c8ff" stop-opacity="0.30"/>
      <stop offset="0.4" stop-color="#d9c8ff" stop-opacity="0"/>
    </radialGradient>
    <clipPath id="ball"><circle cx="{CX}" cy="{CY}" r="{R}"/></clipPath>
  </defs>
  <rect width="{W}" height="{H}" fill="#0e0024"/>
  <circle cx="{CX}" cy="{CY}" r="320" fill="url(#glow)"/>
  <g clip-path="url(#ball)" stroke="#0e0024" stroke-width="2.4" stroke-linejoin="round">
{facets}
  </g>
  <circle cx="{CX}" cy="{CY}" r="{R}" fill="url(#sheen)"/>
  <circle cx="{CX}" cy="{CY}" r="{R}" fill="none" stroke="#d9c8ff" stroke-opacity="0.5" stroke-width="3"/>
</svg>
'''
open("/Users/piacsek/projects/mineral.nvim/assets/social-preview.svg","w").write(svg)
print("wrote social-preview.svg")
