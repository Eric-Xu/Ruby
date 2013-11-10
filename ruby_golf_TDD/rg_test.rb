require_relative 'test_helper'

describe "instance methods" do

	describe "#fizzbuzz" do

		it "returns 'Fizz' for 3" do
			fizzbuzz(3).must_equal "Fizz"
		end

		it "returns 'Buzz' for 10" do
			fizzbuzz(10).must_equal "Buzz"
		end

		it "returns 'FizzBuzz' for 45" do
			fizzbuzz(45).must_equal "FizzBuzz"
		end

		it "returns '31' for 31" do
			fizzbuzz(31).must_equal "31"
		end
	end

	describe "#caesar" do

		context "when shifting forward" do

			it "returns 'Khoor' for 'Hello'" do
				caesar("Hello", 3).must_equal "Khoor"
			end

			it "returns 'ett' for 'zoo'" do
				caesar("zoo", 5).must_equal "ett"
			end
		end

		context "when shifting backward" do

			it "returns 'Ebiil' for 'Hello'" do
				caesar("Hello", -3).must_equal "Ebiil"
			end

			it "returns 'vkkgz' for 'apple'" do
				caesar("apple", -5).must_equal "vkkgz"
			end
		end
	end
end