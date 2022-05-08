extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$GameOver.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BotonIniciar_pressed():
	$GameOver.stop()
	get_tree().change_scene("res://Escenas/EscenaNivelUno.tscn")


func _on_BotonMenu_pressed():
	$GameOver.stop()
	get_tree().change_scene("res://Escenas/Menu.tscn")
