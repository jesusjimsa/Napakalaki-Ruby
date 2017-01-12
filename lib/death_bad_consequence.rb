require './numeric_bad_consequence.rb'
require './badconsequence.rb'

module Napakalaki

	class DeathBadConsequence < NumericBadConsequence
		def initialize(text = "")
			super(text, Player.MAXLEVEL, NumericBadConsequence.MAXTREASURES, NumericBadConsequence.MAXTREASURES, true)
		end
	end
end
