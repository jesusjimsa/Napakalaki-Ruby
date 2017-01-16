require 'singleton'
require './TreasureKind'
require './Treasure'
require './Prize'
require './badconsequence.rb'
require './Monster'
require './specific_bad_consequence.rb'
require './numeric_bad_consequence.rb'
require './death_bad_consequence.rb'
require "cultist.rb"

module Napakalaki

	class CardDealer
		include Singleton
	
		def initialize
			@unusedMonsters = Array.new
			@usedMonsters = Array.new
			@unusedTreasures = Array.new
			@usedTreasures = Array.new
			@unusedCultists = Array.new
		end
	
		def initTreasureCardDeck
			@unusedTreasures << Treasure.new("Si,mi amo!", 4, TreasureKind::HELMET)
			@unusedTreasures << Treasure.new("Botas de investigacion", 3, TreasureKind::SHOES)
			@unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, TreasureKind::HELMET)
			@unusedTreasures << Treasure.new("A prueba de babas", 2, TreasureKind::ARMOR)
			@unusedTreasures << Treasure.new("Botas de lluvia acida", 1, TreasureKind::BOTHHANDS)
			@unusedTreasures << Treasure.new("Casco minero", 2, TreasureKind::HELMET)
			@unusedTreasures << Treasure.new("Ametralladora ACME", 4, TreasureKind::BOTHHANDS)
			@unusedTreasures << Treasure.new("Camiseta de la ETSIIT", 1, TreasureKind::ARMOR)
			@unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND)
			@unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)
			@unusedTreasures << Treasure.new("Fez alopodo", 3, TreasureKind::HELMET)
			@unusedTreasures << Treasure.new("Hacha prehistorica", 2, TreasureKind::ONEHAND)
			@unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, TreasureKind::ARMOR)
			@unusedTreasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)
			@unusedTreasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)
			@unusedTreasures << Treasure.new("Escopeta de 3 caniones", 4, TreasureKind::BOTHHANDS)
			@unusedTreasures << Treasure.new("Garabato mistico", 2, TreasureKind::ONEHAND)
			@unusedTreasures << Treasure.new("La rebeca metalica", 2, TreasureKind::ARMOR)
			@unusedTreasures << Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS)
			@unusedTreasures << Treasure.new("Necrocomicon", 1, TreasureKind::ONEHAND)
			@unusedTreasures << Treasure.new("Necronomicon", 5, TreasureKind::BOTHHANDS)
			@unusedTreasures << Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS)
			@unusedTreasures << Treasure.new("Necrognomicon", 2, TreasureKind::ONEHAND)
			@unusedTreasures << Treasure.new("Necrotelecom", 2, TreasureKind::HELMET)
			@unusedTreasures << Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND)
			@unusedTreasures << Treasure.new("NecroPlayboycon", 3, TreasureKind::ONEHAND)	#¿Va con segundas lo de una mano con Playboy? Jajaja
			@unusedTreasures << Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND)
			@unusedTreasures << Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS)
			@unusedTreasures << Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND)
			@unusedTreasures << Treasure.new("Tentaculo de pega", 2, TreasureKind::HELMET)
			@unusedTreasures << Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOES)
		end
	
		def initMonsterCardDeck
			# 3 Byakhees de bonanza
			prize = Prize.new(2,1)
			badConsequence = SpecificBadConsequence.new("Pierdes tu armadura visible y otra oculta", 0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
			@unusedMonsters << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)

			# Tenochtitlan
			prize = Prize.new(1,1)
			badConsequence = SpecificBadConsequence.new("Embobados con el lindo primigenio te descartas de tu casco visible", 0, [TreasureKind::HELMET], 0)
			@unusedMonsters << Monster.new("Tenochtitlan", 2, badConsequence, prize)

			# El sopor de Dunwich
			prize = Prize.new(1,1)
			badConsequence = SpecificBadConsequence.new("El primordial bostezo contagioso. Pierdes el calzado visible", 0, [TreasureKind::SHOES], 0)
			@unusedMonsters << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)

			# Demonios de Magaluf
			prize = Prize.new(4,1)
			badConsequence = SpecificBadConsequence.new("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta", 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
			@unusedMonsters << Monster.new("Demonios de Magaluf", 2, badConsequence, prize)

			# El gorrón en el umbral
			prize = Prize.new(3,1)
			badConsequence = NumericBadConsequence.new("Pierdes todos tus tesoros visibles", 0, 50 ,0)
			@unusedMonsters << Monster.new("El gorron en el umbral", 13, badConsequence, prize)

			# H.P. Munchcraft
			prize = Prize.new(2, 1)
			badConsequence = SpecificBadConsequence.new("Pierdes la armadura visible", 0, [TreasureKind::ONEHAND], 0)
			@unusedMonsters << Monster.new("H.P. Munchcraft", 6, badConsequence, prize)

			# Necrófago
			prize = Prize.new(1,1)
			badConsequence = SpecificBadConsequence.new("Sientes bichos bajo la ropa. Descarta la armadura visible", 0, [TreasureKind::ARMOR], 0)
			@unusedMonsters << Monster.new("Necrofago", 13, badConsequence, prize)

			# El rey de rosado
			prize = Prize.new(4,2)
			badConsequence = NumericBadConsequence.new("Pierdes 5 niveles y 3 tesoros visibles", 5 , 3, 0)
			@unusedMonsters << Monster.new("El rey de rosado",13, badConsequence, prize)

			# Flecher
			prize = Prize.new(1,1)
			badConsequence = NumericBadConsequence.new("Toses los pulmones y pierdes 2 niveles", 2 , 0, 0)
			@unusedMonsters << Monster.new("Flecher", 2, badConsequence, prize)

			# Los hondos
			prize = Prize.new(2,1)
			badConsequence = DeathBadConsequence.new("Estos monstruos resultanbastante superficiales y te aburren mortalmente. Estas muerto")
			@unusedMonsters << Monster.new("Los hondos", 8, badConsequence, prize)

			#Semillas Cthulu
			prize = Prize.new(2,1)
			badConsequence = NumericBadConsequence.new("Pierdes 2 niveles y 2 tesoros ocultos", 2 , 0, 2)
			@unusedMonsters << Monster.new("Semillas Cthulu", 4, badConsequence, prize)

			# Dameargo cohone
			prize = Prize.new(2,1)
			badConsequence = SpecificBadConsequence.new("Te intentas escaquear. Pierdes una mano visible", 0 , [TreasureKind::ONEHAND], 0)
			@unusedMonsters << Monster.new("Dameargo", 1, badConsequence, prize)

			# Pollipiólipo volante
			prize = Prize.new(3,1)
			badConsequence = NumericBadConsequence.new("Da mucho asquito.Pierdes 3 niveles.", 3, 0, 0)
			@unusedMonsters << Monster.new("Pollipiolipo volante", 3, badConsequence, prize)

			# Y skhtihyssg-Goth
			prize = Prize.new(3,1)
			badConsequence = DeathBadConsequence.new("No le hace gracia que pronuncien mal su nombre. Estas muerto")
			@unusedMonsters << Monster.new("Y skhtihyssg-Goth", 14, badConsequence, prize)

			# Familia Feliz
			prize = Prize.new(3,1)
			badConsequence = DeathBadConsequence.new("La familia te atrapa. Estas muerto.")
			@unusedMonsters << Monster.new("Familia feliz", 1, badConsequence, prize)

			# Roboggoth
			prize = Prize.new(2,1)
			badConsequence = SpecificBadConsequence.new("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visibles", 2, [TreasureKind::BOTHHANDS], 0)
			@unusedMonsters << Monster.new("Roboggoth", 1, badConsequence, prize)

			# El espía sordo
			prize = Prize.new(1,1)
			badConsequence = SpecificBadConsequence.new("Te asusta en la noche. Pierdes un casco visible", 0, [TreasureKind::HELMET], 0)
			@unusedMonsters << Monster.new("El espia sordo", 5, badConsequence, prize)

			# Tongue
			prize = Prize.new(2,1)
			badConsequence = NumericBadConsequence.new("Menudo susto te llevas. Pierdes 2 niveles y 2 tesoros visibles", 2, 2, 0)
			@unusedMonsters << Monster.new("Tongue", 19, badConsequence, prize)

			# Bicéfalo
			prize = Prize.new(2,1)
			badConsequence = SpecificBadConsequence.new("Te faltan manos paratanta cabeza. Pierdes 3 niveles y tustesoros visibles de las manos.", 3, 50, 0)
			@unusedMonsters << Monster.new("Bicefalo", 21, badConsequence, prize)
			
			# Elmal indecible impronunciable
			badcon = SpecificBadConsequence.new("Pierdes 1 mano visible", 0, [TreasureKind::ONEHAND], [])
			prize = Prize.new(3, 1);
			@unusedMonsters << Monster.new("El mal indecible impronunciable", 10, badcon, prize, -2)
			
			# Testigos oculares
			badcon = NumericBadConsequence.new("Pierdes tus tesoros visibles. Jajaja", 0, NumericBadConsequence.MAXTREASURES, 0)
			prize = Prize.new(2, 1);
			@unusedMonsters << Monster.new("Testigos Oculares", 6, badcon, prize, 2)
			
			# El gran Cthulhu
			badcon = DeathBadConsequence.new("Hoy no es tu dia de suerte. Mueres");
			prize = Prize.new(2, 5);
			@unusedMonsters << Monster.new("El gran cthulhu", 20, badcon, prize, 4)
			
			# Serpiente político
			badcon = NumericBadConsequence.new("Tu gobierno te recorta 2 niveles", 2, 0, 0);
			prize = Prize.new(2, 1);
			@unusedMonsters << Monster.new("Serpiente politico", 8, badcon, prize, -2)
			
			# Felpuggoth
			badcon = SpecificBadConsequence.new("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas", 0, 
				[TreasureKind::HELMET, TreasureKind::ARMOR], [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS])
			prize = Prize.new(1, 1);
			@unusedMonsters << Monster.new("Felpuggoth", 2, badcon, prize, 5)
			
			# Soggoth
			badcon = NumericBadConsequence.new("Pierdes 2 niveles", 2, 0, 0);
			prize = Prize.new(4, 2);
			@unusedMonsters << Monster.new("Shoggoth", 16, badcon, prize, -4)
			
			# Lolitagooth
			badcon = NumericBadConsequence.new("Pintalabios negro. Pierdes 2 niveles", 2, 0, 0);
			prize = Prize.new(1, 1);
			@unusedMonsters << Monster.new("Lolitagooth", 2, badcon, prize, 3)
		end
		
		def initCultistCardDeck
			@unusedCultist = Array.new
			
			@unusedCultist << Cultist.new("Sectario 1", 1)
			@unusedCultist << Cultist.new("Sectario 2", 2)
			@unusedCultist << Cultist.new("Sectario 3", 1)
			@unusedCultist << Cultist.new("Sectario 4", 2)
			@unusedCultist << Cultist.new("Sectario 5", 1)
			@unusedCultist << Cultist.new("Sectario 6", 1)
		end
		
		def shuffleTreasures
			@unusedTreasures.shuffle!
		end
		
		def shuffleMonsters
			@unusedMonsters.shuffle!
		end
		
		def shuffleCultists
			@unusedCultists.shuffle!
		end
		
		def giveTreasureBack(t)
			@usedTreasures << t
		end
		
		def giveMonsterBack(m)
			@usedMonsters << m
		end
		
		def nextTreasure
			if(@unusedTreasures.size != 0)
				siguiente = @unusedTreasures[@unusedTreasures.size - 1]
				@unusedTreasures.pop
			else
				@unusedTreasures = @usedTreasures
				@unusedTreasures.shuffle!
				
				siguiente = @unusedTreasures[@unusedTreasures.size - 1]
			end
			
			siguiente	#return
		end
		
		def nextMonster
			if(@unusedMonsters.size != 0)
				siguiente = @unusedMonsters[@unusedMonsters.size - 1]
				@unusedMonsters.pop
			else
				@unusedMonsters = @usedMonsters
				@unusedMonsters.shuffle!
				
				siguiente = @unusedMonsters[@unusedMonsters.size - 1]
			end
			siguiente	#return
		end
		
		def nextCultist
			if (@unusedCultist.empty?)
				initCultistCardDeck
				shuffleCultist
			end
    
			siguiente = @unusedCultist.get(0)
			@unusedCultist.remove(siguiente)
    
			siguiente #return
		end
	
		def initCards
			initTreasureCardDeck
			shuffleTreasures
		
			initMonsterCardDeck
			shuffleMonsters
		
			initCultistCardDeck
			shuffleCultists
		end
	end
end