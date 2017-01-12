require './numeric_bad_consequence'
require './bad_consequence'

module Napakalaki

	class DeathBadConsequence < NumericBadconsequence
		def initialize(text = "")
			super(text, Player.MAXLEVEL, NumericBadConsequence.MAXTREASURES, NumericBadConsequence.MAXTREASURES, true)
		end
	end
end
