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
            "\033[48;5;17m",  # dark blue
            lambda time: astral.sun.dawn(observer, time.date(), tzinfo=time.tzinfo, depression=astral.Depression.ASTRONOMICAL),
            "\033[48;5;19m",  # med blue
            lambda time: astral.sun.dawn(observer, time.date(), tzinfo=time.tzinfo, depression=astral.Depression.CIVIL),
            "\033[48;5;166m",  # orange
            lambda time: astral.sun.sunrise(observer, time.date(), tzinfo=time.tzinfo),
            "\033[48;5;220m",  # yellow
            lambda time: astral.sun.noon(observer, time.date(), tzinfo=time.tzinfo),
            "\033[48;5;220m",  # yellow
            lambda time: astral.sun.sunset(observer, time.date(), tzinfo=time.tzinfo),
            "\033[48;5;166m",  # orange
            lambda time: astral.sun.dusk(observer, time.date(), tzinfo=time.tzinfo, depression=astral.Depression.CIVIL),
            "\033[48;5;19m",  # med blue
            lambda time: astral.sun.dusk(observer, time.date(), tzinfo=time.tzinfo, depression=astral.Depression.ASTRONOMICAL),
            "\033[48;5;17m",  # dark blue
        ]

    def color(self, time):
        # Grab the color code just before the NEXT transition
        current_color = None
        for item in self.zones:
            if isinstance(item, str):
                current_color = item
            elif isinstance(item, types.FunctionType):
                if item(time) > time:
                    break

        if current_color is None:
            print("First element of the zones table was not a color string. You goofed the multi-type list, what a surprise", file=sys.stderr)
            sys.exit(1)

        return current_color

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

        time = t_start
        color = Color.RESET
        if t_end < now:
            continue
        elif t_start < now < t_end:
            time = now
            color = Color.BRIGHT_GREEN + Color.BOLD
        elif (t_start - now).days > 0:  # only show 24 hours in the future
            break

        time_str = to_12_hour(time.time())
        sky_color = sunrise_colors.color(time)
        temp_f = period["temperature"]
        bar = '-'*int(max(0, temp_f-32))  # lol when does it go below freezing in the bay area
        print(f"{color}  {time_str} {sky_color}  {Color.RESET}{color} |{bar} {temp_f}")

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


