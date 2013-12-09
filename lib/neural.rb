require "neural/version"
require 'perceptron'
require 'trainer'

module Neural
  class Driver

    @@xmin = -400
    @@ymin = -100
    @@xmax = 400
    @@ymax = 100

    def f x
      0.4 * x + 1
    end

    def setup
      @ptron = Perceptron.new 3
      @training = []
      @count = 0

      2000.times do |n|
        x = rand @@xmin..@@xmax
        y = rand @@ymin..@@ymax
        answer = 1
        answer = -1 if y < f(x)
        @training[n] = Trainer.new x, y, answer
      end

      @ptron.train @training[@count].inputs, @training[@count].answer
      puts @ptron
    end
  end
end
