extends CharacterBody2D
class_name Player

const SPEED = 80.0
const JUMP_VELOCITY = -285.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_timer: Timer = $CoyoteTimer
var coyote_time_activated: bool = false
@onready var footstep_timer: Timer = $FootstepTimer

var death: bool = false
var footy_started: bool = false
var landing: bool = false
var landed_sound_enabled = false

func _ready() -> void:
	await get_tree().create_timer(0.2).timeout
	landed_sound_enabled = true

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
		if landing:
			if landed_sound_enabled:
				AudioManager.play("res://RealAssets-ForGamersOnly/8bit-SFX-Library/Collide/bonk-3.wav")
			landing = false
		if direction == 0:
			animated_sprite.play("Idle")
			footstep_timer.stop()
			footy_started = false
		else:
			animated_sprite.play("Run")
			if not footy_started:
				footstep_timer.start()
				footy_started = true
		if coyote_time_activated:
			coyote_time_activated = false
			coyote_timer.stop()
	else:
		if !landing:
			landing = true
		footstep_timer.stop()
		footy_started = false
		animated_sprite.play("Jump")
		if !coyote_time_activated:
			coyote_timer.start()
			coyote_time_activated = true
			
	if Input.is_action_just_pressed("jump") and ( !coyote_timer.is_stopped() or is_on_floor() ):
		velocity.y = JUMP_VELOCITY
		coyote_timer.stop()
		coyote_time_activated = true
		AudioManager.play("res://RealAssets-ForGamersOnly/8bit-SFX-Library/Player/jump-3.wav")

	#Applies movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func die() -> void:
	death = true
	footstep_timer.stop()
	Global.death_count += 1
	animated_sprite.play("FuckingExplodes")
	AudioManager.play("res://RealAssets-ForGamersOnly/8bit-SFX-Library/Lose/lose-4.wav")

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "FuckingExplodes":
		get_tree().reload_current_scene()


func _on_footstep_timer_timeout() -> void:
	print("Footstep")
	AudioManager.play("res://RealAssets-ForGamersOnly/8bit-SFX-Library/Collide/bonk-3.wav", -3)
	footstep_timer.start()
