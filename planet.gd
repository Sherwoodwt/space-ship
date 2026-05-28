class_name Planet
extends RigidBody3D

@export var color: Color
@export var radius: float

static func init(color: Color, radius: float) -> Planet:
	var planet: Planet
	planet.color = color
	planet.radius = radius
	return planet

func _ready():
	$MeshInstance3D.get_active_material(0).albedo_color = color
	scale = scale * radius
