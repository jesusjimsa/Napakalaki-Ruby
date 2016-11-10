class CardDealer
	def intitialize
		@@unusedMonsters = Array.new
		@@usedMonsters = Array.new
		@@unusedTreasures = Array.new
		@@usedTreasures = Array.new
	end
	
	def initTreasureCardDeck
		@@unusedTreasures << Treasure.new("Si,mi amo!", 4, TreasureKind::HELMET)
		@@unusedTreasures << Treasure.new("Botas de investigacion", 3, TreasureKind::SHOES)
		@@unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, TreasureKind::HELMET)
		@@unusedTreasures << Treasure.new("A prueba de babas", 2, TreasureKind::ARMOR)
		@@unusedTreasures << Treasure.new("Botas de lluvia acida", 1, TreasureKind::BOTHHANDS)
		@@unusedTreasures << Treasure.new("Casco minero", 2, TreasureKind::HELMET)
		@@unusedTreasures << Treasure.new("Ametralladora ACME", 4, TreasureKind::BOTHHANDS)
		@@unusedTreasures << Treasure.new("Camiseta de la ETSIIT", 1, TreasureKind::ARMOR)
		@@unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND)
		@@unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)
		@@unusedTreasures << Treasure.new("Fez alopodo", 3, TreasureKind::HELMET)
		@@unusedTreasures << Treasure.new("Hacha prehistorica", 2, TreasureKind::ONEHAND)
		@@unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, TreasureKind::ARMOR)
		@@unusedTreasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)
		@@unusedTreasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)
		@@unusedTreasures << Treasure.new("Escopeta de 3 caniones", 4, TreasureKind::BOTHHANDS)
		@@unusedTreasures << Treasure.new("Garabato mistico", 2, TreasureKind::ONEHAND)
		@@unusedTreasures << Treasure.new("La rebeca metalica", 2, TreasureKind::ARMOR)
		@@unusedTreasures << Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS)
		@@unusedTreasures << Treasure.new("Necrocomicon", 1, TreasureKind::ONEHAND)
		@@unusedTreasures << Treasure.new("Necronomicon", 5, TreasureKind::BOTHHANDS)
		@@unusedTreasures << Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS)
		@@unusedTreasures << Treasure.new("Necrognomicon", 2, TreasureKind::ONEHAND)
		@@unusedTreasures << Treasure.new("Necrotelecom", 2, TreasureKind::HELMET)
		@@unusedTreasures << Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND)
		@@unusedTreasures << Treasure.new("NecroPlayboycon", 3, TreasureKind::ONEHAND)	#¿Va con segundas lo de una mano con Playboy? Jajaja
		@@unusedTreasures << Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND)
		@@unusedTreasures << Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS)
		@@unusedTreasures << Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND)
		@@unusedTreasures << Treasure.new("Tentaculo de pega", 2, TreasureKind::HELMET)
		@@unusedTreasures << Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOES)
	end
	
	def initMonsterCardDeck
		# 3 Byakhees de bonanza
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes tu armadura visible y otra oculta", 0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
		@@unusedMonsters << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)

		# Tenochtitlan
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Embobados con el lindo primigenio te descartas de tu casco visible", 0, [TreasureKind::HELMET], 0)
		@@unusedMonsters << Monster.new("Tenochtitlan", 2, badConsequence, prize)

		# El sopor de Dunwich
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("El primordial bostezo contagioso. Pierdes el calzado visible", 0, [TreasureKind::SHOES], 0)
		@@unusedMonsters << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)

		# Demonios de Magaluf
		prize = Prize.new(4,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta", 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
		@@unusedMonsters << Monster.new("Demonios de Magaluf", 2, badConsequence, prize)

		# El gorrón en el umbral
		prize = Prize.new(3,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes todos tus tesoros visibles", 0, 50 ,0)
		@@unusedMonsters << Monster.new("El gorron en el umbral", 13, badConsequence, prize)

		# H.P. Munchcraft
		prize = Prize.new(2, 1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes la armadura visible", 0, [TreasureKind::ONEHAND], 0)
		@@unusedMonsters << Monster.new("H.P. Munchcraft", 6, badConsequence, prize)

		# Necrófago
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible", 0, [TreasureKind::ARMOR], 0)
		@@unusedMonsters << Monster.new("Necrofago", 13, badConsequence, prize)

		# El rey de rosado
		prize = Prize.new(4,2)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles", 5 , 3, 0)
		@@unusedMonsters << Monster.new("El rey de rosado",13, badConsequence, prize)

		# Flecher
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles", 2 , 0, 0)
		@@unusedMonsters << Monster.new("Flecher", 2, badConsequence, prize)

		# Los hondos
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Estos monstruos resultanbastante superficiales y te aburren mortalmente. Estas muerto", 0, 0, 0)
		@@unusedMonsters << Monster.new("Los hondos", 8, badConsequence, prize)

		#Semillas Cthulu
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 tesoros ocultos", 2 , 0, 2)
		@@unusedMonsters << Monster.new("Semillas Cthulu", 4, badConsequence, prize)

		# Dameargo cohone
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Te intentas escaquear. Pierdes una mano visible", 0 , [TreasureKind::ONEHAND], 0)
		@@unusedMonsters << Monster.new("Dameargo", 1, badConsequence, prize)

		# Pollipiólipo volante
		prize = Prize.new(3,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito.Pierdes 3 niveles.", 3, 0, 0)
		@@unusedMonsters << Monster.new("Pollipiolipo volante", 3, badConsequence, prize)

		# Y skhtihyssg-Goth
		prize = Prize.new(3,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("No le hace gracia que pronuncien mal su nombre. Estas muerto", 0, 0, 0)
		@@unusedMonsters << Monster.new("Y skhtihyssg-Goth", 14, badConsequence, prize)

		# Familia Feliz
		prize = Prize.new(3,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("La familia te atrapa. Estas muerto.", 0, 0, 0)
		@@unusedMonsters << Monster.new("Familia feliz", 1, badConsequence, prize)

		# Roboggoth
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visibles", 2, [TreasureKind::BOTHHANDS], 0)
		@@unusedMonsters << Monster.new("Roboggoth", 1, badConsequence, prize)

		# El espía sordo
		prize = Prize.new(1,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Te asusta en la noche. Pierdes un casco visible", 0, [TreasureKind::HELMET], 0)
		@@unusedMonsters << Monster.new("El espia sordo", 5, badConsequence, prize)

		# Tongue
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 2 tesoros visibles", 2, 2, 0)
		@@unusedMonsters << Monster.new("Tongue", 19, badConsequence, prize)

		# Bicéfalo
		prize = Prize.new(2,1)
		badConsequence = BadConsequence.newLevelNumberOfTreasures("Te faltan manos paratanta cabeza. Pierdes 3 niveles y tustesoros visibles de las manos.", 3, 50, 0)
		@@unusedMonsters << Monster.new("Bicefalo", 21, badConsequence, prize)
	end
	
	def shuffleTreasures
		@@unusedTreasures.shuffle!
	end
	
	def shuffleMonsters
		@@unusedMonsters.shuffle!
	end
	
	def giveTreasureBack(t)
		@@usedTreasures << t
	end
	
	def giveMonsterBack(m)
		@@usedMonsters << m
	end
end