extends Control

func update_score(new_score: int) -> void:
	$VBoxContainer/HBoxContainer/VBoxContainer/Score.text = new_score as String

func update_high_score(new_score: int) -> void:
	var high_score = $VBoxContainer/HBoxContainer/VBoxContainer2/High_score.text as int
	if high_score < new_score:
		$VBoxContainer/HBoxContainer/VBoxContainer2/High_score.text = new_score as String
