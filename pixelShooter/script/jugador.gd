extends KinematicBody2D

var movimiento = Vector2( 0 ,0)
var velocidad = 200
onready var pre_bala = preload("res://assets/bala.tscn")

func _physics_process(delta):
	if Input.is_action_pressed('izquierda'):
		movimiento.x = -velocidad
	elif Input.is_action_pressed('derecha'):
		movimiento.x = velocidad
	else:
		movimiento.x = lerp(movimiento.x,0,0.1)
		
	if Input.is_action_pressed('arriba'):
		movimiento.y = -velocidad
	elif Input.is_action_pressed('abajo'):
		movimiento.y = velocidad
	else:
		movimiento.y = lerp(movimiento.x,0,0.1)
		
	look_at(get_global_mouse_position())
	movimiento = move_and_slide(movimiento)
	
	if Input.is_action_just_released("disparar"):
		var bala = pre_bala.instance()
		get_parent().add_child( bala)
		bala.get_node('bala/Area2D').add_to_group('bala_jugador')
		bala.position = self.position
		bala.rotate( self.rotation)
	


func _on_Area2D_area_entered(area):
	if area.is_in_group('bala_enemiga'):
		Salud.salud -= 20
