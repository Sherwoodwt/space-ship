extends Label

@export var event_name: String

func _ready():
	Events.connect(event_name, _update_value)

func _update_value(speed: float):
	text = "%d" % int(speed)
