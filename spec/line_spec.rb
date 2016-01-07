require 'invoice_number_parser'

describe Line do

	before(:each) do
		@l = Line.new
	end

	context 'add input line' do
		it "add string to @input_lines aray" do
			@l.add_input_line(" _     _  _  _  _  _     _ \n")
			expect(@l.instance_variable_get(:@input_lines)).to eq [" _     _  _  _  _  _     _ \n"]
		end
	end
	
	context 'convert input lines to output' do
		context 'valid digits' do
			it "will fill @character_arr with 9 digits" do
				@l.add_input_line(" _     _  _  _  _  _     _ \n")
				@l.add_input_line("|_|  ||_| _||_ |_  _||_||_|\n")
				@l.add_input_line("|_|  | _||_ |_||_||_   ||_|\n")
				@l.convert_input_lines_to_output
				expect(@l.instance_variable_get(:@character_arr).all? {|d| d.is_a?(Digit)}).to eq true
				expect(@l.instance_variable_get(:@character_arr).size).to eq 9
			end
		end		
		context 'invalid digits' do
			it "will fill @character_arr with 8 digits and 1 IllegalCharacter" do
				@l.add_input_line(" _     _  _  _  _  _     _ \n")
				@l.add_input_line("|_|  ||_| _||_ |_  _||_||_|\n")
				@l.add_input_line("|_|  | _||_ |_||_||_    |_|\n")
				@l.convert_input_lines_to_output
				expect(@l.instance_variable_get(:@character_arr).all? {|d| d.is_a?(Digit)}).to eq false
				expect(@l.instance_variable_get(:@character_arr).select{|d| d.is_a?(Digit)}.size).to eq 8
				expect(@l.instance_variable_get(:@character_arr).select{|d| d.is_a?(IllegalCharacter)}.size).to eq 1
			end
		end
	end	

	context 'to_s' do
		context 'valid digits' do
			it "return '819266248'" do
				@l.add_input_line(" _     _  _  _  _  _     _ \n")
				@l.add_input_line("|_|  ||_| _||_ |_  _||_||_|\n")
				@l.add_input_line("|_|  | _||_ |_||_||_   ||_|\n")
				@l.convert_input_lines_to_output
				expect(@l.to_s).to eq "819266248"
			end
		end		
		context 'invalid digits' do
			it "return '8192662?8 ILLEGAL'" do
				@l.add_input_line(" _     _  _  _  _  _     _ \n")
				@l.add_input_line("|_|  ||_| _||_ |_  _||_||_|\n")
				@l.add_input_line("|_|  | _||_ |_||_||_    |_|\n")
				@l.convert_input_lines_to_output
				expect(@l.to_s).to eq "8192662?8 ILLEGAL"
			end
		end
	end
end
