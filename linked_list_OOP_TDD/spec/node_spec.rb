require 'spec_helper'

describe Node do

	let(:node) { Node.new(1) }

	subject { node }

  describe "#attributes" do

    it { should respond_to :data }

    it { should respond_to :next }
  end

  it "raises an error when created with no data" do
  	expect { Node.new }.to raise_error
  end

  its(:data) { should eq 1 }

  its(:next) { should be_nil }
end
