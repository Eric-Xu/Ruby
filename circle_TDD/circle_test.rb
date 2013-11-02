require_relative "circle"
require "minitest/autorun"

describe Circle do

	subject  { Circle.new(0, 0, 5) }

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
end

# ruby circle_test.rb --verbose
# or use 'rake test' with a Rakefile

	# require "rake/testtask"
	# Rake::TestTask.new do |t|
	# 	t.libs << "test"
	# 	t.pattern = "test/*_test.rb"
	# 	t.verbose = true
	# end