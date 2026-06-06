extends Node3D

var origin: Vector3
var direction: Vector3
var target: Vector3

func _ready() -> void:
	Events.to_target.connect(set_target)
	Events.direction_changed.connect(set_direction)
	Events.position_changed.connect(set_origin)

func _process(delta: float) -> void:
	if !target:
		return
	look_at((target - origin).normalized(), basis.y)
	Events.pointer_direction.emit(-basis.z)

func set_target(new_target: Vector3):
	target = new_target

func set_origin(new_origin: Vector3):
	origin = new_origin

func set_direction(new_direction: Vector3):
	direction = new_direction
