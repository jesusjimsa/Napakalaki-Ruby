
class Prize
	attr_accessor :levels
	attr_accessor :treasures
  
	def initialize(treasures, levels)
		@levels = levels;
		@treasures = treasures;
	end
	
	def winlevelsfrom(lvl)
		resultado = (levels > lvl)
		
		resultado #return
	end
	
	def toString
		"Tesoros ganados: #{@treasures}\nNiveles ganados: #{@levels}"
	end
	
	#El método new tiene visibilidad privada
#	private_class_method :new
end
