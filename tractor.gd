extends Node3D


func _process(delta: float) -> void:
	if Input.is_action_pressed("turn_left"):
		rotate_y(0.1)
		%FrontCamera.transform = $ViewportPositioningMarker.global_transform