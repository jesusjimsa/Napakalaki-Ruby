# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

include Singleton

class Napakalaki
	attr_reader :currentPlayer
	attr_reader :currentMonster
	
	def initialize
		@@players = Array.new
		@@currentPlayer
		@@currentMonster
		@@dealer
		@@primera_jugada = true
	end
	
	def initPlayer(names)
		for i in 0..(names.size) do
			@@players << Player.new(names)
		end
	end
	
	def nextPlayer
		siguiente = 0
		
		if(@@primera_jugada)
			@@primera_jugada = false
			siguiente = rand(@@players.size)
		else
			for i in 0..(@@players.size) do
				if(@@currentPlayer == @@players[i])
					if(i != @@players.size)
						siguiente = i + 1
					else
						siguiente = 0
					end
				end
			end
		end
		
		@@players.at(siguiente)	#return
	end
	
	def nextTurnAllowed
		valido = false
		
		if(@@currentPlayer == nil)
			valido = true
		end
		
		if(@@currentPlayer.validState)
			valido = true
		end
		
		valido	#return
	end
	
	def setEnemies
		aleatorio
		
		for i in 0..(@@players.size) do
			aleatorio = rand(@@players.size)
			
			if(i == aleatorio)
				aleatorio = rand(@@players.size)
			end
			
			@@players[i].enemy = @@players[aleatorio]
		end
	end
	
	def developCombat
		combatResult = @@currentPlayer.combat(@@currentMonster)
		@@dealer.giveMonsterBack(@@currentMonster)
		
		combatResult	#return
	end
	
	def discardVisibleTreasures(treasures)
		for i in 0..treasures.size-1
			treasure = treasures[i]
			@@currentPlayer.discardVisibleTreasure(treasure)
			@@dealer.giveTreasureBack(treasure)
		end
	end
	
	def discardHiddenTreasures(treasures)
		for i in 0..treasures.size-1
			treasure = treasures[i]
			@@currentPlayer.dicardHiddenTreasure(treasure)
			@@dealer.giveTreasureBack(treasure)
		end
	end
	
#	def makeTreasuresVisible(treasures)
#		
#	end
	
	def initGame(players)
		initPlayer(players)
		setEnemies
		nextTurn
		@@dealer.initCards
	end
	
	def nextTurn
		stateOK = nextTurnAllowed
		
		if(stateOK)
			@@currentMonster = @@dealer.nextMonster
			@@currentPlayer = nextPlayer
			dead = @@currentPlayer.isDead
			
			if(dead)
				@@players.initTreasures
			end
		end
		
		stateOK		#return
	end
	
	
	def endOfGame(result)
		(result == CombatResult::WINGAME)	#return
	end
end
