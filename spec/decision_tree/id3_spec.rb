require 'minitest/autorun'
require 'csv'
require_relative '../init.rb'


describe 'Decision ID3 behavior' do
  before do
    @data = [['N','Y','N','Y','Y'],['Y','Y','N','N','Y'],['Y','Y','Y','N','Y']]
    @class_label = ['Y','Y','N','Y','Y']
    @attributes = ['Has Credit Account','Reads Reviews','Is Previous Customer']
    @id3 = DecisionTree::ID3.new(@attributes,@class_label,@data)
  end

  it 'should inititalize id3 class with correct values' do
    tree = @id3.tree
    tree.wont_be_nil
  end

  it 'should label testing example as Y' do
    label = @id3.label(["Y","N","N"])
    label.must_equal "Y"
  end

  it 'should label testing example as N' do
    label = @id3.label(["N","N","Y"])
    label.must_equal "N"
  end

end
