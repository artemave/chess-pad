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

    it 'should be aligned like a phone dialpad' do
      @dialpad['1'].neighbours[:n].should be nil
      @dialpad['1'].neighbours[:ne].should be nil
      @dialpad['1'].neighbours[:e].should == 2
      @dialpad['1'].neighbours[:se].should == 5
      @dialpad['1'].neighbours[:s].should == 4
      @dialpad['1'].neighbours[:sw].should be nil
      @dialpad['1'].neighbours[:w].should be nil
      @dialpad['1'].neighbours[:nw].should be nil

      @dialpad['2'].neighbours[:n].should be nil
      @dialpad['2'].neighbours[:ne].should be nil
      @dialpad['2'].neighbours[:e].should == 3
      @dialpad['2'].neighbours[:se].should == 6
      @dialpad['2'].neighbours[:s].should == 5
      @dialpad['2'].neighbours[:sw].should == 4
      @dialpad['2'].neighbours[:w].should == 1
      @dialpad['2'].neighbours[:nw].should be nil

      @dialpad['3'].neighbours[:n].should be nil
      @dialpad['3'].neighbours[:ne].should be nil
      @dialpad['3'].neighbours[:e].should be nil
      @dialpad['3'].neighbours[:se].should be nil
      @dialpad['3'].neighbours[:s].should == 6
      @dialpad['3'].neighbours[:sw].should == 5
      @dialpad['3'].neighbours[:w].should == 2
      @dialpad['3'].neighbours[:nw].should be nil

      @dialpad['4'].neighbours[:n].should == 1
      @dialpad['4'].neighbours[:ne].should == 2
      @dialpad['4'].neighbours[:e].should == 5
      @dialpad['4'].neighbours[:se].should == 8
      @dialpad['4'].neighbours[:s].should == 7
      @dialpad['4'].neighbours[:sw].should be nil
      @dialpad['4'].neighbours[:w].should be nil
      @dialpad['4'].neighbours[:nw].should be nil

      @dialpad['5'].neighbours[:n].should == 2
      @dialpad['5'].neighbours[:ne].should == 3
      @dialpad['5'].neighbours[:e].should == 6
      @dialpad['5'].neighbours[:se].should == 9
      @dialpad['5'].neighbours[:s].should == 8
      @dialpad['5'].neighbours[:sw].should == 7
      @dialpad['5'].neighbours[:w].should == 4
      @dialpad['5'].neighbours[:nw].should == 1

      @dialpad['6'].neighbours[:n].should == 3
      @dialpad['6'].neighbours[:ne].should be nil
      @dialpad['6'].neighbours[:e].should be nil
      @dialpad['6'].neighbours[:se].should be nil
      @dialpad['6'].neighbours[:s].should == 9
      @dialpad['6'].neighbours[:sw].should == 8
      @dialpad['6'].neighbours[:w].should == 5
      @dialpad['6'].neighbours[:nw].should == 2

      @dialpad['7'].neighbours[:n].should == 4
      @dialpad['7'].neighbours[:ne].should == 5
      @dialpad['7'].neighbours[:e].should == 8
      @dialpad['7'].neighbours[:se].should == 0
      @dialpad['7'].neighbours[:s].should == '*'
      @dialpad['7'].neighbours[:sw].should be nil
      @dialpad['7'].neighbours[:w].should be nil
      @dialpad['7'].neighbours[:nw].should be nil

      @dialpad['8'].neighbours[:n].should == 5
      @dialpad['8'].neighbours[:ne].should == 6
      @dialpad['8'].neighbours[:e].should == 9
      @dialpad['8'].neighbours[:se].should == '#'
      @dialpad['8'].neighbours[:s].should == 0
      @dialpad['8'].neighbours[:sw].should == '*'
      @dialpad['8'].neighbours[:w].should == 7
      @dialpad['8'].neighbours[:nw].should == 4

      @dialpad['9'].neighbours[:n].should == 6
      @dialpad['9'].neighbours[:ne].should be nil
      @dialpad['9'].neighbours[:e].should be nil
      @dialpad['9'].neighbours[:se].should be nil
      @dialpad['9'].neighbours[:s].should == '#'
      @dialpad['9'].neighbours[:sw].should == 0
      @dialpad['9'].neighbours[:w].should == 8
      @dialpad['9'].neighbours[:nw].should == 5

      @dialpad['*'].neighbours[:n].should == 7
      @dialpad['*'].neighbours[:ne].should == 8
      @dialpad['*'].neighbours[:e].should == 0
      @dialpad['*'].neighbours[:se].should be nil
      @dialpad['*'].neighbours[:s].should be nil
      @dialpad['*'].neighbours[:sw].should be nil
      @dialpad['*'].neighbours[:w].should be nil
      @dialpad['*'].neighbours[:nw].should be nil

      @dialpad['0'].neighbours[:n].should == 8
      @dialpad['0'].neighbours[:ne].should == 9
      @dialpad['0'].neighbours[:e].should == '#'
      @dialpad['0'].neighbours[:se].should be nil
      @dialpad['0'].neighbours[:s].should be nil
      @dialpad['0'].neighbours[:sw].should be nil
      @dialpad['0'].neighbours[:w].should == '*'
      @dialpad['0'].neighbours[:nw].should == 7

      @dialpad['#'].neighbours[:n].should == 9
      @dialpad['#'].neighbours[:ne].should be nil
      @dialpad['#'].neighbours[:e].should be nil
      @dialpad['#'].neighbours[:se].should be nil
      @dialpad['#'].neighbours[:s].should be nil
      @dialpad['#'].neighbours[:sw].should be nil
      @dialpad['#'].neighbours[:w].should == 0
      @dialpad['#'].neighbours[:nw].should == 8

    end
  end

end
