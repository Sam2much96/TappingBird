# *************************************************
# godot3-TappingBird-game by INhumanity_arts
# Released under MIT License
# *************************************************
# Pipe Spawner
# Spawns Pipe Objects of various amounts Within the Scene Tree
# 
# 
#
# To Do:
# (1) Export Algorithm to Inspector Tab for Fine Tunning 
# (2) Implement Different Pipe Sprites
# *************************************************
# Features:
# (1) Ground Height is set to Ground.gd colision Y coo-rdinate 
# (2) Alter ground Height TO increase Difficulty. Set to 0 for highest difficulty
# *************************************************
 
extends Node2D

class_name PipeSpawner

const scn_pipe : PackedScene = preload("res://scenes/pipe.tscn")
export (int) var PIPE_WIDTH : int = 50
export (int) var GROUND_HEIGHT : int = 0#391#56 #if lanscpe , 500 if vertical
export (int) var OFFSET_Y : int = 0
export (int) var OFFSET_X : int = 0
export (int) var AMOUNT_TO_FILL_VIEW : int = 3

func _ready():
	var bird = utils.get_main_node().get_node("bird")
	if (bird):
		bird.connect("state_changed", self, "_on_bird_state_changed", [], CONNECT_ONESHOT)
	pass
	
func _on_bird_state_changed(bird):
	if bird.get_state() == bird.STATE_FLAPPING:
		start()
	pass
	
#func _process(delta):
#	pass

func start():
	go_init_pos()
	for i in range(AMOUNT_TO_FILL_VIEW):
		spawn_and_move()

func go_init_pos():
	randomize()
	var init_pos = position
	init_pos.x += get_viewport_rect().size.x + PIPE_WIDTH/2
	init_pos.y = rand_range(0 + OFFSET_Y, get_viewport_rect().size.y - GROUND_HEIGHT - OFFSET_Y)
	var camera = utils.get_main_node().get_node("camera")
	if camera:
		init_pos.x += camera.get_total_pos().x
	position = init_pos

func spawn_and_move():
	spawn_pipe()
	go_next_pos()


func spawn_pipe():
	var new_pipe = scn_pipe.instance()
	new_pipe.position = position;
	new_pipe.connect("tree_exited", self, "spawn_and_move")
	#get_node("container").add_child(new_pipe)
	get_node("container").call_deferred("add_child", new_pipe)

"""
SPAWN PIPE ALGORITHM
"""
# TO DO:
# (1) FineTune algorithm
func go_next_pos(): # Renders New Pipe at a Random Poision using this algorithm
	randomize()
	var next_pos = position
	next_pos.x += PIPE_WIDTH/2 + OFFSET_X + PIPE_WIDTH/2
	next_pos.y = rand_range(0 + OFFSET_Y, get_viewport_rect().size.y - GROUND_HEIGHT - OFFSET_Y)
	position = next_pos
