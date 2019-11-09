extends Node2D

func _on_ready():
	pass

func NPC_textbox():
	if $Player in $TestDummy/Area2D.get_overlapping_bodies() and Input.is_action_pressed("ui_accept"):
		var txtbox = $DasherHUD/CanvasLayer/Textbox/panel/InputBox
		
		$DasherHUD/CanvasLayer/Textbox.show()
		
		txtbox.reset()
		txtbox.set_color(Color(1,1,1))
		txtbox.buff_text("Wow, my sole purpose is to be some example for this test level?", 0.05) # 0.05 -> seconds per character
		txtbox.buff_silence(2) # 2 second pause between lines
		txtbox.buff_text("\nThat sucks :/", 0.02)
		txtbox.buff_silence(5) # Keep textbox for 5 seconds
		txtbox.set_state(1)
		
		yield(txtbox, "buff_end")
		
		$DasherHUD/CanvasLayer/Textbox.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Check if player is inside the Area2D, somebody should really find a better way to do this lmao
	NPC_textbox()