#! /usr/bin/env python
'''
Created on October 8, 2015
@author: cwulfman
'''

import datetime
import calendar

year = 1920
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
