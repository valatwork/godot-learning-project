extends CharacterBody2D

@onready var animated_sprite = %Player
@onready var sfx_walk: AudioStreamPlayer = $FootstepsWalkGrassMono19
@onready var sfx_walk_alt: AudioStreamPlayer = $FootstepsWalkGrassMono25
@onready var sfx_walk_up: AudioStreamPlayer = $FootstepsWalkGrassMono15
@onready var sfx_walk_down: AudioStreamPlayer = $FootstepsWalkGrassMono16


func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 300
	move_and_slide()
	
	if Input.is_action_just_pressed("move_left"):
		animated_sprite.play("walk")
		animated_sprite.flip_h = true
		sfx_walk.play()
	elif Input.is_action_just_pressed("move_right"):
		animated_sprite.play("walk")
		animated_sprite.flip_h = false
		sfx_walk_alt.play()
	elif Input.is_action_just_pressed("move_up"):
		sfx_walk_up.play()
	elif Input.is_action_just_pressed("move_down"):
		sfx_walk_down.play()
	else:
		animated_sprite.play("idle")
