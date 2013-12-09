require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'trainer'

describe Trainer do

  subject { Trainer.new inputs: [12, 4], answer: -1 }

  it { should respond_to :inputs }
  it { should respond_to :answer }

  its(:inputs) { should == [12, 4, 1] }
  its(:answer) { should == -1 }

  describe "#initialize" do
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