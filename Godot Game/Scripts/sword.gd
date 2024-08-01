extends Area2D

func _ready():
	pass


func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		emit_signal("sword_hit", body)
		_kill_enemy(body)
	
func _kill_enemy(enemy):
	enemy.queue_free()
