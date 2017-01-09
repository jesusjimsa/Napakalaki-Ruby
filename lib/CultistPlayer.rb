require_relative 'player'

class CultistPlayer < Player
	@@totalCultistPlayers = 0
  
	def initialize(p, c)
		super(p)
		@myCultistCard = c
		@@totalCultistPlayers += 1
	end
  
	def getCombatLevel
		level = super.getCombatLevel
		level = (level + (level * 0.7) + @myCultistCard.getGainedLevels )
		return combatLevel.to_i #return
	end
  
	def getOponentLevel(m)
		return m.getCombatLevelAgainstCultistPlayer
	end
  
	def shouldConvert()
		return false
	end
  
	def giveMeATreasure
		@visibleTreasures[ rand ( @visibleTreasures.size - 1 ) ]
	end
  
	def canYouGiveMeATreasure()
		return ( @visibleTreasures != nil || ! @visibleTreasures.empty? )
	end
  
	def getTotalCultistPlayers()
		return @@totalCultistPlayers
	end
end