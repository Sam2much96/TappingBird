# *************************************************
# godot3-TappingBird-game by INhumanity_arts
# Released under MIT License
# *************************************************
# Game Over
# 
# Shows the game Over HUD once player death is registered
# 
#
# To Do:
#(1) 
# *************************************************


extends Control

class_name GameOver

func _ready():
	self.hide()
	var bird = utils.get_main_node().get_node("bird");
	if bird:
		bird.connect("state_changed", self, "_on_bird_state_changed")


# Connects To Bird Node Object
func _on_bird_state_changed(bird):
	if bird.get_state() == bird.STATE_GROUNDED:
		get_node("anim").play("show")

