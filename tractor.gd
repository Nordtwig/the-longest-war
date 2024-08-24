extends Node3D

@export_group("Moving")
@export var _turn_rate: float = 0.007

@export_group("Looking")
@export var _look_sensitivity: float = 0.005

var _camera_look_input: Vector2

@onready var player_camera: Node3D = get_node("PlayerCamera")
@onready var camera: Camera3D = get_node("PlayerCamera/Camera3D")


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _process(delta: float) -> void:
	if Input.is_action_pressed("turn_left"):
		rotate_y(_turn_rate)
	elif Input.is_action_pressed("turn_right"):
		rotate_y(-_turn_rate)
	
	if Input.is_action_pressed("move_forward"):
		position.z -= 0.1
	elif Input.is_action_pressed("move_backward"):
		position.z += 0.1

	# looking
	player_camera.rotate_y(-_camera_look_input.x * _look_sensitivity)
	camera.rotate_x(-_camera_look_input.y * _look_sensitivity)
	camera.rotation.x = clamp(camera.rotation.x, -1.5, 1.5)
	_camera_look_input = Vector2.ZERO

	# mouse
	if Input.is_action_just_pressed("ui_menu"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		_camera_look_input = event.relative