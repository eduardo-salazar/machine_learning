require 'minitest/autorun'
require 'csv'
require_relative '../lib/init.rb'


describe 'Tree Behavior' do

  it 'should create a tree with two childs' do
    tree = DecisionTree::SimpleTree.new("ROOT")
    tree.add_to("ROOT", "Child1")
    tree.add_to("ROOT", "Child2")
    tree.children.size.must_equal 2
  end
end
