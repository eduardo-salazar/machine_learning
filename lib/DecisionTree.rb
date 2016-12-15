
class DecisionTree
  def initialize(file)
    # Read File
  end

  # Calculate the gain value
  def gain(positive, negative)
    sum = positive + negative
    gain = (positive * calcLog2(positive/sum)/sum) + (negative * calcLog2(negative/sum)/sum)
    return -gain
  end

  private
  def calcLog2(value)
    if(value <= 0)
      return 0
    end
    return Math.log10(value) / Math.log10(2)
  end

end
