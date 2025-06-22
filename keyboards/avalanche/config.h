// Copyright 2022 Will Winder (@winder)
// SPDX-License-Identifier: GPL-2.0-or-later

#pragma once

#    define RGBLIGHT_DEFAULT_MODE RGBLIGHT_MODE_RAINBOW_SWIRL+2

#ifdef OLED_ENABLE
#    define OLED_DISPLAY_128X64
#    define OLED_TIMEOUT 5000
#endif

#define PRODUCT "Lanche"
// #define MATRIX_ROWS 4
// #define MATRIX_COLS 6
// #define NO_DEBUG
// #define NO_PRINT
#define NO_ACTION_TAPPING
#define NO_ACTION_ONESHOT
#define TAPPING_TERM 200
#define LEADER_TIMEOUT 300
#define ONESHOT_TIMEOUT 300
#define RGBLIGHT_LAYERS 3
