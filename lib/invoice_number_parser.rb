Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file }

class InvoiceNumberParser
	# def initialize(input_file_name)
	# 	@input_file_name = input_file_name
	# end

	# def parse
	# 	i = 1
	# 	j = 1
	# 	File.foreach("./input_files/#{@input_file_name}") do |x| 
	# 		unless i%4 == 0
	# 			s=""
	# 			if j == 1
	# 				c = 1
	# 				until c > 26
	# 					s += " #{x[c]} "
	# 					c += 3
	# 				end
	# 			else
	# 				c = 0
	# 				until c > 26
	# 					s += "#{x[c]}#{x[c+1]}#{x[c+2]}"
	# 					c += 3
	# 				end
	# 			end
	# 			p s
	# 		else
	# 			p ""
	# 			j = 0
	# 		end
	# 		i += 1
	# 		j += 1 
	# 	end
	# end

	def self.parse(input_file_name)
		i = 1
		line = nil
		digit_line = 1
		File.open("./output_files/#{input_file_name}","w") if File.exist?("./output_files/#{input_file_name}")
		File.foreach("./input_files/#{input_file_name}") do |input_line| 
			if i%4 == 0
				File.open("./output_files/#{input_file_name}","a") { |f| f.puts(line.to_s) }
				digit_line += 4
			else
				line = Line.new if i == digit_line
				line.add_input_line input_line
			end
			i += 1
		end
	end
end
