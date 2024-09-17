# *************************************************
# godot3-TappingBird-game by INhumanity_arts
# Released under MIT License
# *************************************************
# Game
# 
# The Game's Global Singleton
# 
#
# To Do:
#(1) 
# *************************************************

#script: game
extends Node
class_name game_manager

const GROUP_PIPES 	= "pipes"
const GROUP_GROUNDS 	= "grounds"
const GROUP_BIRDS 	= "birds"

"Game Scores Criteria"
var MEDAL_BRONZ : int = 10
var MEDAL_SILVER : int = 20
var MEDAL_GOLD : int = 30
var MEDAL_PLATINUM : int= 50

var score_best 		= 0 setget _set_score_best
var score_current 	= 0 setget _set_score_current

signal score_best_changed
signal score_current_changed

func _ready():
	stage_manager.connect("stage_changed", self, "_on_stage_changed")


func _on_stage_changed():
	score_current = 0


func _set_score_current(new_val : int):
	score_current = new_val
	emit_signal("score_current_changed")


func _set_score_best(new_val : int):
	if new_val > score_best:
		score_best = new_val
		emit_signal("score_best_changed")
