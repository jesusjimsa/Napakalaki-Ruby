# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
	#Constructores
	def initialize(name, level, bc, prize)
		@name = name
		@combatLevel = level
		@bc = bc
		@prize = prize
	end
	
	def self.copia(monstruo)
		nuevoObjeto = allocate
		
		@name = monstruo.name
		@combatLevel = monstruo.combatLevel
		@bc = monstruo.bc
		@prize = monstruo.prize
		
		nuevoObjeto #return
	end
	
	
	
	#Consultores
	attr_reader :name
	attr_reader :combatLevel
	attr_reader :bc
	attr_reader :prize
	
	def onlyLoseLevels
		bc.onlyLoseLevels
	end
	
	def winLevelsFrom(lvl)
		prize.winLevelsFrom(lvl)
	end
	
	def loseTreasure(treasure, visible)
		bc.loseTreasure(treasure, visible)
	end
	
	def to_s
		"Name: #{@name}\nCombat level: #{@combatLevel}"
	end
	
	#El método new tiene visibilidad privada
	private_class_method :new
end
