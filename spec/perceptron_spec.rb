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

  describe "#activate" do
    it "is 1 if the sum is greater than 0" do
      subject.stub(:sum).and_return(0.1)
      subject.activate.should == 1
    end

    it "is -1 if the sum is less than 0" do
      subject.stub(:sum).and_return(-0.1)
      subject.activate.should == -1
    end

    it "is -1 if the sum is 0" do
      subject.stub(:sum).and_return(0.0)
      subject.activate.should == -1
    end
  end
end