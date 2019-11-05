extends Node

export var hud_class = ""

## Reference to node that shows UI nodes.
var canvas

## Reference to node that shows HUD.
var hud

# Called when the node enters the scene tree for the first time.
func _ready():
	canvas = Control.new()
	get_tree().get_root().add_child(canvas)
	
	# Create HUD object
	hud = load(hud_class).instance()
	canvas.add_child(hud)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
