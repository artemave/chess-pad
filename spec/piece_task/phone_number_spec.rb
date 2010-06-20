require File.dirname(__FILE__).sub(/\/spec\/.*/, '') + '/spec/spec_helper.rb'

require 'piece_task/phone_number'
require 'field/dialpad'
require 'piece/factory'

describe PieceTask::FindPhoneNumbers do

  describe 'valid phone number' do
    it 'should be ten digits long' do
      PieceTask::FindPhoneNumbers::VALID_PHONE_NUMBER[:length].should be 10
      PieceTask::FindPhoneNumbers::VALID_PHONE_NUMBER[:element].should == '\d'

      ('s'*10).should_not be_valid_phone_number
      ('*'*10).should_not be_valid_phone_number
      ('1'*11).should_not be_valid_phone_number
      ('1'*9).should_not be_valid_phone_number
      111111111.should_not be_valid_phone_number

      1234567777.should be_valid_phone_number
      '1234567777'.should be_valid_phone_number
    end
  end

  it 'should collect all valid phone numbers for a piece' do
    t = PieceTask::FindPhoneNumbers.new(
      :piece => 'pawn',
      :start_at => 8,
      :field => Field::DialPad.new
    )
    PieceTask::FindPhoneNumbers::VALID_PHONE_NUMBER[:length] = 3

    res = t.run!
    res.should == ["888","885","855","852","822","821","823","826","825","824","828","820"]
    
    PieceTask::FindPhoneNumbers::VALID_PHONE_NUMBER[:length] = 10
  end
end
