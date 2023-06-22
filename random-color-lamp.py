# SPDX-FileCopyrightText: 2023 Dave Putz
#
# SPDX-License-Identifier: MIT

import board
import neopixel
import time
import random


led_pin = board.GP28  # NeoPixel LED strand is connected to GPIO #28
n_pixels = 39  # Number of pixels you are using

strip = neopixel.NeoPixel(led_pin, n_pixels, brightness=.1, auto_write=True)
r=random.randint(0,255)
g=random.randint(0,255)
b=random.randint(0,255)
# set starting colorwheel
for i in range(0, len(strip)):
    strip[i] = [r,g,b]

while True:
# pick next color
    r=random.randint(0,255)
    g=random.randint(0,255)
    b=random.randint(0,255)
    # slowly change colors
    for i in range(0, len(strip)):
        strip[i] = [r,g,b]
        time.sleep(.1)
    print(r,g,b)
    time.sleep(.1)