require 'minitest/autorun'
require 'csv'
require_relative '../lib/init.rb'


describe 'Information Gain Behavior' do


  before do
    @data = [['N','Y','N','Y','Y'],['Y','Y','N','N','Y'],['Y','Y','Y','N','Y']]
    @class_label = ['Y','Y','N','Y','Y']
    @attributes = ['Has Credit Account','Reads Reviews','Is Previous Customer']

    @gain = DecisionTree::Gain.new
  end

  it 'should calculate information gain' do
    gain = @gain.gain(4,1)
    gain.must_equal 0.722
  end

  # Test information gain of splitting Has Credit Account
  it 'should calculate the entropy of dimention[Has Credit Account]' do
    entropy = @gain.entropy(@data[0],@class_label)
    entropy.must_equal 0.971
  end

  it 'should calculate the information_gain of splitting[Has Credit Account]' do
    information_gain = @gain.information_gain(@data[0],@class_label)
    information_gain.must_equal 0.015
  end

end
