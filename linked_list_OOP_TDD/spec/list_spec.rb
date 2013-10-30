require 'spec_helper'

describe List do

	let(:list) { List.new }
	let(:n1) { Node.new(1) }
	let(:n2) { Node.new(2) }
	let(:n3) { Node.new(3) }
	let(:n1b) { Node.new(1) }

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

			before do
				list.ptq(n2)
				list.rtq
			end

			it "resets the head node" do
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

			before do
				list.ptq(n1)
				list.ptq(n2)
				list.ptq(n3)
				list.each { |n| results << n }
			end

			it "iterates through a list" do
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

			it "should not change the count" do
				expect(list.count).to eq 3
			end
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

			specify { expect(new_reversed_list.count).to eq 3 }

			it "returns a new list" do
				expect(new_reversed_list).not_to eq list.reverse
			end
		end
	end

	describe "#prev_node" do

		context	"when list is empty" do

			it "returns nil" do
				expect(list.prev_node(n1)).to be_nil
			end
		end

		context "when list has one node" do

			before { list.ptq(n1) }

			it "returns nil" do
				expect(list.prev_node(n1)).to be_nil
			end
		end

		context "when list has many nodes" do

			before do
				list.ptq(n1)
				list.ptq(n2)
				list.ptq(n3)
			end

			it "returns the previous node" do
				expect(list.prev_node(n1)).to eq n2
				expect(list.prev_node(n2)).to eq n3
				expect(list.prev_node(n3)).to be_nil
			end
		end
	end

	describe "#delete" do

		let(:n1) 		{ Node.new(1) }
		let(:n2) 		{ Node.new(2) }
		let(:n3) 		{ Node.new(3) }
		let(:n1b)		{ Node.new(1) }

		context "when list is empty" do

			it "returns an empty array" do
				expect(list.delete(1)).to eq []
			end
		end

		context "with one match" do

			before { list.ptq(n1) }

			specify { expect(list.delete(1)).to eq [n1] }
		end

		context "with more than one match" do

			before do
				list.ptq(n1)
				list.ptq(n1b)
			end

			it "returns an array with the deleted nodes" do
				expect(list.delete(1)).to eq [n1b, n1]
			end
		end

		context "when list has a single node" do

			before { list.ptq(n1) }

			context "with a match" do

				before { list.delete(1) }

				it "resets the list" do
					expect(list.count).to eq 0
					expect(list.head).to be_nil
					expect(list.tail).to be_nil
				end

				it "subtracts one from count" do
					expect(list.count).to eq 0
				end
			end

			context "without a match" do

				it "returns nil" do
					expect(list.delete(99)).to eq []
				end
			end
		end

		context "when list has many nodes" do

			before do
				list.ptq(n1)
				list.ptq(n2)
				list.ptq(n3)
			end

			context "with a single match" do

				context "at the list's head" do

					before { list.delete(3) }

					it "resets the head" do
						expect(list.head).to eq n2
					end
				end

				context "at the list's tail" do

					before { list.delete(1) }

					it "resets the tail" do
						expect(list.tail).to eq n2
					end
				end

				context "at the middle" do

					before { list.delete(2) }

					it "removes the node" do
						expect(list.head.next).to eq n1
					end
				end
			end

			context "with more than one match" do

				before do
				  list.ptq(n1b)
				  list.delete(1)
				end

				its(:head) { should eq n3 }

				its(:tail) { should eq n2 }

				its(:count) { should eq 2 }
			end
		end
	end
end