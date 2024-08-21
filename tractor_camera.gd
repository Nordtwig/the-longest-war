extends SubViewport


@export var positioning_marker: Marker3D
@export var child_to_position: Node3D


func _process(delta: float) -> void:
	child_to_position.transform = positioning_marker.global_transform
