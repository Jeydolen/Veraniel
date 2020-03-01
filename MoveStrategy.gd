extends Node

class_name MoveStrategy

onready var speed_value = $"/root/Sprite_move/View/VBoxContainer/speed_value"
onready var step_value  = $"/root/Sprite_move/View/VBoxContainer/step_value"

enum Direction{ 
	NONE = -1,
	UP = 0,
	LEFT = 1,
	DOWN = 2,
	RIGHT = 3 
}

var sprite_direction:int = Direction.UP
var speed = 1.0

<<<<<<< HEAD
onready var colliding_edge:int = Direction.NONE
=======
>>>>>>> f138f555963d8694104f68f2bebb38e186b98f6c
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
	
<<<<<<< HEAD
func set_colliding_edge(edge:int):
	colliding_edge = edge
	
=======
func edge_hit(edge:int):
	set_collision_state(true)
	pass
	
func set_collision_state(value:bool):
	collision_state = value
>>>>>>> f138f555963d8694104f68f2bebb38e186b98f6c
	
func get_opposite_edge(edge:int):
	var opposite_edge = Direction.NONE
	
	if (edge == Direction.UP):
		opposite_edge = Direction.DOWN
<<<<<<< HEAD
	elif (edge == Direction.DOWN):
		opposite_edge = Direction.UP
	elif (edge == Direction.LEFT):
		opposite_edge = Direction.RIGHT
	elif (edge == Direction.RIGHT):
		opposite_edge = Direction.LEFT
	else:
		opposite_edge = Direction.NONE
		
	return opposite_edge
#---- get_opposite_edge()


func edge_hit(edge:int):
	print ("<MoveStrategy> edge_hit()  sprite_direction: " + str(sprite_direction))
	colliding_edge = edge
	if (edge != Direction.NONE):
		sprite_direction = get_opposite_edge (edge)
=======
		
	elif (edge == Direction.DOWN):
		opposite_edge = Direction.UP
		
	elif (edge == Direction.LEFT):
		opposite_edge = Direction.RIGHT
		
	elif (edge == Direction.RIGHT):
		opposite_edge = Direction.LEFT
		
	return opposite_edge
>>>>>>> f138f555963d8694104f68f2bebb38e186b98f6c


func _on_Slider_speed_value_changed(value):
	speed_value.set_text( "Speed : " + str(value))
	speed = value
