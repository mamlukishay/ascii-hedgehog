Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file }

class InvoiceNumberParser

	def parse(input_file_name)
		start_line = 1
		i = 1
		output_line = nil
		output_file_name = reseat_output(input_file_name)
		File.foreach("./input_files/#{input_file_name}") do |input_line| 
			if i%4 == 0
				write_line(output_line, output_file_name)
				start_line += 4
			else
				output_line = create_or_add_line(output_line, input_line, i == start_line)
			end
			i += 1
		end
	end

	private

		def reseat_output(input_file_name)
			output_file_name = "output_" + input_file_name.sub("input_", "")
			File.open("./output_files/#{output_file_name}","w"){} if File.exist?("./output_files/#{output_file_name}")
			output_file_name
		end

		def write_line(line, output_file_name)
			line.input_lines_to_output
			File.open("./output_files/#{output_file_name}","a") { |f| f.puts(line.to_s) }
		end

		def create_or_add_line(output_line, input_line, should_create)
			output_line = Line.new if should_create
			output_line.add_input_line input_line
			output_line
		end

end
