extends Camera3D


@export var pan_sensitivity: float = 0.2


func _process(delta: float) -> void:
	if Input.is_action_pressed("pan_left"):
		rotate_y(pan_sensitivity)
	elif Input.is_action_pressed("pan_right"):
		rotate_y(-pan_sensitivity)
