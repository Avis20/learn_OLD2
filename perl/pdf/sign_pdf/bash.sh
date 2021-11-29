#!/usr/bin/env bash

rm -rf 'res2/Lorem.png res2/res_convert.png res2/Lorem.pdf '

convert -density 300 source/Lorem.pdf[1] -quality 90 res2/Lorem.png;
identify res2/Lorem.png;
convert -composite -geometry +260+700 res2/Lorem.png source/stamp.png res2/res_convert.png;
convert res2/res_convert.png res2/Lorem.pdf;

