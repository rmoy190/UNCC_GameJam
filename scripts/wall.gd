extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D
@onready var triggerzone: Area2D = $triggerzone

var appeared = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	triggerzone.activated.connect(appear)
	collision_shape_2d.set_deferred("disabled", true)
	visible = false

func appear():
	if not appeared:
		collision_shape_2d.set_deferred("disabled", false)
		AudioManager.play("res://RealAssets-ForGamersOnly/8bit-SFX-Library/Collide/bonk-6.wav")
		visible = true  
		appeared = true
