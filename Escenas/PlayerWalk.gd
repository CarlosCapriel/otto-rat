extends Area2D

onready var _animated_sprite = $AnimatedSprite

export (int) var Velocidad 
var Movimiento = Vector2()
#var limite

# Called when the node enters the scene tree for the first time.
func _ready():
	#limite = get_viewport_rect().size
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Movimiento = Vector2()#Reinicia el valor
	
	if Input.is_action_pressed("ui_right"):#Derecha
		Movimiento.x += 1 
		_animated_sprite.play("correr")
	if Input.is_action_pressed("ui_left"):#Izquierda
		Movimiento.x -= 1 
		_animated_sprite.play("correr")
	if Input.is_action_pressed("ui_down"):#Abajo
		Movimiento.y += 1 
		_animated_sprite.play("salto")
	if Input.is_action_pressed("ui_up"):#Arriba
		Movimiento.y -= 1 
		_animated_sprite.play("salto")
	if Movimiento.length() > 0:#verificar si se esta moviendo
		Movimiento = Movimiento.normalized() * Velocidad #normalizar la velocidad
	position += Movimiento * delta #Actualiza los movimientos
	#position.x = clamp(position.x, 0, limite.x)
	#position.y = clamp(position.y, 0, limite.y)
	
	if Movimiento.x != 0:
		$AnimatedSprite.animation = "correr"
		$AnimatedSprite.flip_h = Movimiento.x < 0
		$AnimatedSprite.flip_v = false
	else:
		_animated_sprite.stop()
	#elif Movimiento.y != 0:
		#$AnimatedSprite.animation = "correr"
		#$AnimatedSprite.flip_v = Movimiento.y > 0
