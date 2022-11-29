extends KinematicBody2D


onready var pre_enemigo = preload("res://escenas/enemigo.tscn")

func _physics_process(delta):
	if $RayCast2D.is_colliding():
		var col =$RayCast2D.get_collider()
		if col.is_in_group('jugador'):
			var enemigo = pre_enemigo.instance()
			get_parent().add_child(enemigo)
			enemigo.position =self.position
			queue_free()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
