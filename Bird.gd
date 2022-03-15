extends KinematicBody2D

export (int) var gravity = 1200
export (float) var omega = PI * 4
export (float) var jump_speed = -400
var velocity = Vector2.ZERO
var flapping = false
var speed_idle = PI * 2
var angle_idle = 0
var screen = OS.window_size
enum STATE {IDLE, FLY}
var state: int = 3
signal hit
signal go

func _ready() -> void:
	hide()
	$CollisionShape2D.disabled = true
	
func start(pos: Vector2) -> void:
	position = pos
	show()
	$CollisionShape2D.disabled = false
	state = STATE.IDLE
 
func _physics_process(delta):
	if state == STATE.FLY:
		velocity.y += gravity * delta
	if state == STATE.IDLE:
		angle_idle += speed_idle * delta
		velocity.y = 50 * sin(angle_idle)
		rotation = 0
		flapping = false
		if Input.is_action_just_pressed("ui_select"):
			state = STATE.FLY
		
	$AnimatedSprite.play()
	if flapping:
		rotation += omega * delta
		if rotation > PI/2:
			rotation = PI/2
			flapping = false
	if Input.is_action_just_pressed("ui_select"):
		rotation = -PI/6
		velocity.y = jump_speed
		$Delay_down.start()
		if flapping:
			flapping = false
	position.y = clamp(position.y, 0, screen.y)
	
	var collision_info = move_and_collide(velocity * delta, false)
	if collision_info:
		emit_signal("hit")

func _start_down():
	flapping = true
