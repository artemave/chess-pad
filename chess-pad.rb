#!/usr/bin/ruby

require 'pp'

$:.unshift(File.dirname(__FILE__) + '/lib')
require 'field/dialpad'
require 'task/phone_number'
require 'piece'

piece, pos = *ARGV

dialpad = Field::DialPad.new

puts "Phone numbers for #{piece} starting at #{pos}: "
pp PieceTask::PhoneNumber.new(
  :piece => Piece::Factory.new(piece),
  :field => dialpad,
  :start_at => dialpad.elements[pos]
).run

puts "There are " + PieceTask::PhoneNumber.new(
  :piece => Piece::Factory.new('queen'),
  :field => dialpad,
  :start_at => dialpad.elements[5]
).run.length + " phone numbers for Queen starting at 5"

