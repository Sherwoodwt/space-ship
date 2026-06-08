class_name Ship
extends CharacterBody3D

const MAX_SPEED = 50.0
const MAX_ACCEL = 5.0
const ACCEL_INC = .1
const DECELERATION = .1
const MAX_ROTATION = .03
const ROTATION_ACCEL = .0001
const BOOST = 4.0

var _pulse: Vector3
var _rotation_pulse: Vector3
var _acceleration: Vector3
var _rotation: Vector3
var _boost: bool
var _break: bool

func _physics_process(delta: float) -> void:	
	_rotation = _rotation.move_toward(_rotation_pulse * MAX_ROTATION, ROTATION_ACCEL)
	_flip_exhausts(_rotation_pulse.y, $Exhausts/TurnLeft, $Exhausts/TurnRight)
	_flip_exhausts(_rotation_pulse.z, $Exhausts/RollLeft, $Exhausts/RollRight)
	_flip_exhausts(_rotation_pulse.x, $Exhausts/TurnUp, $Exhausts/TurnDown)
	
	var directional_pulse = global_transform.basis * _pulse
	if _break:
		directional_pulse = -velocity.normalized()
	
	_acceleration = _acceleration.move_toward(directional_pulse * MAX_ACCEL, ACCEL_INC)
	if _pulse.z < 0:
		$Exhausts/Forward.visible = true
	else:
		$Exhausts/Forward.visible = false
	_flip_exhausts(-_pulse.x, $Exhausts/MoveLeft, $Exhausts/MoveRight)
	var target = directional_pulse * MAX_SPEED
	var accel = DECELERATION
	if directional_pulse.length():
			accel = _acceleration.length()
	if _boost || velocity.length() > MAX_SPEED:
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
