/*
qmk compile -kb avalanche/v4 -km default -e CONVERT_TO=promicro_rp2040
qmk flash -kb avalanche/v4 -km default -e CONVERT_TO=promicro_rp2040
*/

#include QMK_KEYBOARD_H

enum layer {
    L_DEFAULT,
    L_NAV,
    L_NUM,
    L_SYM,
};

#define FN_1 MO(L_NAV)
#define FN_2 MO(L_NUM)
#define FN_3 MO(L_SYM)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [L_DEFAULT] = LAYOUT(
                 _______, KC_F1 ,  KC_F2 ,  KC_F3  , KC_F4  , KC_F5  ,                                     KC_F6  , KC_F7  , KC_F8  , KC_F9  , KC_F10 , KC_F11,
                 KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                                        KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC,
        KC_LCTL, KC_ESC,  KC_A,    KC_S,    KC_D,    KC_F,    KC_G,                                        KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT, KC_RBRC,
                 KC_BSLS, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_LSFT, KC_LALT, KC_INS,  KC_RCTL, KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RCTL,
                                            KC_MUTE, KC_LGUI, KC_SPC,  FN_1,    FN_2,    KC_RALT, KC_RSFT, KC_ENT,  KC_RCTL, KC_PSCR
    ),
    [L_NAV] = LAYOUT(
                 _______, KC_F12,  KC_F13,  KC_F14 , KC_F15 , KC_F16 ,                                     KC_F17 , KC_F18 , KC_F19 , KC_F20 , KC_F21 , KC_F22,
                 _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_BSPC,                                     KC_DEL,  KC_HOME, KC_END   KC_END,  KC_PGUP, XXXXXXX,
        _______, _______, KC_0,    KC_UNDS, KC_DLR,  KC_BSPC, KC_DEL,                                      KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, KC_PGDN, XXXXXXX, KC_F12,
                 _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, _______, _______, _______, _______, XXXXXXX, KC_PGUP, KC_PGDN, XXXXXXX, XXXXXXX, _______,
                                            _______, _______, _______, _______, _______, _______, _______, _______, _______, _______
    ),
    [L_NUM] = LAYOUT(
                 _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                                     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
                 _______, KC_0,    KC_1,    KC_2,    KC_3,    KC_BSPC,                                     KC_DEL,  KC_P7  , KC_P8,   KC_P9  , XXXXXXX, KC_LPRN,
        _______, _______, KC_0,    KC_4,    KC_5,    KC_6,    KC_DEL,                                      KC_BSPC, KC_P4 ,  KC_P5  , KC_P6  , XXXXXXX, XXXXXXX, KC_RPRN,
                 _______, KC_0,    KC_7,    KC_8,    KC_9,    KC_DOT,  _______, _______, _______, _______, XXXXXXX, KC_P1  , KC_P2  , KC_P3  , XXXXXXX, _______,
                                            _______, _______, _______, _______, _______, _______, _______, KC_P0  , KC_PDOT, _______
    ),
};


