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

# Ishay - Ver1

describe CharacterFactory do
	describe "Character from binary num" do
		conetxt "when a valid binary num is given" do
			it "should return a Character" do
				d = CharacterFactory.character_from_binary(CharacterFactory::BINARY_NUM_TO_DECIMAL.keys.first)
				expect(d).to be_a Digit
			end
		end

		conetxt "when an invalid binary num is given" do
			it "should return an IllegalCharacter" do
				d = CharacterFactory.character_from_binary("0000000")
				expect(d).to be_a IllegalCharacter
			end
		end
	end
end

# Ishay - Ver2 Using subject & let

describe CharacterFactory do
	describe "Character from binary num" do
		subject { CharacterFactory.character_from_binary(input) } 

		conetxt "when a valid binary num is given" do
			let(:input) { CharacterFactory::BINARY_NUM_TO_DECIMAL.keys.first }
			it { should be_a Digit }
		end

		conetxt "when an invalid binary num is given" do
 			let(:input) { "0000000" }
			it { should be_a IllegalCharacter }
		end
	end
end
