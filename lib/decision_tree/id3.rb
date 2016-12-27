module DecisionTree
  class ID3

    def initialize(headers, class_label, matrix)
      @data = {
        "headers" => headers,
        "class_label" => class_label,
        "matrix" => matrix
      }
      @gain = DecisionTree::Gain.new
      @dt = run_id3(@data)
    end

    def tree
      @dt
    end

    def run_id3(data)
      # Choose First attribute to split
      dt = DecisionTree::SimpleTree.new
      information_gain = []
      data["headers"].each_with_index do |attr, index|
        information_gain.push(@gain.information_gain(data["matrix"][index],data["class_label"]))
      end
      # pick attribute with highest information gain
      index = get_highest_index information_gain
      dt.add_root(data['headers'][index],"attribute")

      # Get frequency_table of attribute splitted
      ft = FrequencyTable.new(data["matrix"][index],data["class_label"])
      ft.header_target_attribute.each do |target|
          dt.add_to(data['headers'][index],target,"option")
          # check if that option could be assigned to one class_label
          label = ft.leaf_class_label(target)
          if !label.empty?
            # assign leaf to option
            dt.add_to(target,label,"leaf")
          else
            # we need to split again
            new_data = Marshal.load( Marshal.dump(data) )
            new_data["headers"].delete_at(0)
            index_to_remove = []
            new_data["matrix"][0].each_with_index do |row, index|
              if row[0] != target
                index_to_remove.push(index)
              end
            end
            new_data["matrix"].delete_at(0)
            #remove row not belong to row
            index_to_remove.each do |index|
              new_data["matrix"].each { |col| col[index] = nil }
              new_data["class_label"][index] = nil
            end
            # Remove nil values
            new_data["matrix"].each { |col| col.compact! }
            new_data["class_label"].compact!
            dt.add_to(target,run_id3(new_data),"attribute")
          end
      end

      return dt
    end

    def label(array)
      label = classifie(@dt.root_node,array)
      label
    end

    def classifie(node,array)
      node.each do |val|
        if val.content == "attribute"
            value = get_value(array,val.name)
            # get children
            val.children.each do |option|
              if option.name == value
                #check if it has label as children
                if option.children[0].content == "leaf"
                  return option.children[0].name
                else
                  classifie(option,array)
                end
              end
            end
        end
      end
    end

    def get_value(array, node_name)
      @dt.root_node.each do |val|
        if node_name == val.name
          #find index
          index = @data["headers"].index(node_name)
          return array[index]
        end
      end
    end

    def get_highest_index(array)
      max = 0
      max_index = 0
      array.each_with_index do |ig, index|
        if ig > max
          max = ig
          max_index = index
        end
      end
      max_index
    end

  end
end
