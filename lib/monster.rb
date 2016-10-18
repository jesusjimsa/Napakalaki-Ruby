# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
	@@name
	@@combatLevel
	@@bc
	@@prize
	def initialize(name, level, bc, prize)
		@name = name
		@level = level
		@bc = bc
		@prize = prize
	end
	
	def initialize(monstruo)
		@name = monstruo.name
		@combatLevel = monstruo.combatLevel
		@bc = monstruo.bc
		@prize = monstruo.prize
	end
	
	
end
