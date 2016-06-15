/*
   Copyright (c) 2015, The CyanogenMod Project
   Copyright (c) 2016, The OmniROM Project

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

struct _variant {
    char device[PROP_VALUE_MAX];
    int is_dualsim;
    int is_lte;
} variants[] = {
// KITAKAMI
    //Ivy
    {"E6533", 1, 1},
    {"E6553", 0, 1},
    // Karin
    {"SGP771", 0, 1},
    // Karin Windy
    {"SGP712", 0, 0},
    // Satsuki
    {"E6833", 1, 1},
    {"E6853", 0, 1},
    {"E6883", 1, 1},
    // Sumire
    {"E6603", 0, 1},
    {"E6633", 1, 1},
    {"E6653", 0, 1},
    {"E6683", 1, 1},
    // Suzuran
    {"E5803", 0, 1},
    {"E5823", 0, 1},
// LOIRE
    // Dora
    {"F8131", 0, 1},
    {"F8132", 1, 1},
    // Suzu
    {"F5121", 0, 1},
    {"F5122", 1, 1},
    // Tuba
    {"F3111", 0, 1},
    {"F3112", 1, 1},
    {"F3113", 0, 1},
    {"F3115", 0, 1},
    {"F3116", 1, 1},
    // Ukulele
    {"F3211", 0, 1},
    {"F3212", 1, 1},
    {"F3213", 0, 1},
    {"F3215", 0, 1},
    {"F3216", 1, 1},
// RHINE
    // Amami
    {"D5503", 0, 1},
    // Honami
    {"C6902", 0, 1},
    {"C6903", 0, 1},
    {"C6906", 0, 1},
    {"C6943", 0, 1},
    {"C6916", 0, 1},
// SHINANO
    // Aries
    {"D5803", 0, 1},
    {"D5833", 0, 1},
    // Castor
    {"SGP511", 0, 0},
    {"SGP512", 0, 0},
    {"SGP521", 0, 1},
    {"SGP511", 0, 1},
    {"SGP541", 0, 1},
    {"SGP551", 0, 1},
    {"SGP561", 0, 1},
    // Leo
    {"D6603", 0, 1},
    {"D6616", 0, 1},
    {"D6633", 1, 1},
    {"D6643", 0, 1},
    {"D6646", 0, 1},
    {"D6653", 0, 1},
    {"D6683", 1, 1},
    {"D6708", 0, 1},
    // Scorpion
    {"SGP611", 0, 0},
    {"SGP612", 0, 0},
    {"SGP621", 0, 1},
    {"SGP641", 0, 1},
    // Sirius
    {"D6502", 0, 1},
    {"D6503", 0, 1},
    {"D6543", 0, 1},
// YUKON
    // Eagle
    {"D2302", 1, 0},
    {"D2303", 0, 1},
    {"D2305", 0, 0},
    {"D2306", 0, 1},
    {"D2403", 0, 1},
    {"D2406", 0, 1},
    // Flamingo
    {"D2202", 0, 1},
    {"D2212", 1, 1},
    {"D2203", 0, 1},
    {"D2206", 0, 1},
    {"D2243", 0, 1},
    // Seagull
    {"D5102", 0, 1},
    {"D5103", 0, 1},
    {"D5106", 0, 1},
    // Tianchi
    {"D5303", 0, 1},
    {"D5306", 0, 1},
    {"D5316", 0, 1},
    {"D5322", 1, 1},
};
