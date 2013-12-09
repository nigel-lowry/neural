require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'perceptron'

describe Perceptron do

  subject { Perceptron.new 2 }

  it { should respond_to(:inputs) }

  describe "#initialize" do
    context "2 inputs" do
      subject { Perceptron.new 2 }

      it "creates 2 weights" do
        subject.should have(2).weights
      end

      it "creates weights which are between -1.0 and 1.0 inclusive" do
        subject.weights.each do |weight|
          weight.should be >= -1.0
          weight.should be <= 1.0
        end
      end
    end

    context "3 inputs" do
      subject { Perceptron.new 3 }

      it "creates 3 weights" do
        subject.should have(3).weights
      end
    end
  end

  describe "#random_weight" do
    it "should generate a random number between -1.0 and 1.0 inclusive" do
      random_weight = subject.random_weight
      random_weight.should be >= -1.0
      random_weight.should be <= 1.0
    end
  end

  describe "#sum" do
    it "multiplies each input by its weight then adds them together" do
      subject.feed_forward [12, 4]
      subject.stub(:random_weight).and_return(0.5, -1.0)
      subject.sum.should == 2
    end
  end

  describe "#output" do
    it "is 1 if the sum is greater than 0" do
      subject.stub(:sum).and_return(0.1)
      subject.output.should == 1
    end

    it "is -1 if the sum is less than 0" do
      subject.stub(:sum).and_return(-0.1)
      subject.output.should == -1
    end

    it "is -1 if the sum is 0" do
      subject.stub(:sum).and_return(0.0)
      subject.output.should == -1
    end
  end
end