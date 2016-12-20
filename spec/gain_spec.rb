require 'minitest/autorun'
require 'csv'
require_relative '../lib/init.rb'


describe 'Decision Trees Behavior' do
  before do
    @dt = DecisionTree::Gain.new
  end

  it 'should calculate information gain' do
    gain = @dt.gain(4,1)
    gain.must_equal 0.722
  end

end
