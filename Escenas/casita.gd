extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered",self, "cambiarnivel")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func cambiarnivel(object):
	get_tree().change_scene("res://Escenas/EscenaNivelDos.tscn")
