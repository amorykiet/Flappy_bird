extends ParallaxLayer

export (float) var speed_base = 200

func _physics_process(delta):
	self.motion_offset.x -= speed_base * delta
