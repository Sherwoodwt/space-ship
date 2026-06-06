extends Camera3D


@export var rotation_speed:float = .002

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("move_camera"):
		if event is InputEventMouseMotion:
			get_parent_node_3d().rotate_y(event.relative.x * rotation_speed)
			get_parent_node_3d().rotate_x(event.relative.y * -rotation_speed)
	if Input.is_action_pressed("reset_camera"):
		get_parent_node_3d().rotation = Vector3.ZERO
