extends Area2D

var is_active = false

func _on_body_entered(body: Node2D) -> void:
	if is_active == false:
		is_active = true
	
