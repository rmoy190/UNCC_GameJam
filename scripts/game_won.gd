extends Control

@onready var rich_text_label_2: RichTextLabel = $RichTextLabel2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rich_text_label_2.text = "And you only died %d times!" % Global.death_count

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_play_button_pressed() -> void:
	# Reset game
	Global.cur_checkpoint_id = -1
	Global.active_checkpoint_ids.clear()
	Global.death_count = 0
	get_tree().change_scene_to_file("res://scenes/game.tscn")
