# *************************************************
# godot3-TappingBird-game by INhumanity_arts
# Released under MIT License
# *************************************************
# Ground Spawner
# 
# Spawns a Ground Object
# 
# Bug : Bad Code
# To Do:
#(1) Adjust for Mobile Screen Orientation
# (2) Refactor To use Tween To Reposition Ground Node Instead Of Spawning and Queue Freeing
# *************************************************

extends Position2D

export (int) var GROUND_WIDTH : int = 168 # How Wide the grund Tile is and is used to in scroll back calculation
export (PackedScene) var scn_ground : PackedScene = preload("res://scenes/ground.tscn")
export (int) var AMOUNT_TO_FILL_VIEW : int = 2
export (Vector2) var POSITION = Vector2(0,0) 

func _ready():
	#print_debug ("Ground Spawner Is Bad Code")
	#for i in range(AMOUNT_TO_FILL_VIEW):
	#	spwan_ground()
	pass

# Features
# (1) SHould Spawn Ground At Position
#
# TO DO:
# (1) SHould Use Tweening to Move Ground Around rather than spawning and despawning
# (2) Should Use Parallax Background for ground node

func spwan_ground(): # Is Ti repeatedly spawning new grounds?
	var new_ground = scn_ground.instance()
	new_ground.position = position
	print_debug("Position: ", position)
	
	new_ground.connect("tree_exited", self, "spwan_ground")
	position += Vector2(GROUND_WIDTH, 0)
	get_node("container").add_child(new_ground)
