require_relative 'badconsequence'

class NumericBadConsequence < BadConsequence
	attr_reader :nVisibleTreasures
	attr_reader :nHiddenTreasures
	
	def initialize(text, level, nVisible, nHidden)
		super(text, level)
		
		@nVisibleTreasures = nVisible
		@nHiddenTreasures = nHidden
	end
	
	def isEmpty
		(@nVisibleTreasures == 0 && @nHiddenTreasures == 0)	#return
	end
	
	def substractVisibleTreasure(t)
		if (@nVisibleTreasures > 0)
			@nVisibleTreasures -= 1
		end
    end

    def substractHiddenTreasure(t)
		if (@nHiddenTreasures > 0)
			@nHiddenTreasures -= 1
		end
    end
	
	def adjustToFitTreasureLists(v, h)
		num_v = v.size
		num_h = h.size
		nVisibleTreasures = @nVisibleTreasures
		nHiddentreasures = @nHiddenTreasures
		
		if(num_v < @nVisibleTreasures)
			nVisibleTreasures = num_v
		end
		
		if(num_h < @nHiddenTreasures)
			nHiddenTreasures = num_h
		end
		
		bc = NumericBadConsequence.new(@text, @level, nVisibleTreasures, nHiddenTreasures)
		
		bc	#return
	end
	
	def to_s
		"#{@text}\nNivel: #{@level}\nTesoros visibles: #{@nVisibleTreasures}\nTesoros ocultos: #{@nHiddenTreasures}"
	end
end
