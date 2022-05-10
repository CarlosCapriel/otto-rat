extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite
export (int) var Velocidad 
var Movimiento = Vector2()
#var limite
#export var vida_max = 100
#export var vida_actual = 100
#var barraVida
var health : int = 100

func _ready():
	#barraVida = get_tree().get_nodes_in_group("barra")[0]
	#limite = get_viewport_rect().size
	pass

func _process(delta):
	Movimiento = Vector2()#Reinicia el valor
	#actualizar_barra()
	#vida_actual = clamp(vida_actual, 0, vida_max)
	
	if Input.is_action_pressed("ui_right"):#Derecha
		Movimiento.x += 1 
		_animated_sprite.play("correr")
	if Input.is_action_pressed("ui_left"):#Izquierda
		Movimiento.x -= 1 
		_animated_sprite.play("correr")
	if Input.is_action_pressed("ui_down"):#Abajo
		Movimiento.y += 1 
		_animated_sprite.play("correr")
	if Input.is_action_pressed("ui_up"):#Arriba
		Movimiento.y -= 1 
		_animated_sprite.play("correr")
	if Movimiento.length() > 0:#verificar si se esta moviendo
		Movimiento = Movimiento.normalized() * Velocidad #normalizar la velocidad
	
	position += Movimiento * delta #Actualiza los movimientos
	#position.x = clamp(position.x, 0, 1024)
	#position.y = clamp(position.y, 0, 600)
	
	if Movimiento.x != 0:
		$AnimatedSprite.animation = "correr"
		$AnimatedSprite.flip_h = Movimiento.x < 0
		$AnimatedSprite.flip_v = false
	#else:
		#_animated_sprite.stop()
	#if Movimiento.y != 0:
		#$AnimatedSprite.animation = "correr"
		#$AnimatedSprite.flip_v = Movimiento.y > 0

#func actualizar_barra():
	#barraVida.value = vida_actual * barraVida.max_value / vida_max

func damage_player(damage):
	health -= damage

func _on_Vida_area_entered(area):
	if area.is_in_group("enemy"):
		damage_player(area.damage)
	if health <=0:
		get_tree().change_scene("res://Escenas/GameOver.tscn")
