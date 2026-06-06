extends Label

var stars: Array[Star]
var nearest: Star
var pos: Vector3

var _fetched: bool = false

func _ready() -> void:
	Events.position_changed.connect(_new_position)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("nearest_star"):
		_find_nearest()

func _new_position(position: Vector3):
	if !_fetched:
		var nodes = get_tree().root.find_children("*", "Star", true, false)
		stars.assign(nodes)
		_fetched = true
	pos = position

func _find_nearest():
	nearest = null
	for star in stars:
		if nearest == null or (star.position - pos).length() < (nearest.position - pos).length():
			nearest = star
	Events.to_target.emit(nearest.position)
	text = "%f\n%f\n%f" % [nearest.position.x, nearest.position.y, nearest.position.z]
