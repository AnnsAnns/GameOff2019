extends KinematicBody2D

var speed
var is_dashing = false
var velocity = Vector2()

func _ready():
	Global.Player = self

func get_input():
	speed = 400
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
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func dash():
	speed = 10000
	is_dashing = true
	$dash_timer.start()

func _on_dash_timer_timeout():
	is_dashing = false

func _on_Barrier_body_entered(body):
	print("Hit Barrier")
