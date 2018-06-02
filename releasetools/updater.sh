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

succestest() {
    ui_print "#######################################"
    ui_print "### OEM Binaries Version up to date ###"
    ui_print "#######################################"
    sleep 5;
}

failtest() {
    ui_print "#######################################"
    ui_print "#  PLEASE BEWARE YOU DONOT HAVE THE   #"
    ui_print "#  (CURRENT) OEM BINARIES VERSION     #"
    ui_print "#  INSTALLED!                         #"
    ui_print "#=====================================#"
    ui_print "#  NOT HAVING THIS INSTALLED COULD    #"
    ui_print "#  CAUSE UNEXPECTED AND UNWANTED      #"
    ui_print "#  BEHAVIOUR. GET YOUR COPY OF THE    #"
    ui_print "#  LATEST OEM BINARIES AT:            #"
    ui_print "#  https://developer.sony.com/deve    #"
    ui_print "#  lop/open-devices/guides/aosp-bu    #"
    ui_print "#  ild-instructions                   #"
    ui_print "#  AND FOLLOW INSTRUCTIONS ON LINKED  #"
    ui_print "#  PAGES. ALTERNATIVELY CHECK THE     #"
    ui_print "#  README THAT IS INCLUDED IN THE     #"
    ui_print "#  ZIP YOU ARE INSTALLING THIS        #"
    ui_print "#  ROM FROM                           #"
    ui_print "#######################################"
    sleep 5;
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

# check partitions
check_mount /lta-label /dev/block/bootdevice/by-name/LTALabel ext4;
check_mount /odm /dev/block/bootdevice/by-name/oem ext4;

# Check the vendor firmware version flashed on ODM
expectedoem=$(\
    getprop ro.odm.expect.version | \
    sed s/.*_// | \
    sed s/_.*_// \
);

oemversion=$(\
    cat /odm/odm_version.prop | \
    grep ro.vendor.version | \
    sed s/.*=// \
);

if [[ "$oemversion" == "$expectedoem" ]]
then
    succestest
else
    failtest
fi

ui_print
ui_print "Current Oem Binaries version: ${oemversion}"
ui_print "Expected Oem Binaries version: ${expectedoem}"

# Detect the exact model from the LTALabel partition
# This looks something like:
# 1284-8432_5-elabel-D5303-row.html
variant=$(\
    ls /lta-label/*.html | \
    sed s/.*-elabel-// | \
    sed s/-.*.html// | \
    tr -d '\n\r' | \
    tr '[a-z]' '[A-Z]' \
);

ui_print "Device variant: ${variant}";

# Set the variant as a prop
if [ ! -f /odm/build.prop ]
then
    touch /odm/build.prop;
    $(echo "ro.sony.variant=${variant}" >> /odm/build.prop);
    chmod 0644 /odm/build.prop;
fi

exit 0
