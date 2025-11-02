extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D
@onready var triggerzone: Area2D = $triggerzone

var disappeared = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	triggerzone.activated.connect(disappear)


func disappear():
	if not disappeared:
		collision_shape_2d.set_deferred("disabled", true)
		visible = false  # this is safe to do immediately
		AudioManager.play("res://RealAssets-ForGamersOnly/8bit-SFX-Library/Player/landing.wav")
		disappeared = true
