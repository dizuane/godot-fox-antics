extends CanvasLayer


func _ready():
	Engine.time_scale = 1


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		GameManager.load_next_level_scene()
