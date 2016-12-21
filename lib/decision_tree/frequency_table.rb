module DecisionTree
  class FrequencyTable
    attr_reader :header_class_label,:header_target_attribute,:values

    def initialize(data_target,data_class_label)
      @data_target = data_target
      @data_class_label = data_class_label
      @header_class_label = parse_attr(data_class_label).keys # THis contains the posible options of the class_label
      @header_target_attribute = parse_attr(data_target).keys # contains the possible options of the target attribute
      @values = Array.new(@header_target_attribute.size) { Array.new(@header_class_label.size,0)}
      create_matrix
    end

    def pretty_print
      print "".ljust(5)
      @header_class_label.each {|key| print key.ljust(5)}
      print "\n"
      @values.each_with_index do |row, index|
        print @header_target_attribute[index].ljust(5)
        row.each {|value| print value.to_s.ljust(5)}
        print " | " + sum_target(@header_target_attribute[index]).to_s
        print "\n"
      end
      print "".ljust(5)
      @header_class_label.each {|key| print sum_class_label(key).to_s.ljust(5)}
    end

    def sum_target(option)
      index_target = @header_target_attribute.index(option)
      values[index_target].inject(0) {|sum,x| sum + x }
    end

    def sum_class_label(option)
      index_class_label = @header_class_label.index(option)
      values.inject(0) {|sum,x| sum + x[index_class_label]}
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


    # Creating matrix
    #                 |   Class Label |
    #                 |    Y  |   N   | <- header_class_label
    #         |-------|:-----:|:-----:|
    # |Target |   Y   | 0     | 0     |
    # |Attr   |   N   | 0     | 0     |
    #            ^
    #            |
    #            |
    #     header_target_attribute
    def create_matrix
      @data_target.each_with_index do |target, index|
        index_target = @header_target_attribute.index(target)
        index_class_label = @header_class_label.index(@data_class_label[index])
        @values[index_target][index_class_label] += 1
      end
    end

  end
end
