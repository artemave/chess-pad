#!/usr/bin/ruby

require 'pp'
require 'field/dialpad'
require 'task/phone_number'

piece, pos = *ARGV

field = Field::DialPad.new

puts "Phone numbers for #{piece} starting at #{pos}:"
pp Task::PhoneNumber.new(
  :piece => piece,
  :field => field,
  :start_at => pos
).run

puts "Number of phones for Queen starting at 5 is " + Task::PhoneNumber.new(
  :piece => 'queen',
  :start_at => 5,
  :field => field
).run.length

