require './numeric_bad_consequence'
require './bad_consequence'

class DeathBadConsequence < NumericBadconsequence
	def initialize(text = "", death = false)
		super(text, death)
	end
end
