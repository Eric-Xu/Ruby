require_relative "circle"
require "minitest/autorun"

describe Circle do

	subject  { Circle.new(0, 0, 5) }
	let(:c2) { Circle.new(4, 0, 7) }
	let(:c3) { Circle.new(6, -2, 1) }
	let(:c4) { Circle.new(5, -1, 2) }

	describe "attributes" do
		it "must have the reader accessors" do
			subject.must_respond_to :x
			subject.must_respond_to :y
			subject.must_respond_to :r
		end
	end

	it "takes x, y, and r as arguments" do
		subject.must_be_instance_of Circle
	end

	describe "#diameter" do

		it "calculates the diameter" do
			subject.diameter.must_equal 10
		end
	end

	describe "#circumference" do

		it "calculates the circumference" do
			subject.circumference.must_be_close_to 31, 1
		end
	end

	describe "#area" do

		it "calculates the area" do
			subject.area.must_be_close_to 78, 1
		end
	end

	describe "#distance_from_center" do

		it "calculates the distance between two circles" do
			subject.distance_from_center(c2).must_be_close_to 4, 1
			subject.distance_from_center(c3).must_be_close_to 6, 1
		end
	end

	describe "#intersects?" do

		it "returns true if two circles overlap" do
			subject.intersects?(c2).must_equal true
		end

		it "returns false if two circles do not overlap" do
			subject.intersects?(c3).wont_equal true
		end
	end

	describe "#inside?" do

		it "returns true if self is inside another circle" do
			c4.inside?(c2).must_equal true
		end

		it "returns true if self is inside another circle" do
			subject.inside?(c2).wont_equal true
		end
	end
end

# ruby circle_test.rb --verbose
# or use 'rake test' with a Rakefile

	# require "rake/testtask"
	# Rake::TestTask.new do |t|
	# 	t.libs << "test"
	# 	t.pattern = "test/*_test.rb"
	# 	t.verbose = true
	# end