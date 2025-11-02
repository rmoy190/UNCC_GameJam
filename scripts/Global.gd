extends Node

@export var cur_checkpoint_id: int = -1
@export var active_checkpoint_ids: Array[int]

@export var death_count: int = 0
@export var activated_fake_campfire: bool = false

@export var player: Player = null
