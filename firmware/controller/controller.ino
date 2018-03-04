/*
 * This file is part of the UnnaturalLight project.
 *
 * Copyright (C) 2018 Matthew Lai <m@matthewlai.ca>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

const int kHysteresis = 2;
const int kHysteresisStepSize = 1; // per control period
const int kControlPeriodMs = 3;

const int kPower1Pin = 9;
const int kPower2Pin = 10;

const int kSwitchADCChannel = 0;
const int kPowerADCChannel = 1;
const int kColourADCChannel = 2;

// We reduce potentiometer range by this much on both ends because
// some shitty potentiometers can't go all the way to 0 and Vcc.
const int kSaturation = 20;

// These are power settings after hyesteresis, but before filtering
unsigned int power_1_hys = 0;
unsigned int power_2_hys = 0;

// These are power settings after filtering (and are the PWM settings)
unsigned int power_1_pwm = 0;
unsigned int power_2_pwm = 0;

// true = up, false = down
bool power_1_dir = true;
bool power_2_dir = true;

// Maps [kSaturation, 255 - kSaturation] to [0, 255].
unsigned int saturate(unsigned int x) {
  if (x < kSaturation) {
    return 0;
  } else if (x > (255 - kSaturation)) {
    return 255;
  } else {
    long range = 255 - (2 * kSaturation);
    return (x - kSaturation) * 255 / range;
  }
}

// if abs(new_x - old_x) >= kHysteresis, we return new_x
// otherwise, we return new_x if new_x - old_x is in the right direction
// otherwise, we return old_x
// dir is updated depending on the sign of new_x - old_x
unsigned int apply_hysteresis(unsigned int old_x, unsigned int new_x, bool& dir) {
  bool new_dir = (new_x > old_x);
  if (abs(new_x - old_x) > kHysteresis) {
    dir = new_dir;
    return new_x;
  } else if (new_dir == dir) {
    return new_x;
  } else {
    return old_x;
  }
}

unsigned int apply_filter(unsigned int old_x, unsigned int new_x) {
  if (new_x < old_x) {
    return old_x - min(kHysteresisStepSize, old_x - new_x);
  } else if (new_x > old_x) {
    return old_x + min(kHysteresisStepSize, new_x - old_x);
  } else {
    return old_x;
  }
}

void setup() {
  // Pin 13 is connected to the annoying 'L' LED. Turn it off.
  pinMode(13, OUTPUT);
  digitalWrite(13, LOW);

  pinMode(kPower1Pin, OUTPUT);
  pinMode(kPower2Pin, OUTPUT);

  analogWrite(kPower1Pin, 0);
  analogWrite(kPower2Pin, 0);

  // We are using pins 9, 10 on timer1.
  // Arduino defaults to ~488Hz, which is very low. It creates flicker in photography,
  // and produces inductor whine in power adapter.
  // We have dedicated gate drivers, so let's go much faster!
  // This sets it to 31.25kHz (the fastest atmega328p can do)
  TCCR1B &= 0b11111001;  

  Serial.begin(115200);
}

void loop() {
  bool  = analogRead(kSwitchADCChannel) < 512;
  unsigned int power_setting = saturate(255 - (analogRead(kPowerADCChannel) / 4));
  unsigned int colour_setting = saturate(255 - (analogRead(kColourADCChannel) / 4));

  // Switch override
  if (!switch_setting) {
    power_setting = 0;
  }

  unsigned int new_power_1 = power_setting * colour_setting / 255;
  unsigned int new_power_2 = power_setting - new_power_1;

  // Apply hysteresis
  power_1_hys = apply_hysteresis(power_1_hys, new_power_1, power_1_dir);
  power_2_hys = apply_hysteresis(power_2_hys, new_power_2, power_2_dir);

  // Apply filter
  power_1_pwm = apply_filter(power_1_pwm, power_1_hys);
  power_2_pwm = apply_filter(power_2_pwm, power_2_hys);
  
  analogWrite(kPower1Pin, power_1_pwm);
  analogWrite(kPower2Pin, power_2_pwm);
  
  delay(kControlPeriodMs);
}
