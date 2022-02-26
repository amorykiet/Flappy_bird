extends ParallaxLayer

export (float) var speed_background = 15

func _physics_process(delta):
	self.motion_offset.x -= speed_background * delta
