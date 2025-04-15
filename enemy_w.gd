extends Area2D

const SPEED: float = 250.0
const STOP_DISTANCE: float = 5.0

@onready var player = get_node("/root/Node2D/Pausable/player")
@onready var animated_sprite = $AnimatedSprite2D
@onready var sfx_blahblahw = $"MamieGibberish1-38387"

func _physics_process(_delta):
	
	var direction = (player.global_position - global_position).normalized()
	var distance = global_position.distance_to(player.global_position)

	if player:
		if distance > STOP_DISTANCE:
			velocity = direction * SPEED
			animated_sprite.play("walk")
			sfx_blahblahw.play()
			
		else:
			velocity = Vector2.ZERO
			animated_sprite.play("idle")
		
		move_and_slide()
