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
  (year - 1900) * 365
end

# rubocop:disable Metrics/AbcSize
def leapdays(date2, date1)
  days = 0
  if (date1[2] % 4).zero?
    days += 1 if date1[1] == 2
  end
  if (date2[2] % 4).zero?
    days -= 1 if date2[1] == 2
    days += 1 if date2[0] == 29
  end
  days + date2[2] / 4 - date1[2] / 4
end
# rubocop:enable Metrics/AbcSize

date1 = ARGV[0].split('/')
date1 = date1.map(&:to_i)
date2 = ARGV[1].split('/')
date2 = date2.map(&:to_i)

days1 = yearstodays(date1[2]) + monthstodays(date1[1]) + date1[0]
days2 = yearstodays(date2[2]) + monthstodays(date2[1]) + date2[0]

days = if days2 > days1
         x = days2 - days1 - 1
         x + leapdays(date2, date1)
       else
         x = days1 - days2 - 1
         x + leapdays(date1, date2)
       end

days = 0 if days.negative?

puts days
