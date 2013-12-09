require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'perceptron'

describe Perceptron do

  subject { Perceptron.new [12, 4] }

  it { should respond_to(:inputs) }

  describe "#random_weight" do
    it "should generate a random number between -1.0 and 1.0 inclusive" do
      random_weight = subject.random_weight
      random_weight.should be >= -1.0
      random_weight.should be <= 1.0
    end
  end

  describe "#sum" do
    it "multiplies each input by its weight then adds them together" do
      subject.stub(:random_weight).and_return(0.5, -1.0)
      subject.sum.should == 2
    end
  end
end