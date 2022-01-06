extends Node2D
var boolean = true

func _process(delta):
	if boolean:
		get_tree().call_group("enermies", "get_damage")
		boolean = false
