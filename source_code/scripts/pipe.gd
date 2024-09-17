# *************************************************
# godot3-TappingBird-game by INhumanity_arts
# Released under MIT License
# *************************************************
# Pipe Object
# 
# 
# 
#
# To Do:
#(1) Add Functionality To Load Different Pipe Sprite Textures Programmatically
# (2) Edit Sprite Script To Use Visibility Optimiser Node for Sprite Deletion Logic  
# *************************************************

extends StaticBody2D


onready var right = get_node("right")
onready var camera = utils.get_main_node().get_node("camera")


func _ready():
	add_to_group(game.GROUP_PIPES)


func _process(delta):
	
	# Delete Pipe Object Logic
	if right.get_global_position().x <= camera.get_total_pos().x:
		self.queue_free()
