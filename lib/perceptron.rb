require 'active_support/all'

class Perceptron

  attr_reader :inputs
  attr_reader :weights

  def initialize n
    @weights = n.times.collect { random_weight }
  end

  def random_weight
    random_float_between_minus_one_and_one_inclusive
  end

  def feed_forward inputs
    @inputs = inputs
    output
  end

  def sum
    @inputs.collect {|input| input * random_weight }.sum
  end

  def output
    activate
  end

private

  def random_float_between_minus_one_and_one_inclusive
    rand -1.0..1.0
  end

  def activate
    sum > 0 ? 1 : -1
  end
end