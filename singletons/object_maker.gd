extends Node

enum BULLET_KEY { PLAYER, ENEMY }

const BULLETS = {
	BULLET_KEY.PLAYER: preload("res://bullets/bullet_player/bullet_player.tscn"),
	BULLET_KEY.ENEMY: preload("res://bullets/bullet_enemy/bullet_enemy.tscn")
}

func add_child_deferred(child_to_add) -> void:
	get_tree().root.add_child(child_to_add)


func call_add_child(child_to_add) -> void:
	call_deferred("add_child_deferred", child_to_add)


func create_bullet(direction: Vector2, life_span: float,
				speed: float,  key: BULLET_KEY, start_pos: Vector2) -> void:
	var new_b = BULLETS[key].instantiate()
	new_b.setup(direction, life_span, speed)
	new_b.global_position = start_pos
	call_add_child(new_b)	
