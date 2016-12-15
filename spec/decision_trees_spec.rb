require 'minitest/autorun'
require_relative 'spec_helper.rb'

describe 'Decision Trees Behavior' do
  before do
    @dt = DecisionTree.new(DECISIONTREE_TESTING_DATA)
  end

  it 'should calculate entropy' do
    gain = @dt.gain(2,3)
    gain > 0
  end

  # it 'should return a decision tree' do
  #   dt.wont_be_nil
  # end
  #
  # it 'should return decision tree with node' do
  #   dt.size > 0
  # end
end
