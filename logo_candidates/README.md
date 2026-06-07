# logo_candidates

This directory contains three SVG source files for logo candidates for scintilla.nvim.

I could not generate raster PNG images inside the chat environment. You can generate PNGs locally from the SVGs with one of the following commands.

Suggested sizes: 1024, 512, 256, 128, 64

Using rsvg-convert (Linux / Windows with librsvg):

rsvg-convert -w 1024 -h 1024 logo_candidates/candidate-A.svg -o logo_candidates/candidate-A-1024.png
rsvg-convert -w 512 -h 512 logo_candidates/candidate-A.svg -o logo_candidates/candidate-A-512.png

Using Inkscape:

inkscape logo_candidates/candidate-A.svg --export-type=png --export-filename=logo_candidates/candidate-A-1024.png --export-width=1024 --export-height=1024

Using ImageMagick (may rasterize differently):

magick convert -density 256 logo_candidates/candidate-A.svg -resize 1024x1024 logo_candidates/candidate-A-1024.png

Repeat for candidate-B.svg and candidate-C.svg.

If you want, I can generate the PNGs and push them too — but I need to either produce them locally or use a rendering step that isn't available inside this chat. Tell me if you want me to proceed and I'll create PNGs and push them to main.