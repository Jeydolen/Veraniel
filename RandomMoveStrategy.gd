extends MoveStrategy

class_name RandomMoveStrategy

onready var step_value = $"/root/Sprite_move/View/VBoxContainer/step_value"

var random_gen = RandomNumberGenerator.new()
const STEP_SIZE = 100
var step = STEP_SIZE



func update():
	if (step == 0):
		sprite_direction = random_gen.randi_range(0,3)
		step = STEP_SIZE
	else :
		step -=1

func move(current_position:Vector2) -> Vector2:
	print ("<RandomMoveStrategy> move()")
	var new_position:Vector2 = current_position
	
	if sprite_direction == Direction.UP :
		new_position.y -= speed
	elif sprite_direction == Direction.DOWN :
		new_position.y += speed
	elif sprite_direction == Direction.LEFT :
		new_position.x -= speed
	elif sprite_direction == Direction.RIGHT :
		new_position.x += speed
	else:
		return Vector2.ZERO 
	return new_position

func edge_hit(edge):
	print ("<RandomMoveStrategy> edge_hit()")
	if edge == Direction.UP :
		sprite_direction = Direction.DOWN
	elif edge == Direction.DOWN :
		sprite_direction = Direction.UP
	elif edge == Direction.LEFT :
		sprite_direction = Direction.RIGHT
	elif edge == Direction.RIGHT :
		sprite_direction = Direction.LEFT



func _on_Slider_step_value_changed(value):
	print("<RandomMoveStrategy> " + str (value))
	step_value.set_text( "Step : " + str(value))
	step = value

