#!/usr/bin/env ruby
# frozen_string_literal: true

#
# A thing to calculate the whole days between 2 dates.
# Not the start date, not the end.
#
#
require 'date'

d1 = Date.parse(ARGV[0])
d2 = Date.parse(ARGV[1])

d = if d2 > d1
      (d2 - d1).to_i - 1
    else
      (d1 - d2).to_i - 1
    end

puts d
