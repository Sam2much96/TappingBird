# *************************************************
# godot3-TappingBird-game by INhumanity_arts
# Released under MIT License
# *************************************************
# Pause Menu
# 
# 
# 
#
# To Do:
#(1) Colour Rect Should Be Set to Automatically Scale to fit Device Resolution
# *************************************************

extends Control

func _ready():
	self.hide()
	var btn_pause = utils.get_main_node().find_node("btn_pause")
	if btn_pause:
		btn_pause.connect("pressed", self, "_on_pause_pressed")
		
	var btn_resume = utils.get_main_node().find_node("btn_resume")
	if btn_resume:
		btn_resume.connect("pressed", self, "_on_resume_pressed")
	pass

func _on_pause_pressed():
	self.show()


func _on_resume_pressed():
	self.hide()
