extends CanvasLayer

export (NodePath) var player_node
onready var player = get_node(player_node)

func _process(_delta):
	$TextureProgress.value = player.health
	
	if($TextureProgress.value == 0):
		#aqui se pone lo que pasa cuando l a barra de vida lelga a 0
		get_tree().change_scene("res://Escenas/Menu.tscn")
		print("GAME OVER")
