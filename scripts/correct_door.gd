extends Sprite2D

@onready var interaction_area: Area2D = $InteractionArea
@onready var rich_text_label: RichTextLabel = $RichTextLabel

var ready_for_input: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.in_area.connect(in_area)
	rich_text_label.visible = false

func _physics_process(delta: float) -> void:
	if ready_for_input == false:
		return
	
	if Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/game_won.tscn")

func in_area(value: bool) -> void:
	ready_for_input = value
	rich_text_label.visible = value
	
