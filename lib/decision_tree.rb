
class DecisionTree

  def initialize(file)
    # Read File
  end

  # Calculate the gain value
  def gain(positive, negative)
    sum = positive + negative
    gain = (positive.to_f/sum.to_f) * calcLog2(positive.to_f/sum.to_f) + (negative.to_f/sum.to_f)* calcLog2(negative.to_f/sum.to_f)
    return -gain.round(3)
  end

  private
  def calcLog2(value)
    if(value <= 0)
      return 0.0
    end
    return Math.log10(value) / Math.log10(2.0)
  end

end
