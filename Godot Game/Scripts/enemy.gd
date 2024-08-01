extends CharacterBody2D

@export var speed: float = 50.0
@export var enemy_scene: PackedScene

var player: CharacterBody2D

func _ready():
	player = get_node("/root/World/Player")

func _physics_process(delta):
	$AnimatedSprite2D.play("run")
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
