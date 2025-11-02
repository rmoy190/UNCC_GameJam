extends CharacterBody2D
class_name Player

const SPEED = 80.0
const JUMP_VELOCITY = -280.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_timer: Timer = $CoyoteTimer
var coyote_time_activated: bool = false

var death: bool = false

func _physics_process(delta: float) -> void:
	if death: 
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	# Get the input direction: -1, 0 ,1
	var direction := Input.get_axis("move_left", "move_right")
	
	#Flip Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
		if coyote_time_activated:
			coyote_time_activated = false
			coyote_timer.stop()
	else:
		animated_sprite.play("Jump")
		if !coyote_time_activated:
			coyote_timer.start()
			coyote_time_activated = true
			
	if Input.is_action_just_pressed("jump") and ( !coyote_timer.is_stopped() or is_on_floor() ):
		velocity.y = JUMP_VELOCITY
		coyote_timer.stop()
		coyote_time_activated = true

	#Applies movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func die() -> void:
	death = true
	Global.death_count += 1
	animated_sprite.play("FuckingExplodes")

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "FuckingExplodes":
		get_tree().reload_current_scene()
