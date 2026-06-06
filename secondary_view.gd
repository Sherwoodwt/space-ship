extends Camera3D

var _cameras: Array[Camera3D]
var _cur: int

func _ready() -> void:
	_cameras.assign(get_tree().get_nodes_in_group("pilot_camera"))
	Events.camera_changed.connect(reset_camera)
	reset_camera()
	reset_position()

func _process(delta: float) -> void:
	reset_position()

func reset_position():
	global_transform = _cameras[_cur].global_transform

func reset_camera():
	var main = get_tree().root.get_camera_3d()
	if main == _cameras[_cur]:
		_cur = (_cur + 1) % _cameras.size()
