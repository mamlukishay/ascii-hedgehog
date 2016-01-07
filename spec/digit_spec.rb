require 'invoice_number_parser'

describe Digit do
	context 'when to_s' do
		it "return '?'" do
			d = Digit.new("1")
			expect(d.to_s).to eq "1"
		end
	end
end
