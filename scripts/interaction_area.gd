extends Area2D

signal in_area(bool)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		in_area.emit(true)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		in_area.emit(false)
