"""
256-color xterm conversion utilities.
"""
# Wladimir van der Laan, 2011

import sys

# whole colortable, filled in later
colortable = None

# the 6 value iterations in the xterm color cube
valuerange = [ 0x00, 0x5F, 0x87, 0xAF, 0xD7, 0xFF ]

# 16 basic ANSI colors + lighter variants
# these can be different depending on the terminal settings,
# so do not use them when converting from RGB.
basic16 = [
    [ 0x00, 0x00, 0x00 ], # 0
    [ 0xCD, 0x00, 0x00 ], # 1
    [ 0x00, 0xCD, 0x00 ], # 2
    [ 0xCD, 0xCD, 0x00 ], # 3
    [ 0x00, 0x00, 0xEE ], # 4
    [ 0xCD, 0x00, 0xCD ], # 5
    [ 0x00, 0xCD, 0xCD ], # 6
    [ 0xE5, 0xE5, 0xE5 ], # 7
    [ 0x7F, 0x7F, 0x7F ], # 8
    [ 0xFF, 0x00, 0x00 ], # 9
    [ 0x00, 0xFF, 0x00 ], # 10
    [ 0xFF, 0xFF, 0x00 ], # 11
    [ 0x5C, 0x5C, 0xFF ], # 12
    [ 0xFF, 0x00, 0xFF ], # 13
    [ 0x00, 0xFF, 0xFF ], # 14
    [ 0xFF, 0xFF, 0xFF ]  # 15
]

# Closest color on RGB color cube (from valuerange)
closest6 = [
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3,
    3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
    3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
    3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
    4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
    4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5,
    5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]

def _color_dist(c, rgb):
    """
   Return squared Euclidian distance of rgb to color `c`
   in the color table.
   """
    d0 = colortable[c][0] - rgb[0]
    d1 = colortable[c][1] - rgb[1]
    d2 = colortable[c][2] - rgb[2]
    return d0*d0 + d1*d1 + d2*d2

def to_rgb(color):
    """
    Convert a xterm256 color value (0-255) to 3 unsigned chars RGB
    tuple.
    """
    rgb = [0,0,0]
    if color < 16:
        # 16 basic colors
        rgb[0] = basic16[color][0]
        rgb[1] = basic16[color][1]
        rgb[2] = basic16[color][2]
    elif color >= 16 and color <= 231:
        # color cube color
        color -= 16
        rgb[0] = valuerange[(color/36)%6]
        rgb[1] = valuerange[(color/6)%6]
        rgb[2] = valuerange[color%6]
    elif color >= 232 and color <= 255:
        # gray tone
        rgb[0] = rgb[1] = rgb[2] = 8+(color-232)*0x0a

    return rgb

def from_rgb(rgb):
    """
   Convert RGB tuple to xterm256 color value (0-255).
   """
    # Optimized algorithm to find the xterm256 color with Euclidian closest distance to a
    # provided RGB value: as the palette consists of an independent 6x6x6 RGB cube
    # and a 24 grey tone scale, determine the closest color in both palettes, then
    # from these two return the on that's closest to the requested RGB color.

    # Compute closest color on 6x6x6 RGB cube
    r = [closest6[x] for x in rgb]
    b = 16 + r[0]*36 + r[1]*6 + r[2]

    # Compute closest point on greyscale line
    greyscale = sum(rgb)
    r = (greyscale-9) / 30
    c = 232 + max(min(r,23),0)

    # Return RGB cube or greyscale color depending
    # on which is closest.
    distb = _color_dist(b, rgb)
    distc = _color_dist(c, rgb)
    if distb <= distc:
        color = b
    else:
        color = c

    return color

colortable = [to_rgb(c) for c in xrange(0, 256)]

if len(sys.argv) == 2:
    arg = sys.argv[1]
    color = map(int, arg.split(','))
    print(from_rgb(color))

# USAGE:

# colors= [
#     [30, 154, 224],
#     [255, 58, 131],
#     [239, 233, 0],
#     [255, 170, 0],
#     [246, 240, 128],
#     [101, 186, 58],
#     [157, 243, 159],
#     [157, 243, 159],
#     [235, 147, 154],
#     [158, 255, 255],
#     [137, 150, 168]
# ]

# for c in colors:
#     print(from_rgb(c))
