class_name Sector
extends Node3D

@onready var star_prefab = preload("res://star.tscn")

@export var num_stars: int = 8
@export var size: float = 10000

func _ready() -> void:
	for i in range(0, num_stars):
		var x = randi_range(-size/2.0,size/2.0)
		var y = randi_range(-size/2.0,size/2.0)
		var z = randi_range(-size/2.0,size/2.0)
		var star = star_prefab.instantiate() as Star
		star.position = Vector3(x, y, z)
		add_child(star)
