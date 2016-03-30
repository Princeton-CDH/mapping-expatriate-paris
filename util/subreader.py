import csv
import datetime
import argparse

class Subscription:
    def __init__(self, start,stype,persid, duration):
        self.persid = persid
        self.stype  = stype
        year,month,day = [int(x) for x in start.split('-')]
        try:
            self.start = datetime.date(year, month,day)
        except ValueError:
            "do something"
        self.duration = float(duration)

    def end(self):
        return self.start + datetime.timedelta(self.duration * 30)

class Subscriptions:
    def __init__(self, fname):
        self.sublist = []
        with open(fname, 'rb') as csvfile:
            next(csvfile)       # skip header row
            csvreader = csv.reader(csvfile)
            for row in csvreader:
                self.sublist.append(Subscription(row[0], row[1], row[2], row[4]))

    def range(self,start,end):
        return [sub for sub in self.sublist if sub.end() > start and sub.start < end]


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-src", "--srcfile")
    args = parser.parse_args()

    if args.srcfile:
        subscriptions = Subscriptions(args.srcfile)
        years = set()
        for subscription in subscriptions.sublist:
            years.add(subscription.start.year)
        for year in sorted(years):
            actives = subscriptions.range(datetime.date(year,1,1), datetime.date(year,12,31))
            print "{},{}".format(year, len(actives))
