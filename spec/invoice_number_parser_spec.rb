require 'invoice_number_parser'

describe InvoiceNumberParser do
	before(:each) do
		File.open("./output_files/output_spec.txt","w"){}
	end

	context 'when parse' do
		it "write to output_spec.txt the invoice number 819266248" do
			allow(File).to receive(:foreach).and_yield(" _     _  _  _  _  _     _ \n")
																			.and_yield("|_|  ||_| _||_ |_  _||_||_|\n")
																			.and_yield("|_|  | _||_ |_||_||_   ||_|\n")
																			.and_yield("                             ")
			allow(InvoiceNumberParser).to receive(:reseat_output).and_return("output_spec.txt")
			InvoiceNumberParser.parse("input_spec.txt")
			expect(File.read("./output_files/output_spec.txt")).to eq "819266248\n"
		end
	end
	context 'when parse' do
		it "write to output_spec.txt the invoice number 819266248 8192662?8 ILLEGAL" do
			allow(File).to receive(:foreach).and_yield(" _     _  _  _  _  _     _ \n")
																			.and_yield("|_|  ||_| _||_ |_  _||_||_|\n")
																			.and_yield("|_|  | _||_ |_||_||_   ||_|\n")
																			.and_yield("                             ")
																			.and_yield(" _     _  _  _  _  _     _ \n")
																			.and_yield("|_|  ||_| _||_ |_  _||_||_|\n")
																			.and_yield("|_|  | _||_ |_||_||_    |_|\n")
																			.and_yield("                             ")
			allow(InvoiceNumberParser).to receive(:reseat_output).and_return("output_spec.txt")
			InvoiceNumberParser.parse("input_spec.txt")
			expect(File.read("./output_files/output_spec.txt")).to eq "819266248\n8192662?8 ILLEGAL\n"
		end
	end
end

# Ishay
# I would consider using Tempfile instead of File - Google it
# Then, on before each, you can do something line: allow File.to receive(:open).and return { Tempfile.new }
# Same structure changes in character_factory_spec wuolb be good here too