#!/usr/bin/env bash
#
# @file  Title of file script
# @brief Small description of the script.

set -o errexit
set -o pipefail

# These two simple commands merge multiple images together (it's called image stacking).

# I've found that these parameters take care of the alignment of the point of interest. 
# The out is the prefix for the resulting tiff images
# I've only tried a handful of parameters, the one I'm showing here I've found after I got 
#a big light-trail instead of the point of interest. This combination worked quite well.

# -C Auto crop the image to the area covered by all images
# -i  Optimize image center shift for all images, except for first.
align_image_stack -m -a OUT ${IMAGES} -C -i

# When the script finishes, you can combine all the stacks in one image with enfuse which comes with hugin installation

# I haven't played yet with the enfuse parameters but I'll update as soon as I find more.

enfuse --exposure-weight=0 --saturation-weight=0 --contrast-weight=1 --hard-mask --output=final_result.tif OUT*.tif

# Then you can use gimp to try some filters to further enhance the image.
