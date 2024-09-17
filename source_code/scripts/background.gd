extends ParallaxBackground
"""
Transitions background Between Different Types using animation player

"""

onready var anims : AnimationPlayer = get_node("AnimationPlayer")

enum {RANDOM_TRANSITIONS, MECURY, VENUS,MARS}

var state = MECURY

#func _ready():
#	anims.play("RANDOM_TRANSITIONS")


func _process(_delta):
	match state:
		RANDOM_TRANSITIONS:
			anims.play("RANDOM_TRANSITIONS")
		MECURY:
			anims.play("ANIMS_5")
		VENUS:
			anims.play("ANIMS_1")
