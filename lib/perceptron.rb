class Perceptron
  def random_weight
    random_float_between_minus_one_and_one_inclusive
  end

private

  def random_float_between_minus_one_and_one_inclusive
    rand -1.0..1.0
  end
end