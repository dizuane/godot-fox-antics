extends Node2D

@onready var sound = $Sound
@onready var shoot_timer = $ShootTimer

@export var speed: float = 50.0
@export var life_span: float = 10.0
@export var bullet_key: ObjectMaker.BULLET_KEY
@export var shoot_delay: float = 0.7

var _can_shoot: bool = true

func _ready():
	shoot_timer.wait_time = shoot_delay


func shoot(direction: Vector2) -> void:
	if !_can_shoot:
		return
	
	_can_shoot = false
	SoundManager.play_clip(sound, SoundManager.SOUND_LASER)
	ObjectMaker.create_bullet(
		direction,
		life_span,
		speed,
		bullet_key,
		global_position
	)
	shoot_timer.start()
	
'''
func create_bullet(direction: Vector2, life_span: float,
				speed: float,  key: BULLET_KEY, start_pos: Vector2) -> void:
'''


func _on_shoot_timer_timeout():
	_can_shoot = true
