extends StaticBody2D

@onready var triggerzone: Area2D = $triggerzone
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	triggerzone.activated.connect(appear)
	sprite_2d.visible = false

func appear() -> void:
	sprite_2d.visible = true
