/*
 * Copyright (C) 2016 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef __INIT_BOARD_DEVICE_H__
#define __INIT_BOARD_DEVICE_H__

#include "init_board_common.h"
#include "init_prototypes.h"

// Constants: AOSP Open Devices
#ifndef SYSFS_PATH_LED_RED
#define SYSFS_PATH_LED_RED   "/sys/class/leds/led:rgb_red/brightness"
#endif
#ifndef SYSFS_PATH_LED_GREEN
#define SYSFS_PATH_LED_GREEN "/sys/class/leds/led:rgb_green/brightness"
#endif
#ifndef SYSFS_PATH_LED_BLUE
#define SYSFS_PATH_LED_BLUE  "/sys/class/leds/led:rgb_blue/brightness"
#endif

// Class: init_board_device
class init_board_device : public init_board_common
{
};

#endif //__INIT_BOARD_DEVICE_H__
