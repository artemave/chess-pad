#!/usr/bin/ruby

require 'pp'

$:.unshift(File.dirname(__FILE__) + '/lib')
require 'field/dialpad'
require 'piece_task/phone_number'
require 'piece'

piece, pos = *ARGV

dialpad = Field::DialPad.new

puts "Phone numbers for #{piece} starting at #{pos}: "
pp PieceTask::FindPhoneNumbers.new(
  :piece => Piece::Factory.create(piece),
  :field => dialpad,
  :start_at => dialpad.elements[pos]
).run

puts "There are " + PieceTask::FindPhoneNumbers.new(
  :piece => Piece::Factory.create('queen'),
  :field => dialpad,
  :start_at => dialpad.elements[5]
).run.length + " phone numbers for Queen starting at 5"

