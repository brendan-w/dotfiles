#!/usr/bin/env python3
from pprint import pprint
import os
import sys
import requests
import argparse
import json
import datetime
import astral
import astral.sun
import types

class Color:
    BLACK = '\033[30m'
    RED = '\033[31m'
    GREEN = '\033[32m'
    YELLOW = '\033[33m' # orange on some systems
    BLUE = '\033[34m'
    MAGENTA = '\033[35m'
    CYAN = '\033[36m'
    LIGHT_GRAY = '\033[37m'
    DARK_GRAY = '\033[90m'
    BRIGHT_RED = '\033[91m'
    BRIGHT_GREEN = '\033[92m'
    BRIGHT_YELLOW = '\033[93m'
    BRIGHT_BLUE = '\033[94m'
    BRIGHT_MAGENTA = '\033[95m'
    BRIGHT_CYAN = '\033[96m'
    WHITE = '\033[97m'

    BOLD = '\033[1m'
    RESET = '\033[0m' # called to return to standard terminal text color

def to_12_hour(time):
    if time.hour == 0:
        return f"12:{time.minute:02d} AM"
    elif time.hour < 12:
        return f"{time.hour: >2}:{time.minute:02d} AM"
    elif time.hour == 12:
        return f"{time.hour: >2}:{time.minute:02d} PM"
    else:
        return f"{time.hour - 12: >2}:{time.minute:02d} PM"

class SunriseColors:
    def __init__(self, lat, lon, alt):
        observer = astral.Observer(latitude=lat, longitude=lon, elevation=alt)

        # Do as I say, not as I do
        #
        # This table contains a sequence of datetime-producing lambdas,
        # and the color string we wish to display for all timestamps in between.
        # The first element MUST be a color string. Lambda are used instead of
        # lookups at now() because this passively handles lookups for tomorrow.
        self.zones = [
            "17",  # dark blue
            lambda time: astral.sun.dawn(observer, time.date(), tzinfo=time.tzinfo, depression=astral.Depression.ASTRONOMICAL),
            "19",  # med blue
            lambda time: astral.sun.dawn(observer, time.date(), tzinfo=time.tzinfo, depression=astral.Depression.CIVIL),
            "166",  # orange
            lambda time: astral.sun.sunrise(observer, time.date(), tzinfo=time.tzinfo),
            # "220",  # yellow
            # lambda time: astral.sun.noon(observer, time.date(), tzinfo=time.tzinfo),
            "220",  # yellow
            lambda time: astral.sun.sunset(observer, time.date(), tzinfo=time.tzinfo),
            "166",  # orange
            lambda time: astral.sun.dusk(observer, time.date(), tzinfo=time.tzinfo, depression=astral.Depression.CIVIL),
            "19",  # med blue
            lambda time: astral.sun.dusk(observer, time.date(), tzinfo=time.tzinfo, depression=astral.Depression.ASTRONOMICAL),
        ]
        self.bar_chars = ['█','▇','▆','▅','▄','▃','▂','▁']

    def wrapping_zone_lookup(self, i):
        return self.zones[i % len(self.zones)]

    def color(self, t_start, t_end):
        """
        Accepts an arbitrary time search between [t_start, t_end) and returns colors
        representing the status of the sun in the sky.

        ex. search        [  ]
        ex. search                      [  ]
        sun sched     |--a--|-b-|--c--|----d----|
        where | is a transition time, and a,b,c are colors between transitions

        returns: (a, |, b)
        """
        i = 1
        while i < len(self.zones):  # sane limit
            # scan through sets of sun pattterns:
            #    --p--|--n--|
            #         c     n
            prev_color = self.wrapping_zone_lookup(i-1)
            curr_item = self.wrapping_zone_lookup(i)
            next_color = self.wrapping_zone_lookup(i+1)
            next_item = self.wrapping_zone_lookup(i+2)
            assert isinstance(prev_color, str)
            assert isinstance(curr_item, types.FunctionType)
            assert isinstance(next_color, str)
            assert isinstance(next_item, types.FunctionType)

            # takes the "t_start" just for the date
            curr_time = curr_item(t_start)
            next_time = next_item(t_start)

            # handle wrapping cleanly. next_time should always be after curr_time
            if next_time < curr_time:
                # re-run the sun computation for tomorrow
                next_time = next_item(t_start + datetime.timedelta(days=1))

            # search: [  ]
            # search: [      ]
            # sun:    --|--|
            if (t_start <= curr_time < t_end):
                # search: [      ]
                # sun:    --|--|
                if (t_start < next_time <= t_end):
                    # Note that this is an ambiguous case where there are more than two transitions
                    # within the search, technically yeilding 3 colors. We just retain the two largest
                    # colors, and average the two transitions into one. Our box-draw characters can only
                    # display a single transition with foreground and background colors.

                    # eliminate the smallest of the three colors
                    # search: [         ]
                    # sun:    -a-|-b-|-c-

                    second_next_color = self.wrapping_zone_lookup(i+3)
                    assert isinstance(second_next_color, str)

                    zones = [
                        # (start, end, color)
                        (t_start, curr_time, prev_color),  # a
                        (curr_time, next_time, next_color),  # b
                        (next_time, t_end, second_next_color)  # c
                    ]

                    # Get the index of the zone with the smallest duration
                    smallest = 0
                    smallest_size = zones[0][1] - zones[0][0]
                    for i, (start, end, color) in enumerate(zones):
                        size = end - start
                        if size < smallest_size:
                            smallest = i
                            smallest_size = size

                    # delete that index
                    del zones[smallest]

                    # It's possible we deleted the middle index, so we compute the average in this case
                    # [ ]-->|<--[ ]
                    #   a       b
                    zone_a = zones[0]
                    zone_b = zones[1]
                    transition_time = zone_a[1] + ((zone_b[0] - zone_a[1]) / 2)

                    return (zone_a[2], transition_time, zone_b[2])
                else:
                    # search: [  ]
                    # sun:    --|--|
                    return (prev_color, curr_time, next_color)

            # The following cases report regions of a single solid color. In these cases,
            # we report the transition as being exactly t_start, and put the color in the
            # "next" slot. This is just a nuance of the box-char drawing below.

            # search: [  ]
            # sun:       --|--|
            if (t_end < curr_time):
                return (prev_color, t_start, prev_color)

            # search:     [  ]
            # sun:    --|------|
            if (curr_time < t_start) and (next_time > t_end):
                return (next_color, t_start, next_color)

            # skip to the next sun transition
            i += 2

        assert False

    def get_box_chars(self, t_start, t_end):
        prev_color, time_of_transition, next_color = self.color(t_start, t_end)

        # [0.0, 1.0)
        normalized_transition = (time_of_transition - t_start) / (t_end - t_start)

        # The box-drawing characters we have are in eights, so we need to chose the closes index from this table
        bar_index = round(normalized_transition / (1.0 / len(self.bar_chars))) % len(self.bar_chars)
        char = self.bar_chars[bar_index]

        prev_color = f"\033[48;5;{prev_color}m"  # background
        next_color = f"\033[38;5;{next_color}m"  # foreground
        return f"{prev_color}{next_color}{char}{char}{Color.RESET}"


