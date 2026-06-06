extends Node3D

@export var min_size: int
@export var max_size: int
@export var size: float = 10000
@export var num_planets: int

const star_scene = preload("res://scenes/star.tscn")

func _ready() -> void:
	for i in range(0, num_planets):
		var x = randi_range(-size, size)
		var y = randi_range(-size, size)
		var z = randi_range(-size, size)
		var star = star_scene.instantiate() as Star
		add_child(star)
		star.position = Vector3(x, y, z)
