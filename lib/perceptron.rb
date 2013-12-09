require 'active_support/all'

class Perceptron

  attr_reader :weights

  def initialize n, learning_constant=0.01
    @weights = n.times.collect { random_weight }
    @learning_constant = learning_constant
  end

  def train inputs, desired
    guess = feed_forward inputs
    error = desired - guess

    @weights.each_with_index do |item, index|
      @weights[index] = item + @learning_constant * error * inputs[index]
    end
  end

  def feed_forward inputs
    @inputs = inputs
    output
  end

  def output
    activate
  end

  def sum
    sum = 0

    @inputs.each_with_index do |item, index|
      sum += item * @weights[index]
    end

    sum
  end

  def to_s
    @weights.to_s
  end

private

  def random_weight
    random_float_between_minus_one_and_one_inclusive
  end

  def random_float_between_minus_one_and_one_inclusive
    rand -1.0..1.0
  end

  def activate
    sum > 0 ? 1 : -1
  end
end