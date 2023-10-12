extends CanvasLayer

@onready var label_high_score = $VB/LabelHighScore


func _ready():
	label_high_score.text = "Highscore " + str(ScoreManager.get_highscore())


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		GameManager.load_next_level_scene()
