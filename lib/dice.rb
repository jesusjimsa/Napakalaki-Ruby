# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

include Singleton

class Dice
	def initialize
		@@number
	end
	
	def nextNumber
		@@number = rand(6) + 1
	end
end
