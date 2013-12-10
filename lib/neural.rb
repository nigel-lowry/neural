require "neural/version"
require 'perceptron'
require 'trainer'

module Neural
  class Driver
    def setup
      ptron = Perceptron.new 3

      2_000.times do
        x = rand -400..400
        y = rand -400..400
        trainer = Trainer.new inputs: [x, y], answer: y < f(x) ? -1 : 1
        ptron.train trainer.inputs, trainer.answer
      end

      puts ptron.weights[0] / ptron.weights[1]
      puts ptron
    end

    def f x
      0.4 * x + 1
    end
  end
end
