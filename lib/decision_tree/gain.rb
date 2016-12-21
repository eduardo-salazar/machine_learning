
module DecisionTree

  class Gain

    # Calculate entropy of target
    # information gain equals to entropy of target minus entropy of splitting the attribute
    # ig = E(t) - E(T,X)
    # information_gain = entropy_target - net_gain
    def information_gain(attr, labels)
      table = frequency_table attr, labels
      target = table.header_target_attribute.map do |key|
        table.sum_target(key)
      end

      entropy_target = gain(target)

      splitting_gain = []
      sum_target = table.header_target_attribute.inject(0) {|sum,key| sum + table.sum_target(key)}
      net_gain = 0.0
      table.header_target_attribute.each_with_index do |key,index|
        net_gain += (table.sum_target(key).to_f/sum_target.to_f) * gain(table.values[index])
      end


      information_gain = entropy_target - net_gain

      information_gain
    end

    # To calculate entropy we have to check how many yes and how many no
    def entropy(attr,labels)
      # check binary attributes
      mapped = parse_attr(attr)
      if mapped.keys.size == 2
        #Binary attributes
        return gain([mapped.values[0],mapped.values[1]])
      end
    end


    # Calculate the gain value
    def gain(array)
      sum = array.inject(0) {|sum,x| sum + x }
      gain = 0.0
      array.each do |num|
        gain += (num.to_f/sum.to_f) * calcLog2(num.to_f/sum.to_f)
      end
      return -gain.round(3)
    end

    private
    def frequency_table (data_target, data_class_label)
      return FrequencyTable.new(data_target,data_class_label)
    end

    def parse_attr(array)
      result = {}
      array.each do |key|
        if result.key?(key)
          result[key] += 1
        else
          result[key] = 1
        end
      end
      result
    end

    def calcLog2(value)
      if(value <= 0)
        return 0.0
      end
      return Math.log10(value) / Math.log10(2.0)
    end

  end

end
