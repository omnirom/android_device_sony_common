#!/vendor/bin/sh
# HACK: Little helper script to set default neversleep option
# Runs at boot on sys.boot_completed=1

# Check if set by user via ExtendedSettings, takes precedence:
_persist_neversleep=$(getprop persist.vendor.neversleep)
# ...or if enabled by default board config:
_default_neversleep=$(getprop vendor.neversleep.default)
if [ $_persist_neversleep = "true" ]; then
    setprop vendor.neversleep.trigger true
    log -t "neversleep" -p w "HACK: Deep Sleep disabled"
elif [ $_persist_neversleep = "false" ]; then
    setprop vendor.neversleep.trigger false
    log -t "neversleep" -p w "Deep Sleep enabled"
elif [$_default_neversleep = "true" ]; then
    setprop vendor.neversleep.trigger true
    log -t "neversleep" -p w "HACK: Deep Sleep disabled"
fi
