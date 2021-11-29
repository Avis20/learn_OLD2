#!/usr/bin/env bash

rm -rf res;
mkdir res;

convert -density 120 Lorem.pdf -quality 90 res/Lorem.png;
convert -composite -geometry +260+700 res/Lorem.png stamp.png res/res_convert.png;
convert res/res_convert.png res/Lorem.pdf;

