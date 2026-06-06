extends Node3D

@export var is_first_person: bool

@onready var first_person: Camera3D = $"1stPerson"
@onready var third_person: Camera3D = $"3rdPerson"

func _ready() -> void:
	_reset()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("toggle_camera"):
		is_first_person = !is_first_person
		_reset()
		Events.camera_changed.emit()

func _reset():
	if is_first_person:
		first_person.make_current()
	else:
		third_person.make_current()
