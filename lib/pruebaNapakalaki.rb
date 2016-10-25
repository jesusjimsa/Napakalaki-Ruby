require './monster'
require './prize'
require './badconsequence'
#Array para guardar los monstruos
@@monsters = Array.new

def nivelSuperior(lista, lvl)
	devolver = Array.new

	for i in 0..lista.size do
		if (lista[i].combatLevel) > lvl then
			devolver.push(lista[i])
		end
	end
  
	devolver   #return
end

def onlyLoseLevels(lista)
	devolver = Array.new
	
	for i in 0..lista.size do
		if lista[i].onlyLoseLevels() then
			devolver.push(lista[i])
		end
	end
	
	devolver #return
end

def winLevelsFrom (lista, level)
	devolver = Array.new
	
	for i in 0..lista.size do
		if lista[i].winLevelsFrom(level) then
			devolver.push(lista[i])
		end
	end
	
	devolver #return
end

def loseTreasure(lista, treasure, visible)
	devolver = Array.new
	
	for i in 0..lista.size do
		if lista[i].loseTreasure(treasure, visible) then
			devolver.push(lista[i])
		end
	end
	
	devolver #return
end

#Contrucción de los monstruos

# 3 Byakhees de bonanza
prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes tu armadura visible y otra oculta', 0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
@@monsters << Monster.new('3 Byakhees de bonanza', 8, badConsequence, prize)

# Tenochtitlan
prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Embobados con el lindo primigenio te descartas de tu casco visible', 0, [TreasureKind::HELMET], 0)
@@monsters << Monster.new('Tenochtitlan', 2, badConsequence, prize)

# El sopor de Dunwich
prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('El primordial bostezo contagioso. Pierdes el calzado visible', 0, [TreasureKind::SHOES], 0)
@@monsters << Monster.new('El sopor de Dunwich', 2, badConsequence, prize)

# Demonios de Magaluf
prize = Prize.new(4,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta', 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
@@monsters << Monster.new('Demonios de Magaluf', 2, badConsequence, prize)

# El gorrón en el umbral
prize = Prize.new(3,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros visibles', 0, 50 ,0)
@@monsters << Monster.new('El gorron en el umbral', 13, badConsequence, prize)

# H.P. Munchcraft
prize = Prize.new(2, 1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes la armadura visible', 0, [TreasureKind::ONEHAND], 0)
@@monsters << Monster.new('H.P. Munchcraft', 6, badConsequence, prize)

# Necrófago
prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Sientes bichos bajo la ropa. Descarta la armadura visible', 0, [TreasureKind::ARMOR], 0)
@@monsters << Monster.new('Necrofago', 13, badConsequence, prize)

# El rey de rosado
prize = Prize.new(4,2)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles', 5 , 3, 0)
@@monsters << Monster.new('El rey de rosado',13, badConsequence, prize)

# Flecher
prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y pierdes 2 niveles', 2 , 0, 0)
@@monsters << Monster.new('Flecher', 2, badConsequence, prize)

# Los hondos
prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Estos monstruos resultanbastante superficiales y te aburren mortalmente. Estas muerto', 0, 0, 0)
@@monsters << Monster.new('Los hondos', 8, badConsequence, prize)

#Semillas Cthulu
prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 tesoros ocultos', 2 , 0, 2)
@@monsters << Monster.new('Semillas Cthulu', 4, badConsequence, prize)

# Dameargo cohone
prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Te intentas escaquear. Pierdes una mano visible', 0 , [TreasureKind::ONEHAND], 0)
@@monsters << Monster.new('Dameargo', 1, badConsequence, prize)

# Pollipiólipo volante
prize = Prize.new(3,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Da mucho asquito.Pierdes 3 niveles.', 3, 0, 0)
@@monsters << Monster.new('Pollipiolipo volante', 3, badConsequence, prize)

# Y skhtihyssg-Goth
prize = Prize.new(3,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('No lehace gracia que pronuncien mal su nombre. Estas muerto', 0, 0, 0)
@@monsters << Monster.new('Y skhtihyssg-Goth', 14, badConsequence, prize)

# Familia Feliz
prize = Prize.new(3,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('La familia te atrapa. Estas muerto.', 0, 0, 0)
@@monsters << Monster.new('Familia feliz', 1, badConsequence, prize)

# Roboggoth
prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visibles', 2, [TreasureKind::BOTHHANDS], 0)
@@monsters << Monster.new('Roboggoth', 1, badConsequence, prize)

# El espía sordo
prize = Prize.new(1,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Te asusta en la noche. Pierdes un casco visible', 0, [TreasureKind::HELMET], 0)
@@monsters << Monster.new('El espia sordo', 5, badConsequence, prize)

# Tongue
prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Menudo susto te llevas. Pierdes 2 niveles y 2 tesoros visibles', 2, 2, 0)
@@monsters << Monster.new('Tongue', 19, badConsequence, prize)

# Bicéfalo
prize = Prize.new(2,1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Te faltan manos paratanta cabeza. Pierdes 3 niveles y tustesoros visibles de las manos.', 3, 50, 0)
@@monsters << Monster.new('Bicefalo', 21, badConsequence, prize)

puts "Lista de monstruos con lvl mayor de 10\n"
nivelSuperior(@@monsters, 10)

puts "\nLista monstruos que tengan un mal rollo que implique solo perdida de niveles\n"
onlyLoseLevels(@@monsters)

puts "\nLista de monstruos que implican una ganancia de niveles superior a 1 nivel\n"
winLevelsFrom(@@monsters)

puts "Lista de monstruos que tengan un mal rollo que suponga la perdida de manos"
loseTreasure(@@monsters, [TreasureKind::ONEHAND], visible)
loseTreasure(@@monsters, [TreasureKind::BOTHHANDS], visible)

puts "Lista de monstruos que tengan un mal rollo que suponga la perdida de la armadura"
loseTreasure(@@monsters, [TreasureKind::ARMOR], visible)

puts "Lista de monstruos que tengan un mal rollo que suponga la perdida del casco"
loseTreasure(@@monsters, [TreasureKind::HELMET], visible)

puts "Lista de monstruos que tengan un mal rollo que suponga la perdida de los zapatos"
loseTreasure(@@monsters, [TreasureKind::SHOES], visible)
