require "./lib/invoice_number_parser"
class AsciiHedgehog
	def self.parse(file_name)
		InvoiceNumberParser.parse(file_name)
	end
end

AsciiHedgehog.parse(ARGV[0])