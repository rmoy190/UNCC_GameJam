extends Node2D
class_name FakeCampfire

@onready var triggerzone: Area2D = %triggerzone
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var rich_text_label: RichTextLabel = $RichTextLabel

var disabled: bool

func _ready() -> void:
	triggerzone.activated.connect(activated_zone)
	if Global.activated_fake_campfire:
		rich_text_label.text = "haha you fell for it"
		animated_sprite_2d.play("active")
	else:
		rich_text_label.text = "Checkpoint\n(Trust)"
		animated_sprite_2d.play("inactive")

func activated_zone() -> void:
	if not disabled:
		Global.player.die()
		light()
		Global.activated_fake_campfire = true

func light() -> void:
	rich_text_label.text = "haha you fell for it"
	animated_sprite_2d.play("active")
