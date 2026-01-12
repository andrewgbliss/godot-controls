extends Node2D

@export var player_one: CharacterController
@export var player_two: CharacterController

@export var player_one_move_label: Label
@export var player_two_move_label: Label
@export var player_one_aim_label: Label
@export var player_two_aim_label: Label

func _process(_delta: float) -> void:
	player_one_move_label.text = "Movement: x = " + str(snappedf(player_one.blackboard.direction.x, 0.01)) + " y = " + str(snappedf(player_one.blackboard.direction.y, 0.01))
	player_two_move_label.text = "Movement: x = " + str(snappedf(player_two.blackboard.direction.x, 0.01)) + " y = " + str(snappedf(player_two.blackboard.direction.y, 0.01))
	player_one_aim_label.text = "Aim: x = " + str(snappedf(player_one.blackboard.aim_direction.x, 0.01)) + " y = " + str(snappedf(player_one.blackboard.aim_direction.y, 0.01))
	player_two_aim_label.text = "Aim: x = " + str(snappedf(player_two.blackboard.aim_direction.x, 0.01)) + " y = " + str(snappedf(player_two.blackboard.aim_direction.y, 0.01))
