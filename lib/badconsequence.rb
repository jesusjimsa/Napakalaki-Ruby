require './treasurekind'
class BadConsequence
  
	#Se definen los consultores y modificadores
	attr_accessor :text
	attr_accessor :levels
	attr_accessor :death
	
	attr_reader :nVisibleTreasures
	attr_reader :nHiddenTreasures
	attr_reader :specificHiddenTreasures
	attr_reader :specificVisibleTreasures
  
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
	
	def self.newTextLevel(text, levels)
		nuevoObjeto = allocate
		
		@text = text
		@levels = levels
		@nVisibleTreasures
		@nHiddenTreasures
		@death
		@specificVisibleTreasures
		@specificHiddenTreasures
		
		nuevoObjeto	#return
	end
	
	def self.newDeath(text, death)
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
	
	def self.newLevelSpecificTreasures(text, levels, specificHiddenTreasures, specificVisibleTreasures)
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
	
	def self.newLevelNumberOfTreasures(text, levels, nVisibleTreasures, specificHiddenTreasures)
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
	
	def onlyLoseLevels
		(@levels > 0 && @nVisibleTreasures == 0 && @nHiddenTreasures == 0)
	end
	
	def isEmpty
		(@nHiddenTreasures == 0 && @nVisibleTreasures == 0)
	end
	
	def substractVisibleTreasure(t)
		for i in 0..@nVisibleTreasures
			if (@specificVisibleTreasures[i] == t.getType)
				@nVisibleTreasures -= 1
				@specificVisibleTreasures.remove(t.getType)
			end
		end
	end
	
	def substractHiddenTreasure(t)
		for i in 0..@nHiddenTreasures
			if (@specificHiddenTreasures[i] == t.getType)
				@nHiddenTreasures -= 1
				@specificHiddenTreasures.remove(t.getType)
			end
		end
	end
	
	def adjustToFitTreasureLists(v, h)
		num_v = v.size
		num_h = h.size
		nVisibleTreasures = @nVisibleTreasures
		nHiddentreasures = @nHiddenTreasures
		specificVisible = @specificVisibleTreasures
		specificHidden = @specificHiddenTreasures
		
		if(num_v < @nVisibleTreasures)
			nVisibleTreasures = num_v
		end
		
		if(num_h < @nHiddenTreasures)
			nHiddenTreasures = num_h
		end
		
		for i in 0..@specificVisibleTreasures.size
			if(specificVisible[i] != v[i])
				specificVisible.delete_at(i)
				
				i -= 1
			end
		end
		
		for i in 0..@specificHiddenTreasures.size
			if(specificHidden[i] != h[i])
				specificHidden.delete_at(i)
				
				i -= 1
			end
		end
		
		bc = BadConsequence.newLevelSpecificTreasures(@text, 0, specificVisible, specificHidden)
		
		bc	#return
	end
	
	def to_s
		"Text: #{@text}\nLevels: #{@levels}\nVisibleTreasures: #{@nVisibleTreasures}\n
		HiddenTreasures: #{@nHiddenTreasures}\nDeath: #{@death}"
	end
	
	#El método new tiene visibilidad privada
	#private_class_method :new
	
end
