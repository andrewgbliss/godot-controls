class_name CharacterTriggers extends CharacterBaseNode

@export var trigger_left_projectile: PackedScene
@export var trigger_right_projectile: PackedScene
@export var bumper_left_projectile: PackedScene
@export var bumper_right_projectile: PackedScene

func _process(_delta: float) -> void:
	if parent.controls.is_action_pressed(parent.controls.trigger_left):
		spawn_projectile(trigger_left_projectile)
	if parent.controls.is_action_pressed(parent.controls.trigger_right):
		spawn_projectile(trigger_right_projectile)
	if parent.controls.is_action_pressed(parent.controls.bumper_left):
		spawn_projectile(bumper_left_projectile)
	if parent.controls.is_action_pressed(parent.controls.bumper_right):
		spawn_projectile(bumper_right_projectile)

func spawn_projectile(p: PackedScene):
	var entity = p.instantiate()
	entity.position = Vector2.ZERO
	add_child(entity)
	if entity is Projectile:
		var spawn_position = parent.global_position + parent.controls.get_aim_direction() * 16
		entity.start(spawn_position, parent.controls.get_aim_direction())
	return entity
