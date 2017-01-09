# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class SpecificBadConsequence
	def initialize(text = "", levels = 0, specificVisible = Array.new, specificHidden = Array.new)
		super(text, levels, specificVisible, specificHidden)
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
		
		bc = SpecificBadConsequence.new(@text, 0, specificVisible, specificHidden)
		
		bc	#return
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
	
	def isEmpty
		(@specificVisibleTreasures.size == 0 && @specificHiddenTreasures == 0)	#return
	end
end