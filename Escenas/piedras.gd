extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	generateRandomOperation(4)
	connect("area_entered",self, "desaparecer")# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
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
func desaparecer(object):
	queue_free()