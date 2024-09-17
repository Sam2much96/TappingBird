# *************************************************
# godot3-TappingBird-game by INhumanity_arts
# Released under MIT License
# *************************************************
# Medal
# 
# Loads Different Medal Textures Into Memory
# 
#
# To Do:
#(1) 
# *************************************************

extends TextureRect

class_name Medal

# This Should All Be in A Global Dictionary
var medal_bronz : StreamTexture = preload("res://sprites/medal_bronze.png")
var medal_silver : StreamTexture = preload("res://sprites/medal_silver.png")
var medal_gold : StreamTexture= preload("res://sprites/medal_gold.png")
var medal_platinum : StreamTexture = preload("res://sprites/medal_platinum.png")

signal medal_shown

func _ready():
	hide()
	var hbox_score_last = utils.get_main_node().find_node("hbox_score_last")
	if hbox_score_last:
		hbox_score_last.connect("counter_finished", self, "show_madel")
	pass

func show_madel(): 
	var texture = null
	
	"Score Comparison Logic"
	# Unsafe Call To Singleton
	if game.score_current >=  game.MEDAL_BRONZ: texture = medal_bronz
	if game.score_current >= game.MEDAL_SILVER: texture = medal_silver
	if game.score_current >= game.MEDAL_GOLD: texture = medal_gold
	if game.score_current >= game.MEDAL_PLATINUM: texture = medal_platinum
	
	if texture != null:
		set_texture(texture)
		show()
		emit_signal("medal_shown")

