extends Node2D
export var pipe: PackedScene
var score: int

func _on_Time_spawn_timeout() -> void:
	var p = pipe.instance()
	$Path2D/PathFollow2D.unit_offset = randf()
	p.position = $Path2D/PathFollow2D.position
	add_child(p)
	var veclocity : Vector2 = Vector2.LEFT
	p.linear_velocity = veclocity * p.speed
	
func game_start() -> void:
	score = 0
	$HUD/Control.update_score(0)
	$HUD/Control.hide()
	get_tree().call_group("Pipe_group", "died")
	get_tree().paused = false
	$Time_spawn.start()
	$Bird.start($Start_point.position)

func game_over() -> void:
	get_tree().call_group("Pipe_group", "is_disabled")
	get_tree().paused = true
	$HUD/Control.show()
#
#func update_score(new_score: int) -> void:
#	pass
#
#func update_high_score(new_score: int) -> void:
#	pass

func hit_score(body):
	score += 1
	$HUD/Control.update_score(score)
	$HUD/Control.update_high_score(score)
