class_name Player extends CharacterBody2D

signal collide()

signal start()

const jump_speed : int = 215
const down_speed : int = 300
const gravity : int = 600

@export var started : bool = false

@onready var area : Area2D = $Area3D
@onready var collision : CollisionPolygon2D = $Shape3D
@onready var jump_sound : AudioStreamPlayer2D = $JumpAudio

func _physics_process(delta):
	if start:
		velocity.y += gravity * delta
		velocity.y = clamp(velocity.y, -gravity, gravity)
	
		set_velocity(velocity)
		# TODOConverter40 looks that snap in Godot 4.0 is float, not vector like in Godot 3 - previous value `Vector2.DOWN`
		set_up_direction(Vector2.UP)
		move_and_slide()
		velocity = velocity
	
	var pressed = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	if (is_on_floor() or not started) and pressed == 1:
		jump_sound.play()
		started = true
		emit_signal("start")
		velocity.y -= jump_speed
	elif not is_on_floor() and pressed == -1:
		velocity.y = down_speed

func _on_Area_body_entered(body):
	if body is Enemy:
		emit_signal("collide")
