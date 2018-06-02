#!/sbin/sh
#
# Copyright (C) 2012 The Android Open Source Project
# Copyright (C) 2016 The OmniROM Project
# Copyright (C) 2018 Choose-A project
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

OUTFD=$( xargs -0 < /proc/${PPID}/cmdline | awk '{print $3}' ) 2>/dev/null

ui_print() {
    if [ "${OUTFD}" != "" ]; then
        echo -e "ui_print ${1} " 1>&/proc/self/fd/$OUTFD;
    else
        echo -e "${1}";
    fi;
}

# check mounts
check_mount() {
    local MOUNT_POINT=$(readlink "${1}");
    if ! test -n "${MOUNT_POINT}" ; then
        # readlink does not work on older recoveries for some reason
        # doesn't matter since the path is already correct in that case
        echo "Using non-readlink mount point ${1}";
        MOUNT_POINT="${1}";
    fi
    if ! grep -q "${MOUNT_POINT}" /proc/mounts ; then
        mkdir -p "${MOUNT_POINT}";
        if ! mount -t "${3}" "${2}" "${MOUNT_POINT}" ; then
             echo "Cannot mount ${1} (${MOUNT_POINT}).";
             exit 1;
        fi
    fi
}

# Check the vendor firmware version flashed on ODM
whichoem=$(\
    getprop ro.odm.expect.version | \
    sed -r 's/^[^_]*_([^-]*)_.*$/\1/' | \
    sed -e 's/_/-/g' | \
    sed -e 's/\./-/g'
);


# check partitions
check_mount /odm /dev/block/bootdevice/by-name/oem ext4;

# Check the vendor firmware version flashed on ODM
if [ ! -f /odm/odm_version.prop ]
then
    ui_print "NO CHANGES MADE."
    ui_print
    ui_print "NO OEMBINARIES INSTALLED. ABORTING!"
    ui_print "FIRST INSTALL OEMBINARIES"
    ui_print "CHECK THE README INCLUDED IN THIS ZIP"
    ui_print "GO TO THE WEBSITE AND OBTAIN, AND FLASH!"
    ui_print
    ui_print "MAKE SURE YOU OBTAIN:"
    ui_print
    ui_print "https://developer.sony.com/file/download/"
    ui_print "software-binaries-for-aosp-oreo-"
    ui_print "android-8-1-kernel-${whichoem}"
    ui_print
    ui_print "WITHOUT THIS, YOUR DEVICE WILL"
    ui_print "!!!!! NOT BOOT !!!!! NOT BOOT !!!!!"
    ui_print
    ui_print "NO CHANGES MADE."
    sleep 5;
    exit 1;
fi
exit 0
