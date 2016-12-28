module BayesianNetwork
  class Combination # :nodoc:
    include Enumerable

    def initialize(arr)
      @arr = arr
      @current = Array.new(arr.size, 0)
    end

    def each
      iterations = @arr.inject(1) {|product, element| product * element.size } - 1
      yield current
      iterations.times { yield self.next_combination }
    end

    def <=>(other)
      @current <=> other.current
    end

    def first
      @current.fill 0
    end

    def last
      @current.size.times {|i| @current[i] = @arr[i].size - 1 }
    end

    def current
      returnval = []
      @current.size.times {|i| returnval[i] = @arr[i][@current[i]] }
      returnval
    end

    def next_combination
      i = @current.size - 1
      @current.reverse.each do |e|
        if e == @arr[i].size - 1
          @current[i] = 0
        else
          @current[i] += 1
          break
        end
        i -= 1
      end
      current
    end

    def prev_combination
      i = @current.size - 1
      @current.reverse.each do |e|
        if e == 0
          @current[i] = @arr[i].size - 1
        else
          @current[i] -= 1
          break
        end
        i -= 1
      end
      current
    end
  end
end
