module Enumerable # rubocop:disable Style/Documentation
  # Your code goes here
  def my_map
    temp = []
    for element in self # rubocop:disable Style/For
      temp << yield(element) if block_given?
    end
    temp
  end

  def my_all?
    return true unless block_given?

    for element in self # rubocop:disable Style/For
      return false unless yield element
    end
    true
  end

  def my_any?
    return false if length.zero?

    for element in self # rubocop:disable Style/For
      return true if yield element
    end
    false
  end

  def my_count
    return length unless block_given?

    counter = 0
    for element in self # rubocop:disable Style/For
      counter += 1 if yield element
    end
    counter
  end

  def my_each_with_index
    return self unless block_given?

    index = 0
    for element in self # rubocop:disable Style/For
      yield element, index
      index += 1
    end
    self
  end

  def my_inject(initial)
    for element in self # rubocop:disable Style/For
      initial = yield initial, element
    end
    initial
  end

  def my_none?
    return true unless block_given?

    for element in self # rubocop:disable Style/For
      return false if yield element
    end
    true
  end

  def my_select
    temp = []
    for element in self
      temp << element if yield element
    end
    temp
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self # rubocop:disable Style/For
      yield element if block_given? # Only yield if a block is provided
    end
    self # Return the array itself to allow method chaining
  end
end
