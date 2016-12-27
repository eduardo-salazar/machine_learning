require 'tree'
module DecisionTree
  class SimpleTree

    def add_root(root, content)
      @root_node = Tree::TreeNode.new(root, content)
    end

    def root_node
      @root_node
    end

    def add_to(parent, element, content)
      node = find_node(parent)
      if element.instance_of? SimpleTree
        node << element.root_node
      else
        node << Tree::TreeNode.new(element, content)
      end
    end

    def find_node(parent)
      result = nil
      @root_node.each do |node|
        if node.name == parent
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
