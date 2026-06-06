class_name Star
extends RigidBody3D

const MAX_AGE = 1000
const MASS_MIN = .8
const MASS_MAX = 200
const MIN_SIZE = 100
const MAX_SIZE = 600

@export var young_color: Color
@export var old_color: Color
@export var age: int
@export var solar_mass: float

@onready var mesh:MeshInstance3D = $MeshInstance3D

func _ready() -> void:
	age = randi_range(1, MAX_AGE)
	solar_mass = randi_range(MASS_MIN, MASS_MAX)
	var age_percent: float = float(age) / MAX_AGE
	var color = young_color.lerp(old_color, age_percent)
	var material = mesh.get_active_material(0).duplicate()
	material.albedo_color = color
	mesh.set_surface_override_material(0, material)
	var radius: float = lerp(MAX_SIZE, MIN_SIZE, age_percent)
	scale = scale * radius
