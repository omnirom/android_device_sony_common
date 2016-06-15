#!/sbin/sh
#
# Copyright (C) 2012 The Android Open Source Project
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

# Detect the exact model from the LTALabel partition
# This looks something like:
# 1284-8432_5-elabel-D5303-row.html
mkdir -p /lta-label
mount -r -t ext4 /dev/block/bootdevice/by-name/LTALabel /lta-label
variant=`ls /lta-label/*.html | sed s/.*-elabel-// | sed s/-row.html// | tr -d '\n\r'`
umount /lta-label

# Set the variant as a prop
touch /system/vendor/build.prop
echo ro.fxp.variant=$variant >> /system/vendor/build.prop

if [ ! -e /dev/block/bootdevice/by-name/modem ] && [ -d /system/blobs/$variant/ ]; then
    # Remove default modem symlinks
    rm -rf /system/etc/firmware/mba*
    rm -rf /system/etc/firmware/modem*
    # Symlink the correct modem blobs
    basedir="/system/blobs/$variant/"
    cd $basedir
    find . -type f | while read file; do ln -s $basedir$file /system/etc/firmware/$file ; done
fi;

exit 0

