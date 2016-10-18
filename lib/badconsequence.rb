# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
	#Se define el contructor básico
	def initialize(text, levels, nVisibleTreasures, nHiddenTreasures, death)
		@text = text
		@levels = levels
		@nVisibleTreasures = nVisibleTreasures
		@nHiddenTreasures = nHiddenTreasures
		@death = death
		@specificVisibleTreasures = Array.new
		@specificHiddenTreasures = Array.new
	end
	
	def self.texto_y_bool(text, death)
		nuevoObjeto = allocate
		
		@text = text
		@levels
		@nVisibleTreasures
		@nHiddenTreasures
		@death = death
		@specificVisibleTreasures = Array.new
		@specificHiddenTreasures = Array.new
		
		nuevoObjeto #return
	end
	
	def self.dos_arrays(text, levels, specificHiddenTreasures, specificVisibleTreasures)
		nuevoObjeto = allocate
		
		@text = text
		@levels = levels
		@nVisibleTreasures
		@nHiddenTreasures
		@death
		@specificHiddenTreasures = specificHiddenTreasures
		@specificVisibleTresures = specificVisibleTreasures
		
		nuevoObjeto #return
	end
	
	def self.array_hidden(text, levels, nVisibleTreasures, specificHiddenTreasures)
		nuevoObjeto = allocate
		
		@text = text
		@levels = levels
		@nVisibletreasures = nVisibleTreasures
		@nHiddenTreasures
		@death
		@specificHiddenTreasures = specificHiddenTreasures
		@specificVisibleTreasures = Array.new
		
		nuevoObjeto #return
	end
	
	def self.array_visible(text, levels, specificVisibleTreasures, nHiddenTreasures)
		nuevoObjeto = allocate
		
		@text = text
		@levels = levels
		@specificVisibleTreasures = specificVisibleTreasures
		@specificHiddenTreasures = Array.new
		@nHiddenTreasures = nHiddenTreasures
		@nVisibleTreasures
		@death
		
		nuevoObjeto #return
	end
	
	def onlyLoseLevels()
		correcto = levels > 0 && nVisibleTreasures == 0 && nHiddenTreasures
	end
	
	###################			Método loseTreasure						####################
	############# Hay que averiguar cómo se pasa un objeto a un método	#######################
	
	def toString
		puts "Text = " + text + "\nLevels = " + levels + "\nVisible Treasures = "
				+ nVisibleTreasures + "\nHidden Treasures = " + nHiddenTreasures
				+"\nDeath = " + death
	end
	
	#Se definen los consultores y modificadores
	attr_accesor :text
	attr_accesor :levels
	attr_accesor :death
	
	attr_reader :nVisibleTreasures
	attr_reader :nHiddenTreasures
	attr_reader :specificHiddenTreasures
	attr_reader :specificVisibleTreasures
	
	
	
	
end