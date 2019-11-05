extends Node

export var hud_class = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var canvas = Control.new()
	get_tree().get_root().add_child(canvas)
	
	# Create HUD object
	var hud = load(hud_class).instance()
	canvas.add_child(hud)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
