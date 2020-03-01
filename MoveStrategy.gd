extends Node

class_name MoveStrategy

onready var speed_value = $"/root/Sprite_move/View/VBoxContainer/speed_value"

enum Direction{ 
	NONE = -1,
	UP = 0,
	LEFT = 1,
	DOWN = 2,
	RIGHT = 3 
}

var sprite_direction:int = Direction.UP
var speed = 1.0

var collision_state:bool = false

func get_direction() -> int:
	return sprite_direction

func update(sprt:Sprite):
	#print ("<NullMoveStrategy> update()")
	pass

func move(current_position:Vector2) -> Vector2:
	#print ("<MoveStrategy> move()")
	return Vector2.ZERO
	#pass
	
func edge_hit(edge:int):
	set_collision_state(true)
	pass
	
func set_collision_state(value:bool):
	collision_state = value
	
func get_opposite_edge(edge:int):
	var opposite_edge = Direction.NONE
	
	if (edge == Direction.UP):
		opposite_edge = Direction.DOWN
		
	elif (edge == Direction.DOWN):
		opposite_edge = Direction.UP
		
	elif (edge == Direction.LEFT):
		opposite_edge = Direction.RIGHT
		
	elif (edge == Direction.RIGHT):
		opposite_edge = Direction.LEFT
		
	return opposite_edge


func _on_Slider_speed_value_changed(value):
	speed_value.set_text( "Speed : " + str(value))
	speed = value
