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
	get_tree().call_group("Pipe_group", "died")
	score = 0
	$HUD/Control.update_score(0)
	$HUD/Control/ColorRect.hide()
	$HUD/Control/ReferenceRect.hide()
	$HUD/Control/VBoxContainer.hide()
	$HUD/Control/Score.show()
	$Bird.start($Start_point.position)
	get_tree().paused = false

func _process(delta):
	if $Bird.state == 1 and $Time_spawn.is_stopped():
		$Time_spawn.start()
	if $Bird.state == 0:
		$Time_spawn.stop()
	
func game_over() -> void:
	get_tree().call_group("Pipe_group", "is_disabled")
	$HUD/Control/ColorRect.show()
	$HUD/Control/ReferenceRect.show()
	$HUD/Control/VBoxContainer.show()
	$HUD/Control/Score.hide()
	$HUD/Control/VBoxContainer/Start_button.text = "Retry"
	get_tree().paused = true

func hit_score(body):
	score += 1
	$HUD/Control.update_score(score)
	$HUD/Control.update_high_score(score)
	
