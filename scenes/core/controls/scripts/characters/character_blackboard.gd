class_name CharacterBlackboard extends Resource

@export var speed: float = 300.0
@export var acceleration: float = 100.0
@export var friction: float = 50.0
@export var max_velocity: Vector2 = Vector2(1000.0, 1000.0)
@export var direction: Vector2
@export var aim_direction: Vector2
@export var dash_speed: float = 600.0
@export var run_multiplier: float = 2.0
@export var velocity: Vector2
@export var is_facing_right: bool = true
@export var device_index: int = 0

func serialize():
	var data = {
		"speed": speed,
		"acceleration": acceleration,
		"friction": friction,
		"max_velocity_x": max_velocity.x,
		"max_velocity_y": max_velocity.y,
		"direction_x": direction.x,
		"direction_y": direction.y,
		"aim_direction_x": aim_direction.x,
		"aim_direction_y": aim_direction.y,
		"dash_speed": dash_speed,
		"run_multiplier": run_multiplier,
		"velocity_x": velocity.x,
		"velocity_y": velocity.y,
		"is_facing_right": is_facing_right,
		"device_index": device_index
	}
	return data

func deserialize(data):
	if data.has("speed"):
		speed = data["speed"]
	if data.has("acceleration"):
		acceleration = data["acceleration"]
	if data.has("friction"):
		friction = data["friction"]
	if data.has("max_velocity_x") and data.has("max_velocity_y"):
		max_velocity = Vector2(data["max_velocity_x"], data["max_velocity_y"])
	if data.has("direction_x") and data.has("direction_y"):
		direction = Vector2(data["direction_x"], data["direction_y"])
	if data.has("aim_direction_x") and data.has("aim_direction_y"):
		aim_direction = Vector2(data["aim_direction_x"], data["aim_direction_y"])
	if data.has("dash_speed"):
		dash_speed = data["dash_speed"]
	if data.has("run_multiplier"):
		run_multiplier = data["run_multiplier"]
	if data.has("velocity_x") and data.has("velocity_y"):
		velocity = Vector2(data["velocity_x"], data["velocity_y"])
	if data.has("is_facing_right"):
		is_facing_right = data["is_facing_right"]
	if data.has("device_index"):
		device_index = data["device_index"]
