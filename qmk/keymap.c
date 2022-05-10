/* Copyright 2015-2021 Jack Humbert
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include QMK_KEYBOARD_H
#include "muse.h"

enum preonic_layers {
  _QWERTY,
  _LOWER,
  _RAISE,
  _ADJUST
};

enum preonic_keycodes {
  QWERTY = SAFE_RANGE,
  LOWER,
  RAISE,
  BACKLIT
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

/* Qwerty
 * ,-----------------------------------------------------------------------------------.
 * |   `  |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  | Bksp |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Tab  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  | "    |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Esc  |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  |Enter |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift|   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  |RtShft|
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Ctrl | GUI  | Alt  |  FN  |Lower |    Space    |Raise | Mute | Vol- | Vol+ |PrnScn|
 * `-----------------------------------------------------------------------------------'
 */
[_QWERTY] = LAYOUT_preonic_grid(
  KC_GRV,  KC_1,    KC_2,    KC_3,  KC_4,  KC_5,   KC_6,   KC_7,  KC_8,    KC_9,    KC_0,    KC_BSPC,
  KC_TAB,  KC_Q,    KC_W,    KC_E,  KC_R,  KC_T,   KC_Y,   KC_U,  KC_I,    KC_O,    KC_P,    KC_QUOT,
  KC_ESC,  KC_A,    KC_S,    KC_D,  KC_F,  KC_G,   KC_H,   KC_J,  KC_K,    KC_L,    KC_SCLN, KC_ENT,
  KC_LSFT, KC_Z,    KC_X,    KC_C,  KC_V,  KC_B,   KC_N,   KC_M,  KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT,
  KC_LCTL, KC_LGUI, KC_LALT, MO(1), LOWER, KC_SPC, KC_SPC, TT(2), KC_MUTE, KC_VOLD, KC_VOLU, KC_PSCR
),

/* Lower
 * ,-----------------------------------------------------------------------------------.
 * |   `  |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |  F7  |  F8  |  F9  |  F10 | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Tab  |   *  |   @  |   ^  |   %  |      |      |   -  |   =  |   \  |      |      |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Caps |   $  |   #  |   @  |   !  |      |   [  |   (  |   )  |   ]  |      |  '   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift|      |      |      |      |      | Home | PgDn | PgUp | End  |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |RtCtrl| F11  |RtCtl | Del  |Lower |     F12     |Raise | Left | Down |  Up  | Rght |
 * `-----------------------------------------------------------------------------------'
 */
[_LOWER] = LAYOUT_preonic_grid(
  KC_GRV,         KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_TRNS,
  KC_TRNS,        KC_ASTR, KC_AMPR, KC_CIRC, KC_PERC, KC_NO,   KC_NO,   KC_MINS, KC_EQL,  KC_BSLS, KC_NO,   KC_NO,
  KC_CAPS,        KC_DLR,  KC_HASH, KC_AT,   KC_EXLM, KC_NO,   KC_LBRC, KC_LPRN, KC_RPRN, KC_RBRC, KC_NO,   KC_QUOT,
  KC_TRNS,        KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_HOME, KC_PGDN, KC_PGUP, KC_END,  KC_NO,   KC_TRNS,
  LCA_T(KC_RCTL), KC_F11,  KC_RCTL, KC_DEL,  KC_TRNS, KC_F12,  KC_F12,  KC_TRNS, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT
),

/* Raise
 * ,-----------------------------------------------------------------------------------.
 * |      |      |      |      |      |      |      |      |   /  |   *  |   -  |  -   |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |  Up  |      |      |      |      |   7  |   8  |   9  |  +   |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Esc  |      | Left | Down | Right|      |      |      |   4  |   5  |   6  |  +   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |      |      |      |      |      |      |      |   1  |   2  |   3  | Ent  |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Ctrl | OS   | LAlt |  Fn  | Lower|    Space    | Raise|   0  |   .  | Calc | Ent  |
 * `-----------------------------------------------------------------------------------'
 */
[_RAISE] = LAYOUT_preonic_grid(
  KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO,    KC_PSLS, KC_PAST, KC_PMNS, KC_PMNS,
  KC_NO,   KC_NO,   KC_NO,   KC_UP,   KC_NO,   KC_NO,   KC_NO, KC_NO,    KC_7,    KC_8,    KC_9,    KC_PPLS,
  KC_TRNS, KC_NO,   KC_LEFT, KC_DOWN, KC_RGHT, KC_NO,   KC_NO, KC_NO,    KC_4,    KC_5,    KC_6,    KC_PPLS,
  KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO,   KC_NO, KC_NO,    KC_1,    KC_2,    KC_3,    KC_ENT,
  KC_LCTL, KC_LGUI, KC_LALT, MO(1),   KC_TRNS, KC_SPC,  KC_SPC, KC_TRNS, KC_0,    KC_DOT,  KC_CALC, KC_ENT
),

