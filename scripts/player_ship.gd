extends Ship

func _physics_process(delta: float) -> void:
	_boost = Input.is_action_pressed("boost")
	_break = Input.is_action_pressed("break")
	
	_pulse = Vector3.ZERO
	if Input.is_action_pressed("forward"):
		_pulse.z -= 1
	if Input.is_action_pressed("backward"):
		_pulse.z += 1
	if Input.is_action_pressed("left"):
		_pulse.x -= 1
	if Input.is_action_pressed("right"):
		_pulse.x += 1
	
	_rotation_pulse = Vector3.ZERO
	if Input.is_action_pressed("rotate_up"):
		_rotation_pulse.x = 1
	if Input.is_action_pressed("rotate_down"):
		_rotation_pulse.x = -1
	if Input.is_action_pressed("rotate_left"):
		_rotation_pulse.y = 1
	if Input.is_action_pressed("rotate_right"):
		_rotation_pulse.y = -1
	if Input.is_action_pressed("roll_left"):
		_rotation_pulse.z = 1
	if Input.is_action_pressed("roll_right"):
		_rotation_pulse.z = -1
	
	super._physics_process(delta)
