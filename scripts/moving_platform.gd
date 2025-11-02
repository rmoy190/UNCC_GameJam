extends AnimatableBody2D

var moved = false
@export var move_amount: Vector2 = Vector2(16, 0)
@onready var triggerzone: Area2D = $triggerzone

func _ready() -> void:
	triggerzone.activated.connect(move_platform)

func move_platform():
	# Safely move only if platform is assigned
	if not moved  :
		self.position += move_amount
		moved = true 
