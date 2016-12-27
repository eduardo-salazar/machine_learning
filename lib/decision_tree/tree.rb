require 'tree'
module DecisionTree
  class SimpleTree

    def initialize(root)
       @root_node = Tree::TreeNode.new(root, root)
    end

    def add_to(parent, element)
      node = find_node(parent)
      node << Tree::TreeNode.new(element, element)
    end

    def find_node(parent)
      result = nil
      @root_node.each do |node|
        if node.content == parent
          result = node
        end
      end
      result
    end

    def print
      @root_node.print_tree
    end

    def children
      @root_node.children
    end

  end
end
