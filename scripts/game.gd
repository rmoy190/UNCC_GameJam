extends Node2D
class_name Core

var checkpoints: Array[Checkpoint] = []
@onready var player: CharacterBody2D = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for checkpoint in get_children():
		if checkpoint.is_in_group("Checkpoint"):
			checkpoints.append(checkpoint)
			for id in Global.active_checkpoint_ids:
				if id == checkpoint.checkpoint_id:
					checkpoint.light()
	
	if Global.cur_checkpoint_id != -1: # Currently has an active checkpoint
		for checkpoint in checkpoints:
			if checkpoint.checkpoint_id == Global.cur_checkpoint_id:
				print("Do this lol")
				player.position = Vector2(checkpoint.position.x, checkpoint.position.y + -8)
		

func get_checkpoint() -> Vector2:
	var spawn_location: Vector2 = Vector2.ZERO
	
	for checkpoint in checkpoints:
		if checkpoint.checkpoint_id == Global.cur_checkpoint_id:
			spawn_location = checkpoint.position
	
	return spawn_location
