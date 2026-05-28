extends Node3D

@export var min_planet_size: int = 1
@export var max_planet_size: int = 500
@export var size: float = 10000
@export var num_planets: int

const planet_scene = preload("res://planet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(0, num_planets):
		var x = randi_range(-size, size)
		var y = randi_range(-size, size)
		var z = randi_range(-size, size)
		var planet = planet_scene.instantiate() as Planet
		planet.color = Color(randf(), randf(), randf())
		planet.radius = randi_range(min_planet_size, max_planet_size)
		
		add_child(planet)
		planet.position = Vector3(x, y, z)
