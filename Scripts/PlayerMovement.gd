extends KinematicBody2D

var speed
var is_dashing = false
var velocity = Vector2()

func get_input():
	speed = 200
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
	
	velocity = velocity.normalized() * speed

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
