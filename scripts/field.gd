class_name Field
extends Resource

@export var amplitude: float
@export var period: float
@export var phase: float

func _ready() -> void:
	Events.field_changed.emit(self)

func get_y(x: float, delta: float) -> float:
	return amplitude * sin(deg_to_rad((x / period - phase * delta)))
