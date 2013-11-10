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
end