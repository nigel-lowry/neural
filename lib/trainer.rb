class Trainer
  attr_reader :inputs, :answer

  def initialize options={}
    @inputs = augment_inputs_with_bias options[:inputs]
    @answer = options[:answer]
  end

private

  def augment_inputs_with_bias inputs
    append_element_one inputs
  end

  def append_element_one inputs
    inputs.push 1
  end
end