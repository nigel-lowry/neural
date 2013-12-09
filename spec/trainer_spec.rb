require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'trainer'

describe Trainer do

  subject { Trainer.new inputs: [12, 4], answer: -1 }

  it { should respond_to :inputs }
  it { should respond_to :answer }

  its(:inputs) { should == [12, 4, 1] }
  its(:answer) { should == -1 }
end