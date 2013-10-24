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
end