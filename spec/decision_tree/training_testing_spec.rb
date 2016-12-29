require 'minitest/autorun'
require 'csv'
require_relative '../init.rb'

describe 'Training and Testing dataset check' do

  it 'check that training data format has correct column information' do
    i = 0
    CSV.foreach(DECISIONTREE_TRAINING_DATA) do |row|
      if i == 0
        row[0].include? 'placement'
        row[1].include? 'pricing'
        row[2].include? 'eye_level'
        row[3].include? 'customer_purcharse'
        i += 1
      end
    end
  end

  it 'should check that training data is filled with data' do
    CSV.foreach(DECISIONTREE_TRAINING_DATA) do |row|
      row[0].wont_be_empty
      row[1].wont_be_empty
      row[2].wont_be_empty
      row[3].wont_be_empty
      row[4].wont_be_empty
    end
  end

  it 'shoudl check that testing data has question mark for class label' do
    i = 0
    CSV.foreach(DECISIONTREE_TESTING_DATA) do |row|
      if i > 0
        row[0].wont_be_empty
        row[1].wont_be_empty
        row[2].wont_be_empty
        row[3].wont_be_empty
        row[4].include? '?'
      end
      i=+1
    end
  end

end
