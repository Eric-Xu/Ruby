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

	describe "#rps" do

		context "Rock" do

			let(:correct_outcomes) { ["Rock,Draw", "Scissors,Win", "Paper,Lose"] }

			it "returns correct outcome" do
				correct_outcomes.must_include rps("Rock")
			end
		end

		context "Paper" do

			let(:correct_outcomes) { ["Paper,Draw", "Rock,Win", "Scissors,Lose"] }

			it "returns correct outcome" do
				correct_outcomes.must_include rps("Paper")
			end
		end

		context "Scissors" do

			let(:correct_outcomes) { ["Scissors,Draw", "Paper,Win", "Rock,Lose"] }

			it "returns correct outcome" do
				correct_outcomes.must_include rps("Scissors")
			end
		end
	end

	describe "#count" do

		it "returns the letter frequency for a single word" do
			count("Anagram", "A").must_equal 3
		end

		it "returns the word frequency for a string" do
			count("CookieMonster loves cookie.","cookie").must_equal 2
		end
	end
end