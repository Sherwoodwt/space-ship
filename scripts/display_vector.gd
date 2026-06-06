extends Label

@export var event: String

func _ready() -> void:
	Events.connect(event, _display_vector)

func _display_vector(target: Vector3):
	text = "%f\n%f\n%f" % [target.x, target.y, target.z]
