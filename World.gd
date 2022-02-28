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
	update_score(0)
	$HUD/Play.hide()
	get_tree().call_group("Pipe_group", "died")
	get_tree().paused = false
	$Time_spawn.start()
	$Bird.start($Start_point.position)

func game_over() -> void:
	get_tree().call_group("Pipe_group", "is_disabled")
	$HUD/Play.text = "Restart"
	$HUD/Play.show()
	get_tree().paused = true

func update_score(new_score: int) -> void:
	$HUD/Score.text = new_score as String

func update_high_score(new_score: int) -> void:
	$HUD/High_score.text = new_score as String

func hit_score(body):
	score += 1
	update_score(score)
	if score > $HUD/High_score.text as int:
		update_high_score(score)
#it change
