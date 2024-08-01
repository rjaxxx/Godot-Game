extends CharacterBody2D
var speed = 100

var player_state

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"

	velocity = direction * speed
	move_and_slide()
	
	play_anim(direction)

	if Input.is_action_just_pressed("attack"):
		if player_state == "idle":
			$AnimationPlayer.play("attackdown")
		if player_state == "walking":
			if direction.y == 1:
				$AnimationPlayer.play("attackdown")
			if direction.y == -1:
				$AnimationPlayer.play("attackup")
			if direction.x == 1:
				$AnimationPlayer.play("attackright")
			if direction.x == -1:
				$AnimationPlayer.play("attackleft")
			if direction.x > 0.5 and direction.y < -0.5:
				$AnimationPlayer.play("attackup")
			if direction.x > 0.5 and direction.y > 0.5:
				$AnimationPlayer.play("attackdown")
			if direction.x < -0.5 and direction.y > 0.5:
				$AnimationPlayer.play("attackdown")
			if direction.x < -0.5 and direction.y < -0.5:
				$AnimationPlayer.play("attackup")

func play_anim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	if player_state == "walking":
		if dir.y == 1:
			$AnimatedSprite2D.play("walk down")
		if dir.y == -1:
			$AnimatedSprite2D.play("walk up")
		if dir.x == 1:
			$AnimatedSprite2D.play("walk down")
		if dir.x == -1:
			$AnimatedSprite2D.play("walk down")
		
		if dir.x > 0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("walk up")
		if dir.x > 0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("walk down")
		if dir.x < -0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("walk down")
		if dir.x < -0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("walk up")

func player():
	pass
