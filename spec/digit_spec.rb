require 'invoice_number_parser'

describe Digit do
	context 'when to_s' do
		it "return '?'" do
			d = Digit.new("1")
			expect(d.to_s).to eq "1"
		end
	end
end

# What's this test for??
# You didn't implement to_s on Digit, so what are you trying to test here?
# Anyhow, I guess the '?' is a bad copy/paste from IllegalCharacter