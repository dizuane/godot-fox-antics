extends PathFollow2D

@export var speed: float = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	progress_ratio = progress_ratio + delta * speed