/* Adjust (Lower + Raise)
 * ,-----------------------------------------------------------------------------------.
 * |      |      |      |      |      |      |      |TermOf|TermOn|      |      |KC_PWR|
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      | Reset| Debug|      |      |      |      |KC_BRU|KC_BRD|      |      |      |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |      |      |Aud cy|Aud on|AudOff|AGnorm|AGswap|RGB_TG|RGB_VI|RGB_VD|      |      |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |Voice-|Voice+|Mus on|MusOff|MidiOn|MidOff|RGB_MD|      |      |      |KC_SLK|
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      |BL_TOG|BL_DEC|BL_INC|KC_NUM|
 * `-----------------------------------------------------------------------------------'
 */
[_ADJUST] = LAYOUT_preonic_grid(
  _______, _______, _______, _______, _______, _______, _______, TERM_ON, TERM_OFF, _______, _______, KC_PWR,
  _______, RESET,   DEBUG,   _______, _______, _______, _______, KC_BRIU, KC_BRID,  _______, _______, _______,
  _______, _______, MU_MOD,  AU_ON,   AU_OFF,  AG_NORM, AG_SWAP, RGB_TOG, RGB_VAI,  RGB_VAD, _______, _______,
  _______, MUV_DE,  MUV_IN,  MU_ON,   MU_OFF,  MI_ON,   MI_OFF,  RGB_MOD, _______,  _______, _______, KC_SLCK,
  _______, _______, _______, _______, _______, _______, _______, _______, BL_TOGG,  BL_DEC,  BL_INC,  KC_NUM
)


};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case LOWER:
      if (record->event.pressed) {
        layer_on(_LOWER);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      } else {
        layer_off(_LOWER);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      }
      return false;
    case RAISE:
      if (record->event.pressed) {
        layer_on(_RAISE);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      } else {
        layer_off(_RAISE);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      }
      return false;
    case BACKLIT:
      if (record->event.pressed) {
        register_code(KC_RSFT);
        #ifdef BACKLIGHT_ENABLE
          backlight_step();
        #endif
        #ifdef RGBLIGHT_ENABLE
          rgblight_step();
        #endif
        #ifdef __AVR__
        writePinLow(E6);
        #endif
      } else {
        unregister_code(KC_RSFT);
        #ifdef __AVR__
        writePinHigh(E6);
        #endif
      }
      return false;
  }
    return true;
};

bool muse_mode = false;
uint8_t last_muse_note = 0;
uint16_t muse_counter = 0;
uint8_t muse_offset = 70;
uint16_t muse_tempo = 50;

bool encoder_update_user(uint8_t index, bool clockwise) {
  if (muse_mode) {
    if (IS_LAYER_ON(_RAISE)) {
      if (clockwise) {
        muse_offset++;
      } else {
        muse_offset--;
      }
    } else {
      if (clockwise) {
        muse_tempo+=1;
      } else {
        muse_tempo-=1;
      }
    }
  } else {
    if (clockwise) {
      register_code(KC_PGDN);
      unregister_code(KC_PGDN);
    } else {
      register_code(KC_PGUP);
      unregister_code(KC_PGUP);
    }
  }
    return true;
}

bool dip_switch_update_user(uint8_t index, bool active) {
    switch (index) {
        case 0:
            if (active) {
                layer_on(_ADJUST);
            } else {
                layer_off(_ADJUST);
            }
            break;
        case 1:
            if (active) {
                muse_mode = true;
            } else {
                muse_mode = false;
            }
    }
    return true;
}


void matrix_scan_user(void) {
#ifdef AUDIO_ENABLE
    if (muse_mode) {
        if (muse_counter == 0) {
            uint8_t muse_note = muse_offset + SCALE[muse_clock_pulse()];
            if (muse_note != last_muse_note) {
                stop_note(compute_freq_for_midi_note(last_muse_note));
                play_note(compute_freq_for_midi_note(muse_note), 0xF);
                last_muse_note = muse_note;
            }
        }
        muse_counter = (muse_counter + 1) % muse_tempo;
    } else {
        if (muse_counter) {
            stop_all_notes();
            muse_counter = 0;
        }
    }
#endif
}

bool music_mask_user(uint16_t keycode) {
  switch (keycode) {
    case RAISE:
    case LOWER:
      return false;
    default:
      return true;
  }
}
