#!/usr/bin/ruby

require 'pp'

$:.unshift(File.dirname(__FILE__) + '/lib')
require 'field/dialpad'
require 'piece_task/phone_number'

piece, pos = *ARGV

dialpad = Field::DialPad.new

puts "Phone numbers for #{piece} starting at #{pos}: "
res = PieceTask::FindPhoneNumbers.new(
  :piece => piece,
  :field => dialpad,
  :start_at => dialpad.elements[pos]
).run!

pp res
puts "Total: #{res.length}"

#puts "There are " + PieceTask::FindPhoneNumbers.new(
#  :piece => 'queen',
#  :field => dialpad,
#  :start_at => dialpad.elements[5]
#).run!.length + " phone numbers for Queen starting at 5"

