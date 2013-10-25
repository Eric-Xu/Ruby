class List
	attr_accessor :head, :tail, :count

	def initialize
		@head = nil
		@tail = nil
		@count = 0
	end

	def ptq(node)
		@count += 1
		if @head.nil?
			@head = node
			@tail = node
		else
			node.next = @head
			@head = node
		end
	end

	def pbq(node)
		@count += 1
		if @head.nil?
			@head = node
			@tail = node
		else
			@tail.next = node
			@tail = node
		end
	end

	def rtq
		return if @head.nil?
		removed_node = @head
		if @count == 1
			@head, @tail = nil, nil
		else
			@head = @head.next
		end
		@count -= 1
		removed_node
	end

	def each
		return if @head.nil?
		node = @head
		while node
			yield node
			node = node.next
		end
	end

	def reverse!
		return if @head.nil?
		reversed = List.new
		self.each do |node|
			reversed.ptq(Node.new(node.data))
		end
		reversed
	end

	def reverse
		return if @head.nil?
		temp_tail = self.rtq
		temp_tail.next = nil
		@tail = temp_tail
		@count += 1

		while @head
			node = self.rtq
			node.next = temp_tail
			temp_tail = node
			@count += 1
		end
		@head = temp_tail
	end
end