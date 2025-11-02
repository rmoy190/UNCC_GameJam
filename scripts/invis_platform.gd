extends StaticBody2D

@onready var triggerzone: Area2D = $triggerzone
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	triggerzone.activated.connect(appear)
	sprite_2d.visible = false

func appear() -> void:
	AudioManager.play("res://RealAssets-ForGamersOnly/8bit-SFX-Library/Win/win-4.wav")
	sprite_2d.visible = true
