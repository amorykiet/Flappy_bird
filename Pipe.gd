extends RigidBody2D
export var speed: float = 150

func _ready():
	linear_velocity = Vector2.LEFT * speed

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
	
func died() -> void:
	queue_free()

func is_disabled() -> void:
	$CollisionShape2D.disabled = true
	$CollisionShape2D2.disabled = true

