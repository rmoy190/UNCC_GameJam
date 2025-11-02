extends Node2D
class_name Checkpoint

@onready var checkpointzone: Area2D = %checkpointzone
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var checkpoint_id: int = -1

func _ready() -> void:
	checkpointzone.activated.connect(activated_zone)

func activated_zone() -> void:
	if not Global.active_checkpoint_ids.has(checkpoint_id):
		Global.cur_checkpoint_id = checkpoint_id
		Global.active_checkpoint_ids.append(checkpoint_id)
		light()
		print("Activated Checkpoint ", checkpoint_id)

func light() -> void:
	animated_sprite_2d.play("active")
