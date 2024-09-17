# *************************************************
# godot3-Dystopia-game by INhumanity_arts
# Released under MIT License
# *************************************************
# Features
# (1) Animated Themes
#
#
# *************************************************

extends Node
"""
Level Select Scene
"""
# Depreciated Scene
#onready var background : AnimationPlayer = get_node("background/AnimationPlayer")
onready var title : Label = get_node("Label")


# Venus Focus
func _on_TextureButton_focus_entered():
	Background.state = Background.VENUS
	pass

# Mecury Focus
func _on_TextureButton5_focus_entered():
	Background.state = Background.MECURY
	pass

# Start Game
func _on_TextureButton_pressed():
	Background.state = Background.VENUS
	stage_manager.change_stage(stage_manager.GAME_STAGE)
