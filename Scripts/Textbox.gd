extends Control

onready var tie = get_node("panel/text_interface_engine")

func demo_text():
	tie.reset() # Resets textbox
	tie.set_color(Color(1,1,1)) # Sets Text Colour
	# Buff text: "Text", duration (in seconds) of each letter
	tie.buff_text("Test Text, Text Test\n", 0.1)
	tie.buff_text("lalala\n", 0.3)
	# Buff silence: Duration of the silence (in seconds)
	tie.buff_silence(1)
	tie.buff_text("Enter Input: ", 0.01)
	tie.buff_input()
	tie.set_state(tie.STATE_OUTPUT)

func _ready():
	# Connect every signal to check them using the "print()" method
	tie.connect("input_enter", self, "_on_input_enter")
	tie.connect("buff_end", self, "_on_buff_end")
	tie.connect("state_change", self, "_on_state_change")
	tie.connect("enter_break", self, "_on_enter_break")
	tie.connect("resume_break", self, "_on_resume_break")
	tie.connect("tag_buff", self, "_on_tag_buff")
	pass

func _on_input_enter(s):
	print("Input Enter ",s)
	
	tie.add_newline()
	tie.buff_text("Your inpute was: " + s, 0.01)
	pass

func _on_buff_end():
	print("Buff End")
	pass

func _on_state_change(i):
	print("New state: ", i)
	pass

func _on_enter_break():
	print("Enter Break")
	pass

func _on_resume_break():
	print("Resume Break")
	pass

func _on_tag_buff(s):
	print("Tag Buff ",s)
	pass

func _on_Button_pressed():
	demo_text()