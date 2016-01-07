require 'invoice_number_parser'

describe InvoiceNumberParser do
	context 'when to_s' do
		it "return '?'" do
			i_c = IllegalCharacter.new
			expect(i_c.to_s).to eq "?"
		end
	end
end
