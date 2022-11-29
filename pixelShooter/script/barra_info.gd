extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	$ProgressBar.value = Salud.salud
	
	if Salud.salud ==0:
	  get_tree().reload_current_scene()
