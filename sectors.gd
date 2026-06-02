extends Node3D

@export var sector_size: int = 10000
@export var star_min: int = 1
@export var star_max: int = 20

func _ready() -> void:
	for x in range(-1, 2):
		for y in range(-1, 2):
			for z in range(-1, 2):
				#var sector = sector_prefab.instantiate() as Sector
				#sector.position = Vector3(
					#sector_size * x,
					#sector_size * y,
					#sector_size * z,
				#)
				#sector.scale = sector.scale * sector_size
				#sector.num_stars = randi_range(star_min, star_max)
				#add_child(sector)
