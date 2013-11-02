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

	def distance_from_center(circle)
		sqrt((self.x - circle.x) ** 2 + (self.y - circle.y) ** 2)
	end

	def intersects?(circle)
		distance_from_center(circle) < (self.r + circle.r)
	end

	def inside?(circle)
		distance_from_center(circle) < (self.r - circle.r).abs
	end
end