extends TextureButton


var bk = [ Background.VENUS, Background.MECURY,Background.VENUS]

func _ready():
	
	
	connect("pressed", self, "_on_pressed")
	
	Background.state = Background.RANDOM_TRANSITIONS # show random transitions on the title screen
	#pass

func _on_pressed():
	disabled = true
	Background.state = bk[randi() % bk.size()] # Select A Random Bckgound Element
	stage_manager.change_stage(stage_manager.GAME_STAGE)
	#stage_manager.change_stage(stage_manager.LEVEL_SELECT_STAGE) #depreciated #make level changer randomized

