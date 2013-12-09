require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'perceptron'

describe Perceptron do

  it { should respond_to(:inputs) }

  describe "#random_weight" do
    it "should generate a random number between -1.0 and 1.0 inclusive" do
      random_weight = subject.random_weight
      random_weight.should be >= -1.0
      random_weight.should be <= 1.0
    end
  end
end