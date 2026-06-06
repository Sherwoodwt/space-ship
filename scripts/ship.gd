extends CharacterBody3D

const MAX_SPEED = 500.0
const MAX_ACCEL = 5.0
const ACCEL_INC = .5
const DECELERATION = .1
const MAX_ROTATION = .03
const ROTATION_ACCEL = .0001
const BOOST = 4.0

var _acceleration: Vector3
var _rotation: Vector3

func _physics_process(delta: float) -> void:
	var pulse = Vector3.ZERO
	var boost = Input.is_action_pressed("boost") || velocity.length() > MAX_SPEED
	
	if Input.is_action_pressed("forward"):
		pulse.z -= 1
	if Input.is_action_pressed("backward"):
		pulse.z += 1
	if Input.is_action_pressed("left"):
		pulse.x -= 1
	if Input.is_action_pressed("right"):
		pulse.x += 1
	
	var rotation_pulse = Vector3.ZERO
	if Input.is_action_pressed("rotate_up"):
		rotation_pulse.x = 1
	if Input.is_action_pressed("rotate_down"):
		rotation_pulse.x = -1
	if Input.is_action_pressed("rotate_left"):
		rotation_pulse.y = 1
	if Input.is_action_pressed("rotate_right"):
		rotation_pulse.y = -1
	if Input.is_action_pressed("roll_left"):
		rotation_pulse.z = 1
	if Input.is_action_pressed("roll_right"):
		rotation_pulse.z = -1
	
	_rotation = _rotation.move_toward(rotation_pulse * MAX_ROTATION, ROTATION_ACCEL)
	_flip_exhausts(rotation_pulse.y, $Exhausts/TurnLeft, $Exhausts/TurnRight)
	_flip_exhausts(rotation_pulse.z, $Exhausts/RollLeft, $Exhausts/RollRight)
	_flip_exhausts(rotation_pulse.x, $Exhausts/TurnUp, $Exhausts/TurnDown)
	
	var directional_pulse = global_transform.basis * pulse
	if Input.is_action_pressed("break"):
		directional_pulse = -velocity.normalized()
	
	_acceleration = _acceleration.move_toward(directional_pulse * MAX_ACCEL, ACCEL_INC)
	if pulse.z < 0:
		$Exhausts/Forward.visible = true
	else:
		$Exhausts/Forward.visible = false
	_flip_exhausts(-pulse.x, $Exhausts/MoveLeft, $Exhausts/MoveRight)
	var target = directional_pulse * MAX_SPEED
	var accel = DECELERATION
	if directional_pulse.length():
			accel = _acceleration.length()
	if boost:
		target = target * BOOST
		accel = accel * BOOST
	velocity = velocity.move_toward(target, accel)
	Events.accel_changed.emit(_acceleration)
	Events.velocity_changed.emit(velocity)
	
	if (_rotation.x):
		rotate(basis.x, _rotation.x)
	if (_rotation.y):
		rotate(basis.y, _rotation.y)
	if (_rotation.z):
		rotate(basis.z, _rotation.z)
	move_and_slide()
	Events.position_changed.emit(position)
	Events.direction_changed.emit(-basis.z)

func _flip_exhausts(value: float, left: Node3D, right: Node3D):
	if value > 0:
		left.visible = true
		right.visible = false
	if value < 0:
		left.visible = false
		right.visible = true
	if value == 0:
		left.visible = false
		right.visible = false
