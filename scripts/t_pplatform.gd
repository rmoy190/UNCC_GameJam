extends Area2D

var moved = false
@export var move_amount: Vector2 = Vector2(16, 0)
@onready var platformtp: AnimatableBody2D = $".."

func _ready() -> void:
	if platformtp == null:
		push_error("Platform is not assigned in the Inspector!")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		move_platform()

func move_platform():
	# Safely move only if platform is assigned
	if platformtp and not moved  :
		self.position += move_amount
		moved = true
		
