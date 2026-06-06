class_name Planet
extends RigidBody3D

@export var color: Color
@export var radius: float

@onready var mesh = $MeshInstance3D

func _ready():
	var material = StandardMaterial3D.new()
	material.albedo_color = color
	mesh.set_surface_override_material(0, material)
	scale = scale * radius
