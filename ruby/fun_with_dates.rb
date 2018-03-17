#!/usr/bin/env ruby
# frozen_string_literal: true

#
# A thing to calculate the whole days between 2 dates.
# Not the start date, not the end.
#
#

MONTHS = [
  0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
].freeze

def monthstodays(month)
  days = 0
  (1...month).each do |a|
    days += MONTHS[a]
  end
  days
end

def yearstodays(year)
  days = (year - 1900) * 365
  days + (year - 1900) / 4
end

def leapdays(year1, year2)
  if year2 > year1
    ((year1 - 1900) / 4) - ((year2 - 1900) / 4)
  else
    ((year2 - 1900) / 4) - ((year1 - 1900) / 4)
  end
end

date1 = ARGV[0].split('/')
date1 = date1.map(&:to_i)
date2 = ARGV[1].split('/')
date2 = date2.map(&:to_i)

days1 = yearstodays(date1[2]) + monthstodays(date1[1]) + date1[0]
days2 = yearstodays(date2[2]) + monthstodays(date2[1]) + date2[0]

days = if days2 > days1
         days2 - days1 - 1
       else
         days1 - days2 - 1
       end

days = 0 if days.negative?

puts days
