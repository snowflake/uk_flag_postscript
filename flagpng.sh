#!/bin/sh
# generate png files

for sf in 1 2 4 8 16 32 64
do
    x=$(echo "$sf 50 * n" | dc)
    y=$(echo "$sf 30 * n" | dc)
    ofname="flag${sf}.png"
    gs -sDEVICE=png16m -dDEVICEWIDTHPOINTS="${x}" -dDEVICEHEIGHTPOINTS="${y}" \
       -dscalefactor="${sf}" -o ${ofname} flag.ps
done
