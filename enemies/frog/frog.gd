extends EnemyBase

const JUMP_VELOCITY: Vector2 = Vector2(100, -150)
const JUMP_WAIT_RANGE: Vector2 = Vector2(2.5, 5.0)

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var jump_timer = $JumpTimer

var _jump: bool = false
var _seen_player: bool = false

func _ready():
	super._ready()
	start_timer()


func _physics_process(delta):
	super._physics_process(delta)
	if !is_on_floor():
		velocity.y += _gravity * delta
	else:
		velocity.x = 0
		animated_sprite_2d.play("idle")
	
	apply_jump()
	move_and_slide()
	flip_me()


func apply_jump() -> void:
	if !is_on_floor():
		return
	
	if !_seen_player or !_jump:
		return
	
	velocity = JUMP_VELOCITY
	
	if !animated_sprite_2d.flip_h:
		velocity.x = velocity.x * -1
	
	_jump = false
	animated_sprite_2d.play("jump")
	start_timer()


func flip_me() -> void:
	if (_player_ref.global_position.x > global_position.x
		and !animated_sprite_2d.flip_h):
			
		animated_sprite_2d.flip_h = true
	elif (_player_ref.global_position.x < global_position.x
		and animated_sprite_2d.flip_h):
			
		animated_sprite_2d.flip_h = false


func start_timer() -> void:
	jump_timer.wait_time = randf_range(JUMP_WAIT_RANGE.x, JUMP_WAIT_RANGE.y)
	jump_timer.start()


func _on_jump_timer_timeout():
	_jump = true


func _on_visible_on_screen_notifier_2d_screen_entered():
	_seen_player = true
