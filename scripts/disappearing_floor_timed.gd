extends StaticBody2D

@onready var triggerzone: Area2D = $triggerzone
@onready var respawn_timer: Timer = $"respawn timer"
@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D



var disappeared = false

func _ready() -> void:
	triggerzone.activated.connect(disappear)
	respawn_timer.timeout.connect(reappear)

func disappear():
	if not disappeared:
		disappeared = true
		collision_shape_2d.set_deferred("disabled", true)
		visible = false
		respawn_timer.start(1.0) 

func reappear():
	disappeared = false
	collision_shape_2d.set_deferred("disabled", false)
	visible = true
