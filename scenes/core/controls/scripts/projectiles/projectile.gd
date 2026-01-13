class_name Projectile extends StaticBody2D

@export var speed = 300
@export var time_to_live: float = 5.0

var velocity = Vector2.ZERO
var time_elapsed = 0

func _ready():
	time_elapsed = time_to_live

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:	
		call_deferred("queue_free")
			
	time_elapsed -= delta
	if time_elapsed <= 0:
		call_deferred("queue_free")

func start(p, dir):
	position = p
	rotation = dir.angle()
	velocity = dir.normalized() * speed
