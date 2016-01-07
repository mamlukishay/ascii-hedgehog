require "./lib/invoice_number_parser"
class AsciiHedgehog
	def self.parse(file_name)
		begin
			InvoiceNumberParser.parse(file_name)
			p "'#{file_name}' was parsed. wow, so fast, much parse, such digits"
		rescue => error
			p "oh no, #{error.inspect}"
		end
	end
end

AsciiHedgehog.parse(ARGV[0])