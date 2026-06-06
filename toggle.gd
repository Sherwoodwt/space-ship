extends CanvasLayer

@export var event: String
@export var start_flipped: bool

func _ready() -> void:
	Events.connect(event, toggle)
	visible = !start_flipped

func toggle():
	visible = !visible
