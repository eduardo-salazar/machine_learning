
module DecisionTree

  class Gain

    # Calculate entropy of target
    # information gain equals to entropy of target minus entropy of splitting the attribute
    # ig = E(t) - E(T,X)
    def information_gain(attr, labels)
      e_target = entropy(attr,labels)
      e_target
    end

    # To calculate entropy we have to check how many yes and how many no
    def entropy(attr,labels)
      # check binary attributes
      mapped = parse_attr(attr)
      if mapped.keys.size == 2
        #Binary attributes
        return gain(mapped.values[0],mapped.values[1])
      end
    end


    # Calculate the gain value
    def gain(positive, negative)
      sum = positive + negative
      gain = (positive.to_f/sum.to_f) * calcLog2(positive.to_f/sum.to_f) + (negative.to_f/sum.to_f)* calcLog2(negative.to_f/sum.to_f)
      return -gain.round(3)
    end

    private
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
