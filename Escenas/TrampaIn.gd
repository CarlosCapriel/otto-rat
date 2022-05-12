extends Area2D


export (int) var damage = 20

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	generateRandomOperation(10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func generateRandomOperation(dificulty):
	var total : float
	total = 0.0
	total = generateRandomNumber(dificulty)
	$LIncorrecto.text = str(total)

func generateRandomNumber(dificulty):
	var number = (randi() % dificulty) + (1 + dificulty)
	return number 


func _on_TrampaIn_body_entered(body):
	queue_free()
