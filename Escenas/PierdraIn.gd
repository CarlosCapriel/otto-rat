extends Area2D

export (int) var damage = 20

func _ready():
	randomize()
	generateRandomOperation(8)
	
func generateRandomOperation(dificulty):
	var total = 0
	total = generateRandomNumber(dificulty)
	$lblIncorrecto.text = str(total)

func generateRandomNumber(dificulty):
	var number = (randi() % dificulty) + (1 + dificulty)
	return number 
