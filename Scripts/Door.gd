extends Area2D

var can_click = false

### Add global markups for player, enemy and friendly npc

func _on_Door_body_entered(body):
	if not body == Global.Player and not $AnimationPlayer.is_playing():
		open()
	else:
		can_click = true
	pass

func _on_Door_body_exited(body):
	if body == Global.Player:
		can_click = false
	pass

func open():
	$AnimationPlayer.plau("open")

func _input_event(viewport, event, shape_idx)
	if Input.is_key_pressed()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

