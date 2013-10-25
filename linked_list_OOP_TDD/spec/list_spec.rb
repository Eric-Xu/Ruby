require 'spec_helper'

describe List do

	let(:list) { List.new }
	let(:n1) { Node.new(1) }
	let(:n2) { Node.new(2) }
	let(:n3) { Node.new(3) }

	subject { list }

	describe "#attributes" do

		[:head, :tail, :count].each do |attribute|
			it { should respond_to attribute }
		end
	end

	describe "#ptq" do

		before { list.ptq(n1) }

		context "when list is empty" do

			its(:head) { should eq n1 }

			its(:tail) { should eq n1 }

			its(:count) { should eq 1 }
		end

		context "when nodes exist" do

			before { list.ptq(n2) }

			its(:head) { should eq n2 }

			its(:tail) { should eq n1 }

			specify { expect(list.head.next).to eq n1 }

			its(:count) { should eq 2 }
		end
	end

	describe "#pbq" do

		before { list.pbq(n1) }

		context "when list is empty" do

			its(:head) { should eq n1 }

			its(:tail) { should eq n1 }

			its(:count) { should eq 1 }
		end

		context "when nodes exist" do

			before { list.pbq(n2) }

			its(:head) { should eq n1 }

			specify { expect(list.head.next).to eq n2 }

			its(:tail) { should eq n2 }

			its(:count) { should eq 2 }
		end
	end

	describe "#rtq" do

		before { list.ptq(n1) }

		it "decrements the count" do
			expect{ list.rtq }.to change{ list.count }.by -1
		end

		it "returns the top node" do
			expect(list.rtq).to eq n1
		end

		context "when list has one node" do

			before { list.rtq }

			it "sets the head to nil" do
				expect(list.head).to be_nil
			end

			it "sets the tail to nil" do
				expect(list.tail).to be_nil
			end
		end

		context "when list has more than one node" do

			it "resets the head node" do
				list.ptq(n2)
				list.rtq
				expect(list.head).to eq n1
			end
		end
	end

	describe "#each" do

		let(:results) { [] }

		context "when list is empty" do
			specify { expect(list.each { |n| results << n }).to be_nil }
		end

		context "when nodes exist" do

			it "iterates through a list" do
				list.ptq(n1)
				list.ptq(n2)
				list.ptq(n3)
				list.each { |n| results << n }
				expect(results).to have(3).nodes
			end
		end
	end

	describe "#reverse" do

		context "when list is empty" do

			specify { expect(list.reverse).to be_nil }
		end

		context "when nodes exist" do

			before do
				list.ptq(n1)
				list.ptq(n2)
				list.ptq(n3)
				list.reverse
			end

			its(:head) { should eq n1 }

			specify { expect(list.head.next).to eq n2 }

			its(:tail) { should eq n3 }

			its(:count) { should eq 3 }

			# it { should eq n1 }
		end
	end

	describe "#reverse!" do

		context "when list is empty" do

			specify { expect(list.reverse!).to be_nil }
		end

		context "when nodes exist" do

			before do
				list.ptq(n1)
				list.ptq(n2)
				list.ptq(n3)
			end

			let(:new_reversed_list) { list.reverse! }

			specify { expect(new_reversed_list.head.data).to eq 1 }

			specify { expect(new_reversed_list.tail.data).to eq 3 }

			it "returns a new list" do
				expect(new_reversed_list).not_to eq list.reverse
			end
		end
	end
end