extends Control

func _ready():
	$IntroTheme.play()

func _on_BotonInicio_pressed():
	$IntroTheme.stop()
	get_tree().change_scene("res://Escenas/EscenaNivelUno.tscn")

func _on_BotonSalir_pressed():
	get_tree().quit()
