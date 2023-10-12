extends Area2D

const TRIGGER_CONDITION: String = "parameters/conditions/on_trigger"

@onready var animation_tree = $AnimationTree
@onready var sound = $Sound


func _ready():
	SignalManager.on_boss_killed.connect(on_boss_killed)



func on_boss_killed(_p: int) -> void:
	animation_tree[TRIGGER_CONDITION] = true
	monitoring = true
	SoundManager.play_clip(sound, SoundManager.SOUND_WIN)


func _on_area_entered(area):
	SignalManager.on_level_complete.emit()
