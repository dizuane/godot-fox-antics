extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func kill_me() -> void:
	set_process(false)
	hide()
	queue_free()


func _on_life_timer_timeout():
	kill_me()
