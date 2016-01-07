class Digit
	
	def initialize(num, legal)
		@num = num
		@legal = legal
	end

	def to_s
		@num
	end

	def is_legal
		@legal
	end
end