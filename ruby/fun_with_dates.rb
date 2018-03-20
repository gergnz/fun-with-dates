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

def leapyear(year)
  ((year % 4).zero? && !(year % 100).zero?) || (year % 400).zero?
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
def leapdays(date2, date1)
  # date2 is the highest, date 1 is the lowest
  days = 0
  if date2[2] == date1[2] ## Are years the same?
    days += 1 if date2[1] > 2 && date1[1] < 2 # Jan to March +
    days += 1 if date2[1] == 2 && date2[0] == 29 # Feb 29 upper
    days += 1 if date1[1] == 2 && date1[0] == 29 # Feb 29 lower
    days += 1 if date2[1] > 2 && date1[1] == 2 && date1[0] < 29 # Feb - March+
  end
  if date2[2] > date1[2]
    days += 1 if date2[1] > 2 && leapyear(date2[2]) # Upper March +
    days += 1 if date1[1] < 2 && leapyear(date1[2]) # Lower Jan
    days += 1 if date1[1] == 2 && date1[0] < 29 && leapyear(date1[2])

    # Now deal with all the years, except the first and last
    (date1[2] + 1..date2[2] - 1).each do |y|
      days += 1 if leapyear(y)
    end
  end
  days
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

if $PROGRAM_NAME == __FILE__
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
end
