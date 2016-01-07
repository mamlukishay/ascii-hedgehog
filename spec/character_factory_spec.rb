require 'invoice_number_parser'

describe CharacterFactory do
	context 'when create Caracter' do
		context 'legal digit' do
			it "return Digit.new" do
				d = CharacterFactory.character_from_binary(CharacterFactory::BINARY_NUM_TO_DECIMAL.keys.first)
				expect(d.class).to eq Digit
			end
		end
	end
	context 'when create Caracter' do
		context 'illegal digit' do
			it "return IllegalCharacter.new" do
				i_c = CharacterFactory.character_from_binary("0000000")
				expect(i_c.class).to eq IllegalCharacter
			end
		end
	end
end
