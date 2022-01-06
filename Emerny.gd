extends Node2D

var enermy_is_comming = true
var enermy_amount = 100
signal enermy_go(num)

func _ready():
	emit_signal("enermy_go", enermy_amount)
func damge(health):
	health -= 10
