require "neural/version"
require 'perceptron'
require 'trainer'

module Neural
  class Driver

    def f x
      0.4 * x + 1
    end

    def setup
      ptron = Perceptron.new 3

      2000.times do |n|
        x = rand -400..400
        y = rand -400..400

        answer = if y < f(x)
                   -1
                 else
                   1
                 end

        t = Trainer.new inputs: [x, y], answer: answer
        ptron.train t.inputs, t.answer
      end

      puts ptron.weights[0] / ptron.weights[1]
      puts ptron
    end
  end
end
