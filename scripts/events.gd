extends Node

signal direction_changed(direction: Vector3)
signal position_changed(position: Vector3)
signal velocity_changed(velocity: Vector3)
signal accel_changed(accel: Vector3)

signal find_nearest_star(position: Vector3)
signal to_target(target: Vector3)
signal pointer_direction(dir: Vector3)
signal camera_changed()

signal field_changed(field: Field)
