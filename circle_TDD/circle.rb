include Math

class Circle

	attr_reader :x, :y, :r

	def initialize(x, y, r)
		@x, @y, @r = x, y, r
	end

	def diameter
		r * 2
	end

	def circumference
		2 * PI * r
	end

	def area
		PI * r ** 2
	end
end