def get_weather(lat, lon, alt):
    # Lookup the weather.gov station and grid offsets for the given lat/lon
    resp = requests.get(url=f"https://api.weather.gov/points/{lat},{lon}")
    weather_api_url = resp.json()["properties"]["forecastHourly"]

    # Lookup the weather
    weather_api_url = weather_api_url + "?units=us"
    resp = requests.get(url=weather_api_url)
    data = resp.json()

    now = datetime.datetime.now().astimezone()

    sunrise_colors = SunriseColors(lat, lon, alt)

    for period in data["properties"]["periods"]:
        t_start = datetime.datetime.fromisoformat(period["startTime"])
        t_end = datetime.datetime.fromisoformat(period["endTime"])

        color = Color.RESET
        if t_end < now:
            continue
        elif t_start <= now < t_end:
            t_start = now
            color = Color.BRIGHT_GREEN + Color.BOLD
        elif (t_start - now).days > 0:  # only show 24 hours in the future
            break

        time_str = to_12_hour(t_start.time())
        sky_chars = sunrise_colors.get_box_chars(t_start, t_end)
        temp_f = period["temperature"]
        bar = '-'*int(max(0, temp_f-32))  # lol when does it go below freezing in the bay area
        print(f"{color}  {time_str} {sky_chars}{color} |{bar} {temp_f}")

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--lat", type=float, required=True, help="Your latitude")
    parser.add_argument("--lon", type=float, required=True, help="Your longitude")
    parser.add_argument("--alt", type=float, default=0.0, help="Your elevation")
    args = parser.parse_args()

    get_weather(args.lat, args.lon, args.alt)
    return 0


if __name__ == "__main__":
    sys.exit(main())


