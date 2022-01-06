extends Node2D

var health = 60

func get_damage(num = 10):
	print("Boby..." + str(health - num))
