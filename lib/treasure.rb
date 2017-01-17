# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require './treasurekind.rb'

module Napakalaki

	class Treasure
		def initialize(name, bonus, type)
			@name = name
			@bonus = bonus
			@type = type
		end
		
		def to_s
			"#{@name}"
		end
	
		attr_reader :name
		attr_reader :bonus
		attr_reader :type
	end
end