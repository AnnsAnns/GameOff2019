extends Area2D

var can_click = false

### Add global markups for player, enemy and friendly npc

func _on_Door_body_entered(body):
	if not body == Global.Player and not $AnimationPlayer.is_playing():
		open()
	else:
		can_click = true


func _on_Door_body_exited(body):
	if body == Global.Player:
		can_click = false


func open():
	$AnimationPlayer.play("open")

func _physics_process(delta):
	get_input()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	if Input.is_action_pressed("interact") and can_click:
		open()