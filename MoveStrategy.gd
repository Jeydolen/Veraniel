extends Node2D

class_name MoveStrategy

onready var speed_value = $"/root/Sprite_move/View/VBoxContainer/speed_value"

enum Direction{ 
UP = 0,
LEFT = 1,
DOWN = 2,
RIGHT = 3 }

var sprite_direction:int = Direction.UP
var speed = 1.0

func get_direction() -> int:
	return sprite_direction

func update():
	print ("<MoveStrategy> update()")
	#pass

func move(current_position:Vector2) -> Vector2:
	print ("<MoveStrategy> move()")
	return Vector2.ZERO

func edge_hit(edge):
	print ("<MoveStrategy> edge_hit()")



func _on_Slider_speed_value_changed(value):
	speed_value.set_text( "Speed : " + str(value))
	speed = value
