require File.dirname(__FILE__).sub(/\/spec\/.*/, '') + '/spec/spec_helper.rb'

require 'field/base'

describe Field::ElementSet do
  before do
    @es = Field::ElementSet.new
  end

  it 'should be a kind of Hash' do
    @es.should be_a_kind_of(Hash)
  end

  it 'should not allow assigning by []=' do
    lambda {@es['*'] = 5}.should raise_error
  end

  describe 'when adds an element' do
    it 'should validate presence of val' do
      lambda {@es.add(:x => 1, :y => 1)}.should raise_error
    end

    it 'should validate presence of x' do
      lambda {@es.add(:val => '1', :y => 1)}.should raise_error
    end

    it 'should validate presence of y' do
      lambda {@es.add(:val => '1', :x => 1)}.should raise_error
    end

    it 'should not allow to add different elements with the same coordinates' do
      @es.add(:val => '#', :x => 2, :y => 3)

      lambda {@es.add(:val => '*', :x => 2, :y => 3)}.should raise_error
      lambda {@es.add(:val => '#', :x => 2, :y => 3)}.should_not raise_error
    end

    it 'should set container to self for new element' do
      @es.add(:val => '#', :x => 2, :y => 3)

      @es['#'].container.should be @es
    end
  end

  describe 'when looks for element' do
    before do
      @es.add(:val => '1', :x => 1, :y => 1)
      @es.add(:val => '#', :x => 2, :y => 1)
    end

    it 'should lookup by either string or digit key' do
      @es[1].should be @es['1']
    end

    it 'should allow lookup by coordinates' do
      @es[:x => 1, :y => 1].should be @es[1]
    end

    it 'should freak out if either coordinate is missing' do
      lambda {@es[:x => 1]}.should raise_error
      lambda {@es[:y => 1]}.should raise_error
    end

    it 'may reduce my daily rate since you actually bothered reading to this point' do
    end

    it 'should return nil if element not found' do
      @es[5].should be nil
    end
  end
end
