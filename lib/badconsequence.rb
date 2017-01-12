require './treasurekind.rb'
require './player.rb'

module Napakalaki

	class BadConsequence
  
		#Se definen los consultores y modificadores
		attr_accessor :text
		attr_accessor :levels
		attr_accessor :death
  
		#Se define el contructor básico
		def initialize(text, levels, death)
			@text = text
			@levels = levels
			@death = death
		end
	
		def isEmpty
			raise NotImplementedError.new("Abstract methods are not implemented")
		end
	
		def substractVisibleTreasure(t)
			raise NotImplementedError.new("Abstract methods are not implemented")
		end
	
		def substractHiddenTreasure(t)
			raise NotImplementedError.new("Abstract methods are not implemented")
		end
	
		def adjustToFitTreasureLists(v, h)
			raise NotImplementedError.new("Abstract methods are not implemented")
		end
	
		def to_s
			"Text: #{@text}\nLevels: #{@levels}\nDeath: #{@death}"
		end
	
		#El método new tiene visibilidad privada
		#private_class_method :new
	
	end
end