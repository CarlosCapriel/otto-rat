extends Node2D

func _ready():
	$MusicLevel.play()
	randomize()
	generateRandomOperation(4)

func generateRandomOperation(dificulty):
	var number1 = 0
	var number2 = 0
	var operator = ""
	var total = 0

	number1 = generateRandomNumber(dificulty)
	number2 = generateRandomNumber(dificulty)
	operator = generateRandomOperator(dificulty)

	$lblOperacion.text = str(number1) + " " + operator + " " + str(number2) + " ="
	match operator:
		"+":
			total = number1 + number2
		"-":
			total = number1 - number2
		"*":
			total = number1 * number2
		"/":
			total = number1 / number2

	$lblResultado.text = str(total)

func generateRandomNumber(dificulty):
	var number = (randi() % dificulty) + (1 + dificulty)
	return number 

func generateRandomOperator(dificulty):
	var operators = ["+","-","*","/"]
	match dificulty:
		4:
			return operators[randi() % 2]
		7:
			return operators[randi() % 3]
		10:
			return operators[randi() % 4]
