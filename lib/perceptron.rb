require 'active_support/all'

class Perceptron

  attr_reader :weights
  @@LEARNING_CONSTANT = 0.01

  def initialize n
    @weights = n.times.collect { random_weight }
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

  def error options={}
    options[:desired] - options[:guess]
  end

  def train inputs, desired
    @inputs = inputs
    @desired = desired

    guess = feed_forward inputs
    error = desired - guess

    weights.each_with_index do |item, index|
      weights[index] = item + @@LEARNING_CONSTANT * error * inputs[index]
    end
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