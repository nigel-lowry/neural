require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'trainer'

describe Trainer do

  subject { Trainer.new inputs: [12, 4], answer: -1 }

  it { should respond_to :inputs }
  it { should respond_to :answer }

  its(:inputs) { should == [12, 4, 1] }
  its(:answer) { should == -1 }

  describe "#initialize" do
    describe "inputs" do
      it "can have 1 element" do
        expect { Trainer.new inputs: [12], answer: 1 }.not_to raise_error
      end

      it "can have many elements" do
        expect { Trainer.new inputs: [12, 4], answer: 1 }.not_to raise_error
      end

      it "cannot have no elements" do
        expect { Trainer.new inputs: [], answer: 1 }.to raise_error
      end

      it "cannot be nil" do
        expect { Trainer.new inputs: nil, answer: 1 }.to raise_error
      end
    end

    describe "answer" do
      it "can be 1" do
        expect { Trainer.new inputs: [12, 4], answer: 1 }.not_to raise_error
      end

      it "can be -1" do
        expect { Trainer.new inputs: [12, 4], answer: -1 }.not_to raise_error
      end

      it "cannot be 0" do
        expect { Trainer.new inputs: [12, 4], answer: 0 }.to raise_error
      end

      it "cannot be 0.5" do
        expect { Trainer.new inputs: [12, 4], answer: 0.5 }.to raise_error
      end
    end
  end
end