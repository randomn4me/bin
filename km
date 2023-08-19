#!/usr/bin/python3

import datetime
import sys
import tabulate
import math


def usage(program_name):
    print(f'Usage: {program_name} <km-goal>')
    sys.exit(1)


def days_since_start(date):
    return (today - datetime.date(today.year, 1, 1)).days


def days_in_year(date):
    year = date.year
    return (datetime.date(year+1, 1, 1) - datetime.date(year, 1, 1)).days


def km_per_day(km_goal, date):
    return int(km_goal / days_in_year(date)) + 1


if len(sys.argv) < 2:
    usage(sys.argv[0])

km_goal = int(sys.argv[1])

today = datetime.date.today()
should_have_ridden = km_per_day(km_goal, today) * days_since_start(today)

data = [
    ('Days this year', days_in_year(today)),
    ('Days preceding', days_since_start(today)),
    ('km goal', sys.argv[1]),
    ('km per day', km_per_day(km_goal, today)),
    ('should have ridden', should_have_ridden)
]

if len(sys.argv) > 2:
    km_ridden = int(sys.argv[2])
    need_to_ride = km_goal - km_ridden
    days_to_end = days_in_year(today) - days_since_start(today)
    data.append(('km left', need_to_ride))
    data.append(('km per day to still reach goal',
                 math.ceil(need_to_ride / days_to_end)))

print(tabulate.tabulate(data))
