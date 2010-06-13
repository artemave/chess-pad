require File.dirname(__FILE__).sub(/\/spec\/.*/, '') + '/spec/spec_helper.rb'

require 'field/dialpad'

describe Field::DialPad do
  it 'should have 12 elements' do
    Field::DialPad.new.elements.keys.size.should == 12
  end

  describe 'elements' do
    before do
      @dialpad = Field::DialPad.new
    end

    it 'should be digits, * and #' do
      @dialpad.elements.keys.find {|e| e =~ /[^\d*#]/}.should be nil
    end

    it 'should be layed out like a phone dialpad' do
      @dialpad[:x => @dialpad['1'].x,     :y => @dialpad['1'].y + 1].should be nil
      @dialpad[:x => @dialpad['1'].x + 1, :y => @dialpad['1'].y + 1].should be nil
      @dialpad[:x => @dialpad['1'].x + 1, :y => @dialpad['1'].y].should     == 2
      @dialpad[:x => @dialpad['1'].x + 1, :y => @dialpad['1'].y - 1].should == 5
      @dialpad[:x => @dialpad['1'].x,     :y => @dialpad['1'].y - 1].should == 4
      @dialpad[:x => @dialpad['1'].x - 1, :y => @dialpad['1'].y - 1].should be nil
      @dialpad[:x => @dialpad['1'].x - 1, :y => @dialpad['1'].y].should     be nil
      @dialpad[:x => @dialpad['1'].x - 1, :y => @dialpad['1'].y + 1].should be nil

      @dialpad[:x => @dialpad['2'].x,     :y => @dialpad['2'].y + 1].should be nil
      @dialpad[:x => @dialpad['2'].x + 1, :y => @dialpad['2'].y + 1].should be nil
      @dialpad[:x => @dialpad['2'].x + 1, :y => @dialpad['2'].y].should     == 3
      @dialpad[:x => @dialpad['2'].x + 1, :y => @dialpad['2'].y - 1].should == 6
      @dialpad[:x => @dialpad['2'].x,     :y => @dialpad['2'].y - 1].should == 5
      @dialpad[:x => @dialpad['2'].x - 1, :y => @dialpad['2'].y - 1].should == 4
      @dialpad[:x => @dialpad['2'].x - 1, :y => @dialpad['2'].y].should     == 1
      @dialpad[:x => @dialpad['2'].x - 1, :y => @dialpad['2'].y + 1].should be nil

      @dialpad[:x => @dialpad['3'].x,     :y => @dialpad['3'].y + 1].should be nil
      @dialpad[:x => @dialpad['3'].x + 1, :y => @dialpad['3'].y + 1].should be nil
      @dialpad[:x => @dialpad['3'].x + 1, :y => @dialpad['3'].y].should     be nil
      @dialpad[:x => @dialpad['3'].x + 1, :y => @dialpad['3'].y - 1].should be nil
      @dialpad[:x => @dialpad['3'].x,     :y => @dialpad['3'].y - 1].should == 6
      @dialpad[:x => @dialpad['3'].x - 1, :y => @dialpad['3'].y - 1].should == 5
      @dialpad[:x => @dialpad['3'].x - 1, :y => @dialpad['3'].y].should     == 2
      @dialpad[:x => @dialpad['3'].x - 1, :y => @dialpad['3'].y + 1].should be nil

      @dialpad[:x => @dialpad['4'].x,     :y => @dialpad['4'].y + 1].should == 1
      @dialpad[:x => @dialpad['4'].x + 1, :y => @dialpad['4'].y + 1].should == 2
      @dialpad[:x => @dialpad['4'].x + 1, :y => @dialpad['4'].y].should     == 5
      @dialpad[:x => @dialpad['4'].x + 1, :y => @dialpad['4'].y - 1].should == 8
      @dialpad[:x => @dialpad['4'].x,     :y => @dialpad['4'].y - 1].should == 7
      @dialpad[:x => @dialpad['4'].x - 1, :y => @dialpad['4'].y - 1].should be nil
      @dialpad[:x => @dialpad['4'].x - 1, :y => @dialpad['4'].y].should     be nil
      @dialpad[:x => @dialpad['4'].x - 1, :y => @dialpad['4'].y + 1].should be nil

      @dialpad[:x => @dialpad['5'].x,     :y => @dialpad['5'].y + 1].should == 2
      @dialpad[:x => @dialpad['5'].x + 1, :y => @dialpad['5'].y + 1].should == 3
      @dialpad[:x => @dialpad['5'].x + 1, :y => @dialpad['5'].y].should     == 6
      @dialpad[:x => @dialpad['5'].x + 1, :y => @dialpad['5'].y - 1].should == 9
      @dialpad[:x => @dialpad['5'].x,     :y => @dialpad['5'].y - 1].should == 8
      @dialpad[:x => @dialpad['5'].x - 1, :y => @dialpad['5'].y - 1].should == 7
      @dialpad[:x => @dialpad['5'].x - 1, :y => @dialpad['5'].y].should     == 4
      @dialpad[:x => @dialpad['5'].x - 1, :y => @dialpad['5'].y + 1].should == 1

      @dialpad[:x => @dialpad['6'].x,     :y => @dialpad['6'].y + 1].should == 3
      @dialpad[:x => @dialpad['6'].x + 1, :y => @dialpad['6'].y + 1].should be nil
      @dialpad[:x => @dialpad['6'].x + 1, :y => @dialpad['6'].y].should     be nil
      @dialpad[:x => @dialpad['6'].x + 1, :y => @dialpad['6'].y - 1].should be nil
      @dialpad[:x => @dialpad['6'].x,     :y => @dialpad['6'].y - 1].should == 9
      @dialpad[:x => @dialpad['6'].x - 1, :y => @dialpad['6'].y - 1].should == 8
      @dialpad[:x => @dialpad['6'].x - 1, :y => @dialpad['6'].y].should     == 5
      @dialpad[:x => @dialpad['6'].x - 1, :y => @dialpad['6'].y + 1].should == 2

      @dialpad[:x => @dialpad['7'].x,     :y => @dialpad['7'].y + 1].should == 4
      @dialpad[:x => @dialpad['7'].x + 1, :y => @dialpad['7'].y + 1].should == 5
      @dialpad[:x => @dialpad['7'].x + 1, :y => @dialpad['7'].y].should     == 8
      @dialpad[:x => @dialpad['7'].x + 1, :y => @dialpad['7'].y - 1].should == 0
      @dialpad[:x => @dialpad['7'].x,     :y => @dialpad['7'].y - 1].should == '*'
      @dialpad[:x => @dialpad['7'].x - 1, :y => @dialpad['7'].y - 1].should be nil
      @dialpad[:x => @dialpad['7'].x - 1, :y => @dialpad['7'].y].should     be nil
      @dialpad[:x => @dialpad['7'].x - 1, :y => @dialpad['7'].y + 1].should be nil

      @dialpad[:x => @dialpad['8'].x,     :y => @dialpad['8'].y + 1].should == 5
      @dialpad[:x => @dialpad['8'].x + 1, :y => @dialpad['8'].y + 1].should == 6
      @dialpad[:x => @dialpad['8'].x + 1, :y => @dialpad['8'].y].should     == 9
      @dialpad[:x => @dialpad['8'].x + 1, :y => @dialpad['8'].y - 1].should == '#'
      @dialpad[:x => @dialpad['8'].x,     :y => @dialpad['8'].y - 1].should == 0
      @dialpad[:x => @dialpad['8'].x - 1, :y => @dialpad['8'].y - 1].should == '*'
      @dialpad[:x => @dialpad['8'].x - 1, :y => @dialpad['8'].y].should     == 7
      @dialpad[:x => @dialpad['8'].x - 1, :y => @dialpad['8'].y + 1].should == 4

      @dialpad[:x => @dialpad['9'].x,     :y => @dialpad['9'].y + 1].should == 6
      @dialpad[:x => @dialpad['9'].x + 1, :y => @dialpad['9'].y + 1].should be nil
      @dialpad[:x => @dialpad['9'].x + 1, :y => @dialpad['9'].y].should     be nil
      @dialpad[:x => @dialpad['9'].x + 1, :y => @dialpad['9'].y - 1].should be nil
      @dialpad[:x => @dialpad['9'].x,     :y => @dialpad['9'].y - 1].should == '#'
      @dialpad[:x => @dialpad['9'].x - 1, :y => @dialpad['9'].y - 1].should == 0
      @dialpad[:x => @dialpad['9'].x - 1, :y => @dialpad['9'].y].should     == 8
      @dialpad[:x => @dialpad['9'].x - 1, :y => @dialpad['9'].y + 1].should == 5

      @dialpad[:x => @dialpad['*'].x,     :y => @dialpad['*'].y + 1].should == 7
      @dialpad[:x => @dialpad['*'].x + 1, :y => @dialpad['*'].y + 1].should == 8
      @dialpad[:x => @dialpad['*'].x + 1, :y => @dialpad['*'].y].should     == 0
      @dialpad[:x => @dialpad['*'].x + 1, :y => @dialpad['*'].y - 1].should be nil
      @dialpad[:x => @dialpad['*'].x,     :y => @dialpad['*'].y - 1].should be nil
      @dialpad[:x => @dialpad['*'].x - 1, :y => @dialpad['*'].y - 1].should be nil
      @dialpad[:x => @dialpad['*'].x - 1, :y => @dialpad['*'].y].should     be nil
      @dialpad[:x => @dialpad['*'].x - 1, :y => @dialpad['*'].y + 1].should be nil

      @dialpad[:x => @dialpad['0'].x,     :y => @dialpad['0'].y + 1].should == 8
      @dialpad[:x => @dialpad['0'].x + 1, :y => @dialpad['0'].y + 1].should == 9
      @dialpad[:x => @dialpad['0'].x + 1, :y => @dialpad['0'].y].should     == '#'
      @dialpad[:x => @dialpad['0'].x + 1, :y => @dialpad['0'].y - 1].should be nil
      @dialpad[:x => @dialpad['0'].x,     :y => @dialpad['0'].y - 1].should be nil
      @dialpad[:x => @dialpad['0'].x - 1, :y => @dialpad['0'].y - 1].should be nil
      @dialpad[:x => @dialpad['0'].x - 1, :y => @dialpad['0'].y].should     == '*'
      @dialpad[:x => @dialpad['0'].x - 1, :y => @dialpad['0'].y + 1].should == 7

      @dialpad[:x => @dialpad['#'].x,     :y => @dialpad['#'].y + 1].should == 9
      @dialpad[:x => @dialpad['#'].x + 1, :y => @dialpad['#'].y + 1].should be nil
      @dialpad[:x => @dialpad['#'].x + 1, :y => @dialpad['#'].y].should     be nil
      @dialpad[:x => @dialpad['#'].x + 1, :y => @dialpad['#'].y - 1].should be nil
      @dialpad[:x => @dialpad['#'].x,     :y => @dialpad['#'].y - 1].should be nil
      @dialpad[:x => @dialpad['#'].x - 1, :y => @dialpad['#'].y - 1].should be nil
      @dialpad[:x => @dialpad['#'].x - 1, :y => @dialpad['#'].y].should     == 0
      @dialpad[:x => @dialpad['#'].x - 1, :y => @dialpad['#'].y + 1].should == 8

    end
  end

end
