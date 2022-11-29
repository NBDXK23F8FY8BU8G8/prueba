extends Node2D

var sensor_izquierda = false

func _physics_process(delta):
	if Input.is_action_just_released("abrir_puerta") && sensor_izquierda == true:
		$ColorRect/AnimationPlayer.play(("abrir_izquierda"))



func _on_izquierda_area_entered(area):
	if area.is_in_group('jugador'):
		sensor_izquierda =true


func _on_izquierda_area_exited(area):
	if area.is_in_group('jugador'):
		sensor_izquierda =false
