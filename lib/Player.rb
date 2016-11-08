import Array

class Player
  
 	#Consultores
	attr_reader :name
	attr_reader :level
    attr_writer :pendingBadConsequence
    attr_writer :enemy
	attr_reader :dead
  attr_reader :canISteal
  
	#Constructores
	def initialize(name)
		@name = name
		@level = 0
        @hiddenTreasures = Array.new
        @visibleTreasures = Array.new
        @pendingBadConsequence = nil
        @enemy = nil
    end
	
	def self.copia(jugador)
		nuevoObjeto = allocate
		
		@name = jugador.name
		@level = jugador.level
		
		nuevoObjeto #return
	end
  
  def isDead()
        @dead
  end
  
  def getCombatLevel()
        @level + #bonus de los tesoros equipados
  end
  
  def bringToLife()
        @dead = false
  end
  
  def incrementLevels(i)
            @level + i
  end
  
  def decrementLevels(i)
        if (@level > i)
            @level - i
        else
            @level = 0
  end
  
  def dieIfNoTreasures
        if (@hiddenTreasures == 0 && @visibleTreasures == 0)
            @dead = true
  end
  
  def validState()
        if (@pendingBadConsequence.isEmpty() && @hiddenTreasures.size <= 4)
            true
        else
            false
  end
  
  def howManyVisibleTreasures(tKind)
        cont = 0
        for i in 0..@visibleTreasures.size
            if (@visibleTreasures[i] == tKind)
                cont = cont + 1
        cont
  end
  
  def canISteal()
        @canISteal
  end
  
  def haveStolen()
        @canISteal = false
  end
  
  def canYouGiveMeATreasure
        if (@hiddenTreasures.size != 0 && @visibleTreasures.size != 0)
            true
        else
            false
  end
	
