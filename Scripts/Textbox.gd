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