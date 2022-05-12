extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	generateRandomOperation(4)
	connect("area_entered",self, "desaparecer")
	#connect("area_entered",self, "desaparecer")#
func generateRandomOperation(dificulty):
	var number1 : float
	number1 = 0.0
	
	var number2 : float
	number2 = 0.0
	
	var operator = ""
	var total  : float
	total = 0.0 
	
	
	number1 = generateRandomNumber(dificulty)
	number2 = generateRandomNumber(dificulty)
	
	operator = generateRandomOperator(dificulty)

	$Operacion.text = str(number1) + " " + operator + " " + str(number2) +  " ="
	match operator:
		"/":
			total = number1 / number2
		
	
	$Resultado.text = str(total)

func generateRandomNumber(dificulty):
	var number = (randi() % dificulty) + (2 + dificulty)
	return number 

func generateRandomOperator(dificulty):
	var operators = ["/"]
	match dificulty:

		4:
			return operators[randi() % 1]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_TrampaDivi_body_entered(body):
	queue_free()
