# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'
require './Player'
require './CardDealer'

module Napakalaki

	class Napakalaki
		include Singleton
	
		attr_reader :currentPlayer
		attr_reader :currentMonster
	
		def initialize
			@players = Array.new
			@currentPlayer = nil
			@currentMonster = nil
			@dealer = CardDealer.instance
			@primera_jugada = true
		end
	
		def initPlayer(names)
			for i in 0..names.size - 1 do
				@players << Player.new(names[i])
			end
		end
		#	
		#	def getCurrentPlayer
		#		@currentPlayer
		#	end
		#	
		#	def getCurrentMonster
		#		@currentMonster
		#	end
		#	
		def nextPlayer
			siguiente = 0
		
			if(@primera_jugada)
				@primera_jugada = false
				siguiente = rand(@players.size)
			else
				for i in 0..(@players.size - 1) do
					if(@currentPlayer == @players[i])
						if(i != @players.size)
							siguiente = i + 1
						else
							siguiente = 0
						end
					end
				end
			end
		
			@players.at(siguiente)	#return
		end
	
		def nextTurnAllowed
			valido = false
		
			if(@currentPlayer == nil)
				valido = true
			end
		
			if(@currentPlayer.validState)
				valido = true
			end
		
			valido	#return
		end
	
		def setEnemies
			for i in 0..(@players.size - 1) do
				aleatorio = rand(@players.size)
			
				if(i == aleatorio)
					aleatorio = rand(@players.size)
				end
			
				@players[i].enemy = Player.new(@players[aleatorio].name)
			end
		end
	
		def developCombat
			combatResult = @currentPlayer.combat(@currentMonster)
			@dealer.giveMonsterBack(@currentMonster)
    
			if (combatResult == CombatResult::LOSEANDCONVERT)
				cultista = @dealer.nextCultist
				cultistPlayer = CultistPlayer.new(@currentPlayer, culstista)
      
				for player in @players
					if (player.enemy == @currentPlayer)
						player.enemy = cultistPlayer
					end
				end
      
				@players[@players.index(@currentPlayer)] = cultistPlayer
				@currentPlayer = cultistPlayer
			end
		
			combatResult	#return
		end
	
		def discardVisibleTreasures(treasures)
			for i in 0..treasures.size-1
				treasure = treasures[i]
				@currentPlayer.discardVisibleTreasure(treasure)
				@dealer.giveTreasureBack(treasure)
			end
		end
	
		def discardHiddenTreasures(treasures)
			for i in 0..treasures.size-1
				treasure = treasures[i]
				@currentPlayer.dicardHiddenTreasure(treasure)
				@dealer.giveTreasureBack(treasure)
			end
		end
	
		def makeTreasuresVisible(treasures)
			for i in 0..treasures.size-1
				t = CardDealer.nextTreasure
				makeTreasureVisible(t)
			end
		end
	
		def initGame(players)
			initPlayer(players)
			setEnemies
			nextTurn
			@dealer.initCards
		end
	
		def nextTurn
			@currentPlayer = nextPlayer
		
			stateOK = nextTurnAllowed
		
			if(stateOK)
				@currentMonster = @dealer.nextMonster
				dead = @currentPlayer.isDead
			
				if(dead)
					@players.initTreasures  ###@currentplayer.initTreasures???????
				end
			end
		
			stateOK		#return
		end
	
	
		def endOfGame(result)
			(result == CombatResult::WINGAME)	#return
		end
	end
end