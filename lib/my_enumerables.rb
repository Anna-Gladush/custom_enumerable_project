module Enumerable
  # each_with_index
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    idx = -1
    self.my_each do |elem|
      idx += 1
      yield(elem, idx)
    end
  end

  # select
  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    self.my_each do |elem|
      result << elem if yield(elem) == true
    end
    result
  end

  # all?
  def my_all?
    return to_enum(:my_all?) unless block_given?

    result = self.my_select do |elem|
      yield(elem)
    end
    result == self
  end

  # any?
  def my_any?
    return to_enum(:my_any?) unless block_given?

    result = self.my_select do |elem|
      yield(elem)
    end
    result.length >= 1
  end

  # none?
  def my_none?
    return to_enum(:my_none?) unless block_given?

    result = self.my_select do |elem|
      yield(elem)
    end
    result.length < 1
  end

  # count
  def my_count
    return self.size unless block_given?

    result = self.my_select do |elem|
      yield(elem)
    end
    result.length
  end

  # map
  def my_map
    return to_enum(:my_map) unless block_given?

    result = []
    self.my_each do |elem|
      result << yield(elem)
    end
    result
  end

  # inject
  def my_inject(initial_value)
    return to_enum(:my_inject) unless block_given?

    self.my_each do |elem|
      initial_value = yield(initial_value, elem)
    end
    initial_value
  end
end

class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for item in self
      yield(item)
    end
  end
end
