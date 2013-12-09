require 'active_support/all'

class Perceptron

  attr_reader :inputs

  def initialize inputs
    @inputs = inputs
  end

  def random_weight
    random_float_between_minus_one_and_one_inclusive
  end

  def sum
    @inputs.collect {|input| input * random_weight }.sum
  end

  def activate
    sum > 0 ? 1 : -1
  end

private

  def random_float_between_minus_one_and_one_inclusive
    rand -1.0..1.0
  end
end