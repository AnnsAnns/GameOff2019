extends KinematicBody2D

signal dash_against_wall

var speed
var is_dashing = false
var velocity = Vector2()

var normal_speed = 400
var dash_speed = 10000

func _ready():
	Global.Player = self

func get_input(delta):
	speed = normal_speed
	velocity = Vector2()	
	
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	
	if Input.is_action_pressed("dash") and !is_dashing:
		dash()
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	if is_dashing and (velocity.x != 0 or velocity.y != 0):
		$AnimatedSprite.animation = "dash"
		$AnimatedSprite.flip_h = velocity.x < 0
	elif is_dashing:
		pass # TO-DO: Add Idle Animation for dashing cooldown
	elif velocity.x != 0:
	    $AnimatedSprite.animation = "run"
	    $AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "run"
	else:
		$AnimatedSprite.animation = "idle"
	
	if is_dashing and test_move(transform, velocity * delta):
		emit_signal("dash_against_wall")
	
func _physics_process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity)

func dash():
	speed = dash_speed
	is_dashing = true
	$dash_timer.start()

func _on_dash_timer_timeout():
	is_dashing = false
