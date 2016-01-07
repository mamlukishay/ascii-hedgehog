class Line

	def initialize 
		@input_lines = []
		@legal = true
		@digit_arr = []
	end

	def add_input_line(input_line)
		@input_lines << input_line
	end

	def to_s
		input_lines_to_digits
		str = @digit_arr.join()
		str += " ILLEGAL" unless @legal
		str
	end

	private

		def input_lines_to_digits
			(0...27).step(3).each do |col_i|
				new_digit(input_lines_to_digit(col_i))
			end
		end

		def input_lines_to_digit(col_i)
			digit_string = ""
			digit_string << empty_string_to_binary(@input_lines[0][col_i+1])
			(1..2).each do |r|
				(0...3).each do |c|
					digit_string << empty_string_to_binary(@input_lines[r][col_i+c])
				end
			end
			digit_string
		end

		def empty_string_to_binary(str)
			str.strip.length == 0 ? "0" : "1"
		end

		def new_digit(binary_str)
			digit = DigitFactory.digit_from_binary(binary_str)
			@legal &&= digit.is_legal
			@digit_arr << digit
		end
end