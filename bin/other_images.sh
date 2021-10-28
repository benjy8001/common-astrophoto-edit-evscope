#!/usr/bin/env bash
#
# @file  Title of file script
# @brief Small description of the script.

set -o errexit
set -o pipefail

convert RCrop.tiff -black-threshold 50% RCrop_bt50.tiff
convert RCrop.tiff -black-threshold 1% -white-threshold 95% RCrop_btwt.tiff