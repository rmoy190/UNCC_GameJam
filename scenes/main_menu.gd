extends Control
class_name MainMenu

@onready var kawaii_31: AnimatedSprite2D = $Kawaii31

func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_play_button_pressed() -> void:
	# Reset game
	Global.cur_checkpoint_id = -1
	Global.active_checkpoint_ids.clear()
	Global.death_count = 0
	Global.activated_fake_campfire = false
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_button_pressed() -> void:
	kawaii_31.play("Flip")
