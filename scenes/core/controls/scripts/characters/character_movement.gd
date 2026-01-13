class_name CharacterMovement extends CharacterBaseNode

@export var dash_time: float = 0.05

var dash_time_elapsed: float = 0
var is_dashing = false

func _unhandled_input(_event: InputEvent) -> void:
	if not is_dashing and parent.controls.is_action_just_pressed(parent.controls.dash):
		dash()
		return
	if not is_dashing and parent.controls.is_action_just_pressed(parent.controls.double_tap):
		dash()

func _physics_process(delta: float) -> void:
	if not is_dashing:
		var speed_multiplier: float = 1.0
		if parent.controls.is_running():
			speed_multiplier = parent.blackboard.run_multiplier
		parent.blackboard.direction = parent.controls.get_movement_direction()
		parent.blackboard.aim_direction = parent.controls.get_aim_direction()
		parent.blackboard.velocity = parent.calc_new_velocity(
			parent.velocity, 
			parent.blackboard.direction,
			parent.blackboard.speed * speed_multiplier, 
			parent.blackboard.acceleration, 
			parent.blackboard.friction,
			parent.blackboard.max_velocity
		)
	else:
		dash_time_elapsed -= delta
		if dash_time_elapsed <= 0:
			stop()
			is_dashing = false
	parent.velocity = parent.blackboard.velocity
	if parent.move_and_slide():
		parent.handle_collisions()
	
			
func stop():
	parent.velocity = Vector2.ZERO

func dash():
	is_dashing = true
	var direction = Vector2.ZERO
	if parent.controls.double_tap_direction != parent.controls.DOUBLE_TAP_DIRECTION.NONE:
		direction = parent.controls.get_double_tap_direction()
		parent.controls.double_tap_direction = parent.controls.DOUBLE_TAP_DIRECTION.NONE
	else:
		direction = parent.controls.get_aim_direction()
	parent.blackboard.velocity += direction * parent.blackboard.dash_speed
	return direction
