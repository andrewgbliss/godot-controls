class_name CharacterController extends CharacterBody2D

@export var blackboard: CharacterBlackboard
@export var controls: CharacterControls

func handle_collisions():
	for i in get_slide_collision_count():
		var col = get_slide_collision(i)
		var collider = col.get_collider()
		if collider is RigidBody2D:
			collider.apply_central_impulse(col.get_normal() * -blackboard.push_force)

func calc_new_velocity(v: Vector2, d: Vector2, s: float, a: float, f: float, c: Vector2):
	if d != Vector2.ZERO:
		v = v.move_toward(d * s, a)
	else:
		v = v.move_toward(Vector2.ZERO, f)
	v = v.clamp(-c, c)
	return v
