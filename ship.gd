extends CharacterBody3D

const MAX_SPEED = 500.0
const MAX_ACCEL = 5.0
const ACCEL_INC = .5
const DECELERATION = .1


@export var rotate_speed = 0.01

var _acceleration: Vector3

func _physics_process(delta: float) -> void:
	var pulse: Vector3
	var basis = global_transform.basis
	if Input.is_action_pressed("forward"):
		pulse -= basis.z
	if Input.is_action_pressed("backward"):
		pulse += basis.z
	if Input.is_action_pressed("left"):
		pulse -= basis.x
	if Input.is_action_pressed("right"):
		pulse += basis.x
	
	if Input.is_action_pressed("break"):
		pulse = -velocity.normalized()
		
	if Input.is_action_pressed("rotate_up"):
		rotate(basis.x, rotate_speed)
	if Input.is_action_pressed("rotate_down"):
		rotate(basis.x, -rotate_speed)
	if Input.is_action_pressed("rotate_left"):
		rotate(basis.y, rotate_speed)
	if Input.is_action_pressed("rotate_right"):
		rotate(basis.y, -rotate_speed)
	if Input.is_action_pressed("roll_left"):
		rotate(basis.z, rotate_speed)
	if Input.is_action_pressed("roll_right"):
		rotate(basis.z, -rotate_speed)
	
	_acceleration = _acceleration.move_toward(pulse * MAX_ACCEL, ACCEL_INC)
	velocity = velocity.move_toward(pulse * MAX_SPEED, _acceleration.length() if pulse.length() else DECELERATION)
	Events.accel_changed.emit(_acceleration.length())
	Events.speed_changed.emit(velocity.length())
	move_and_slide()
