#!/sbin/sh

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

