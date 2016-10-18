# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Prize
<<<<<<< HEAD
	@@levels
	@@treasures
	
	def initialize(treasures, levels)
		@levels = levels;
		@treasures = treasures;
	end
	
	attr_accessor:levels
	attr_accessor:treasures
	
	def winlevelsfrom(lvl)
		@@return
		if (@levels > lvl)
			@return = true
		end
		return
	end
	
=======
  @@levels
  @@treasures
  
  def initialize(treasures, levels)
    @levels = levels;
    @treasures = treasures;
  end
  
  attr_accessor:levels
  attr_accessor:treasures
  
  def winlevelsfrom(lvl)
    @@return
    if (@levels > lvl)
      @return = true
    end
    return
  end
  
>>>>>>> cd071a1a1619656fdb381cd13cd4013d62618524
end
