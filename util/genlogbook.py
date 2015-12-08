#! /usr/bin/env python
'''
Created on October 8, 2015
@author: cwulfman
'''

import datetime
import calendar
import argparse

def gen_calendar(year):
    "Print a naive calendar for a given year, organized as TEI divs."
    c = calendar.Calendar()

    print "<div type='year'>"
    print "<head><date>%s</date></head>" % year
    for m in xrange(1,13):
        month = datetime.date(year,m,1)
        print "<div type='month' n='%i'>\n<head><date>%s</date></head>" % (m,month.strftime("%B"))
        for day in c.itermonthdates(year,m):
            print "<div type='day'>"
            print "<head><date when-iso='%s'>%s</date></head>" % (day,day)
            print "\n"
            print "</div>"
            
        print "</div>"
            
    print "</div>"


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-y", "--year", help="year of calendar to generate")
    args = parser.parse_args()

    if args.year:
        try:
            year_as_int = int(args.year)
            gen_calendar(year_as_int)
        except ValueError:
            print "not a valid date."
        
        
