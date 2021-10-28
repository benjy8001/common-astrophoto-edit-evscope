#!/usr/bin/env bash
#
# @file  Title of file script
# @brief Small description of the script.

set -o errexit
set -o pipefail

convert temp.jpg -gravity North -pointsize 30 -annotate +0+100 'Love you mom' temp1.jpg