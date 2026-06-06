extends Camera3D

func _ready() -> void:
	Events.direction_changed.connect(face_direction)

func face_direction(direction: Vector3):
	get_parent_node_3d().look_at(direction, get_parent_node_3d().basis.y)
