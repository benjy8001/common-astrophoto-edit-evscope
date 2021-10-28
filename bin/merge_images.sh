#!/usr/bin/env bash
#
# @file  Title of file script
# @brief Small description of the script.

set -o errexit
set -o pipefail

# do merge_images Plus/Bumpmap/Screen etc (http://www.imagemagick.org/Usage/compose/)
merge_images() {
    merge_mode="$1"
    image_pattern="$2"
    image_list=$(ls $image_pattern)
    first_image=$(echo $image_list | cut -d ' ' -f 1)
    cp $first_image temp.jpg
    for img in $image_list; do
        composite temp.jpg ${img} -compose "$merge_mode" temp.jpg
    done
    mv temp.jpg result.jpg
}

#I found that this is the best way so far to automate image cropping
simple_fuzz() {
    sensitivity=$1
    image_pattern=$2
    for img in $(ls $image_pattern); do
        convert $img -flatten -fuzz $sensitivity -trim +repage OUT_$img
    done
}

#So if you put all the images in a specific folder you can do for example
simple_fuzz 65% *.JPG
merge_images Plus OUT*.JPG

