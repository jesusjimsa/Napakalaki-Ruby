require_relative 'player'

class CultistPlayer < Player
  @@totalCultistPlayers = 0
  
  def initialize(p, c)
  end
  
  def getCombatLevel()
    nivel = @level
    nivel = (nivel +
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
    if ( @visibleTreasures != nil || ! @visibleTreasures.empty? )
      return true
    else
      return false
  end
  
  def getTotalCultistPlayers()
    return @@totalCultistPlayers
  end
 end
  
  
