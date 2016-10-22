# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Prize
	
	def initialize(treasures, levels)
		@levels = levels;
		@treasures = treasures;
	end
	
	attr_accessor :levels
	attr_accessor :treasures
	
	def winlevelsfrom(lvl)
		resultado = (levels > lvl)
		
		resultado #return
	end
	
	def toString
		"Tesoros ganados: #{@treasures}\nNiveles ganados: #{@levels}"
	end
	
	#El método new tiene visibilidad privada
	private_class_method :new
end
