extends Line2D

@export var resolution: int = 300

var counter: int
var shield: Shield

func _ready() -> void:
	shield = get_tree().get_nodes_in_group("player_shield").front() as Shield

func _process(delta: float) -> void:
	clear_points()
	counter = (counter + 1) % 360
	for x in range(0, resolution):
		var y = shield.get_y(x, counter)
		add_point(Vector2(x, y))
