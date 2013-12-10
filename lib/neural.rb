require "neural/version"
require 'perceptron'
require 'trainer'

module Neural
  class Driver
    def setup
      perceptron = Perceptron.new 3

      2_000.times do
        x = rand -400..400
        y = rand -400..400
        trainer = Trainer.new inputs: [x, y], answer: y < f(x) ? -1 : 1
        perceptron.train trainer.inputs, trainer.answer
      end

      puts perceptron.weights[0] / perceptron.weights[1]
      puts perceptron
    end

    def f x
      0.4 * x + 1
    end
  end
end
