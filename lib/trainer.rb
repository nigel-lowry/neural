class Trainer
  attr_reader :inputs, :answer

  def initialize x, y, a
    @inputs = [x, y, 1]
    @answer = a
  end
end