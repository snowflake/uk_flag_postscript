#!/bin/sh
# generate pdf file

# scale factor
sf=8

x=$(echo "$sf 50 * n" | dc)
y=$(echo "$sf 30 * n" | dc)
ofname="flag${sf}.pdf"
ps2pdf -dDEVICEWIDTHPOINTS="${x}" -dDEVICEHEIGHTPOINTS="${y}" \
       "-dscalefactor=${sf}" "-o${ofname}" flag.ps

