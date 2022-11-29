extends KinematicBody2D

onready var jugador = get_node('/root/juego/jugador')
onready var pre_bala = preload("res://assets/bala.tscn")


func _physics_process(delta):
	look_at(jugador.position)
	if $RayCast2D.is_colliding():
		var col =$RayCast2D.get_collider()
		if col.is_in_group("jugador"):
			disparar()
	
func disparar():
	var bala = pre_bala.instance()
	get_parent().add_child( bala)
	bala.get_node('bala/Area2D').add_to_group('bala_enemiga')
	bala.position = self.position
	bala.rotate( self.rotation)

func _on_Area2D_area_entered(area):
	if area.is_in_group('bala_jugador'):
		queue_free()
