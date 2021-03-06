class CharacterFactory
	BINARY_NUM_TO_DECIMAL = {
			"1101111" => "0",
			"0001001" => "1",
			"1011110" => "2",
			"1011011" => "3",
			"0111001" => "4",
			"1110011" => "5",
			"1110111" => "6",
			"1001001" => "7",
			"1111111" => "8",
			"1111011" => "9"
		}

	def self.character_from_binary(binary_str)
		num = BINARY_NUM_TO_DECIMAL[binary_str]
		num ? Digit.new(num) : IllegalCharacter.new
	end

end