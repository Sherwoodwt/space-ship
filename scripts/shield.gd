class_name Shield
extends Node

@export var fields: Array[Field]

func get_y(x: float, delta: float):
	var total: float
	for i in range(0, fields.size()):
		var f = fields[i]
		total += f.get_y(x, delta)
	return total
