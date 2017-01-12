module Napakalaki

	class Player
  
		#Consultores
		attr_reader :name
		attr_reader :level
		attr_writer :pendingBadConsequence
		attr_writer :enemy
		attr_reader :dead
		attr_reader :canISteal
		attr_reader :visibleTreasures
		attr_reader :hiddenTreasures
	
		@@MAXLEVEL = 10
  
		#Constructores
		def initialize(name)
			@name = name
			@level = 1
			@hiddenTreasures = Array.new
			@visibleTreasures = Array.new
			@pendingBadConsequence = nil
			@enemy = nil
			@dead = true
			@canISteal = true
		end
	
		def self.copia(jugador)
			nuevoObjeto = allocate
		
			@name = jugador.name
			@level = jugador.level
		
			nuevoObjeto #return
		end
	
		def self.MAXLEVEL
			@@MAXLEVEL
		end
  
		def isDead()
			@dead
		end
  
		def getCombatLevel()
			@level
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
		end
  
		def dieIfNoTreasures
			@dead = (@hiddenTreasures == 0 && @visibleTreasures == 0)
			@level = 1
		end
  
		def combat(m)
			myLevel = getCombatLevel
			monsterLevel = getOponentLevel(m)
    
			if (!canISteal)
				lanzar = Dice.instance.nextNumber
				
				if (lanzar < 3)
					enemyLevel = enemy.getCombatLevel
				end
			end
    
			if (myLevel > monsterLevel)
				applyPrice(m)
				if (level >= MAXLEVEL)
					combatResult = CombatResult::WINGAME
				else
					combatResult = CombatResult::WIN
				end
			else
				applyBadConsequence(m)
				combatResult = CombatResult::LOSE
			end
  
			if (combatResult == CombatResult::LOSE)
				if (shouldConvert)
					combatResult = CombatResult::LOSEANDCONVERT
				end
			end
  
			combatResult #return
  
		end
  
		def validState
			estado = (@pendingBadConsequence != nil && @hiddenTreasures.size <= 4)
		
			estado	#return
		end
  
		def howManyVisibleTreasures(tKind)
			cont = 0
			for i in 0..(@visibleTreasures.size - 1)
				if (@visibleTreasures[i].type == tKind)
					cont += 1
				end
			end
			
			cont	#return
		end
  
		def canISteal()
			@canISteal	#return
		end
  
		def haveStolen()
			@canISteal = false	#return
		end
  
		def canYouGiveMeATreasure
			(@hiddenTreasures.size != 0 && @visibleTreasures.size != 0)   #return 
		end
	
		def canMakeTreasureVisible(t)
			can_make_it = true
		
			if(t.type == TreasureKind::BOTHHANDS)
				i = 0
			
				while(i < @visibleTreasures.size && can_make_it)
					can_make_it = (@visibleTreasures[i].type != TreasureKind::BOTHHAND && @visibleTreasures[i] != TreasureKind::ONEHAND)
					i += 1
				end
			elsif(t.type == TreasureKind::ONEHAND)
				total_one_hand = 0
				i = 0
			
				while(i < @visibleTreasures.size && can_make_it)
					if (@visibleTreasures[i].type == TreasureKind::ONEHAND)
						total_one_hand += 1
					end
				
					can_make_it = (@visibleTreasures[i].type != TreasureKind::BOTHHAND && total_one_hand < 2)
					i += 1
				end
			else
				i = 0
			
				while(i < @visibleTreasures.size && can_make_it)
					can_make_it = (@visibleTreasures[i].type != t.type)
					i += 1
				end
			end
		
			can_make_it	#return
		end
		
		def makeTreasureVisible(t)
			if(canMakeTreasureVisible(t))
				@visibleTreasures << t
				@hiddenTreasures.delete_at(@hiddenTreasures.index(t) || @hiddenTreasures.length)
			end
		end
	
		def giveMeATreasure
			@hiddenTreasures[rand(@hiddenTreasures.size)]	#return
		end
	
		def applyPrize(m)
			nLevels = m.getLevelsGained
			incrementLevels(nLevels)
			nTreasures = m.getTreasuresGained
		
			if(nTreasures > 0)
				dealer = CardDealer.instance
			
				for i in 1..(nTreasures - 1)
					treasure = dealer.nextTreasure
				
					@hiddenTreasures << treasure
				end
			end
		end
	
		def applyBadConsequence(m)
			badConsequence = m.bc
			nLevels = badConsequence.levels
		
			decrementLevels(nLevels)
		
			pendingBad = adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
		
			@pendingBadConsequence = pendingBad
		end
	
		def stealTreasure
			canI = canISteal
			treasure = nil
		
			if(canI)
				canYou = enemy.canYouGiveMeATreasure
			
				if(canYou)
					treasure = enemy.giveMeATreasure
				
					@hiddenTreasures << treasure
				
					haveStolen
				end
			end
		
			treasure	#return
		end
	
		def discardAllTreasures
			visibleList = Array.new
			hiddenList = Array.new
		
			for i in 0..@visibleTreasures.size-1
				visibleList << @visibleTreasures[i]
			end
		
			for i in 0..@hiddenTreasures.size-1
				hiddenList << @hiddenTreasures[i]
			end
		
			for i in 0..@visibleTreasures.size-1
				discardVisibleTreasure(visibleList[i])
			end
		end
	
		def dicardVisibleTreasure(t)
			@visibleTreasures.delete(t)
		
			if(@pendingBadConsequence != nil && !@pendingBadConsequence.isEmpty)
				@peningBadConsequence.substractVisibleTreasure(t)
			end
		
			dieIfNoTreasures
		end
	
		def dicardHiddenTreasure(t)
			@hiddenTreasures.delete(t)
		
			if(@pendingBadConsequence != nil && !@pendingBadConsequence.isEmpty)
				@peningBadConsequence.substractHiddenTreasure(t)
			end
		
			dieIfNoTreasures
		end
	
		def initTreasures
			dealer = CardDealer.instance
			dice = Dice.instance
			bringToLife
		
			treasure = dealer.nextTreasure
			@hiddenTreasure << treasure
		
			number = dice.nextNumber
		
			if(number > 1)
				treasure = dealer.nextTreasure
				@hiddenTreasure << treasure
			
				number = dice.nextNumber
			end
		
			if(number == 6)
				treasure = dealer.nextTreasurean
				@hiddenTreasure << treasure
			
				number = dice.nextNumber
			end
		end
	
		def getOponentLevel(m)
			return m.combatLevel
		end
	
		def shouldConvert
			return (Dice.instance.nextNumber == 6)
		end
	
		def to_s
			"#{@name}"
		end
	end
end
