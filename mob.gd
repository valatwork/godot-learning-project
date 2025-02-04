extends CharacterBody2D

@onready var player = get_node("/root/Node2D/Pausable/player")
@onready var animated_sprite = $AnimatedSprite2D
@onready var sfx_blahblah = $"Strange-creature-talks-96872"

var stop_distance = 10 
var speed = 150


func _physics_process(_delta):
	
	var direction = (player.global_position - global_position).normalized()
	var distance = global_position.distance_to(player.global_position)

	if player:
		if distance > stop_distance:
			velocity = direction * speed
			animated_sprite.play("walk")
			sfx_blahblah.play()
			
		else:
			velocity = Vector2.ZERO
			animated_sprite.play("idle")
		
		move_and_slide()
