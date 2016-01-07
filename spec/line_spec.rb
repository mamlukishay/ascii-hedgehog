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

# Ishay
# 1. 	Instance variables in tests are bad! They make ou maintain them because they are shared between tests. 
# 	 	You should try to keep each test totally independent from the others.
# 2. 	(related to 1) Ususally you don't need a before clause (It's an old-school approach which makes you use intance vars). Instead use let.
# 3. 	I don't know if testing an instance variable of an object is a good pratice - There're opinions about it, but generally
# 		if you make a go design, your tests should only check public methods of your object.
# 4.	I would consider renaming 'add_input_line' to 'add_input_line!' because it changes the instance itself (like gsub and gsub!).

describe Line do

	let(:line) { Line.new }
	
	describe 'conversion of input lines to output' do
		context 'when only valid digits are given' do
			let(:input_lines) {[
				" _     _  _  _  _  _     _ \n",
				"|_|  ||_| _||_ |_  _||_||_|\n",
				"|_|  | _||_ |_||_||_   ||_|\n"
				
			]}

			it "should convert the input lines to a valid number" do
				add_input_lines_and_convert_to_output
				expect(line.to_s) to eq "819266248"
			end
		end		

		context 'when the input contains invalid digits' do
			let(:input_lines) {[
				" _     _  _  _  _  _     _ \n",
				"|_|  ||_| _||_ |_  _||_||_|\n",
				"|_|  | _||_ |_||_||_    |_|\n"
				
			]}

			it "should put a '?' char for every invalid chracter" do
				add_input_lines_and_convert_to_output
				expect(line.to_s.slice(0,9)) to eq "8192662?8"
			end

			it "should write 'ILLEGAL' at the end of the output" do
				add_input_lines_and_convert_to_output
				expect(line.to_s.slice(8)) to eq " ILLEGAL"
			end
		end

		def add_input_lines_and_convert_to_output
			input_lines.each { |in_line| line.add_input_line(in_line) }
			line.convert_input_lines_to_output
		end
	end	
end