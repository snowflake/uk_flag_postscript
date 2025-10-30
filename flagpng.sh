#!/bin/sh
# generate png files

mkdir -p pngs

for sf in 0.25 0.5 1 2 4 8
do
    echo ====== PNG scale "${sf}" ======
    x=$(echo "5 k $sf 50 * n" | dc)
    y=$(echo "5 k $sf 30 * n" | dc)
    ofname="flag${sf}.png"
    gs -dTextAlphaBits=4 -dGraphicsAlphaBits=4 \
       -r768 -dDownScaleFactor=8 \
       -sDEVICE=png16m -dDEVICEWIDTHPOINTS="${x}" \
       -dDEVICEHEIGHTPOINTS="${y}" \
       -dscalefactor=${sf} -o pngs/${ofname} flag.ps
done
for sf in 16 32 64
do
    echo ====== PNG scale "${sf}" ======
    ofname="flag${sf}.png"
    x=$(echo "5 k $sf 50 * n" | dc)
    y=$(echo "5 k$sf 30 * n" | dc)
    gs -sDEVICE=png16m \
       -dDEVICEWIDTHPOINTS="${x}" \
       -dDEVICEHEIGHTPOINTS="${y}" \
       -r96 \
       -dscalefactor=${sf} -o pngs/${ofname} flag.ps
done

