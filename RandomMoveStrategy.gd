extends MoveStrategy

class_name RandomMoveStrategy

var random_gen = RandomNumberGenerator.new()

const STEP_SIZE = 100

<<<<<<< HEAD
var   step = STEP_SIZE


#-------------------- update() --------------------
=======
var   step      = STEP_SIZE


>>>>>>> f138f555963d8694104f68f2bebb38e186b98f6c
func update(sprt:Sprite):
	if (step == 0):
		sprite_direction = random_gen.randi_range(0,3)
		step = STEP_SIZE
	else :
<<<<<<< HEAD
		step -= 1
	
	if (colliding_edge != Direction.NONE):
		var t = sprt.get_transform()
		var new_position:Vector2 = move(Vector2(t.origin.x, t.origin.y))
		t.origin = new_position
		sprt.set_transform(t)
		sprt.update()
#-------------------- update()
=======
		step -=1
	
	if (not collision_state):
		var t = sprt.get_transform()
		t = move(t)
		sprt.set_transform(t)
		sprt.update()
>>>>>>> f138f555963d8694104f68f2bebb38e186b98f6c


func move(current_position:Vector2) -> Vector2:
	#print ("<RandomMoveStrategy> move()")
	var new_position:Vector2 = current_position
	
	var user_direction:int = -1
	
	#if (colliding_edge != Direction.NONE):
	#	return current_position
		
	#---------- Checks if User selects direction (eg: arrow keys) ----------
	user_direction = Direction.NONE
	
	if (colliding_edge != Direction.NONE):
		if (Input.is_action_pressed("ui_right")):
			#print("RIGHT")
			user_direction = Direction.RIGHT
		
		elif (Input.is_action_pressed("ui_left")):
			#print("LEFT")
			user_direction = Direction.LEFT
		
		elif (Input.is_action_pressed("ui_up")):
			#print("UP")
			user_direction = Direction.UP
		
		elif (Input.is_action_pressed("ui_down")):
			#print("DOWN")
			user_direction = Direction.DOWN
	#---------- Checks if User selects direction (eg: arrow keys)
	
	
	if user_direction != Direction.NONE:
		sprite_direction = user_direction
	
	
	if sprite_direction == Direction.UP :
		new_position.y -= speed
	elif sprite_direction == Direction.DOWN :
		new_position.y += speed
	elif sprite_direction == Direction.LEFT :
		new_position.x -= speed
	elif sprite_direction == Direction.RIGHT :
		new_position.x += speed
	elif sprite_direction == Direction.NONE :
		pass
	else:
		return Vector2.ZERO 
		
	return new_position


<<<<<<< HEAD
=======
func edge_hit(edge:int):
	print ("<RandomMoveStrategy> edge_hit()  sprite_direction: " + str(sprite_direction))
	set_collision_state(true)
	
	if edge == Direction.UP :
		sprite_direction = Direction.DOWN
	elif edge == Direction.DOWN :
		sprite_direction = Direction.UP
	elif edge == Direction.LEFT :
		sprite_direction = Direction.RIGHT
	elif edge == Direction.RIGHT :
		sprite_direction = Direction.LEFT


>>>>>>> f138f555963d8694104f68f2bebb38e186b98f6c
func _on_Slider_step_value_changed(value):
	step_value.set_text( "Step : " + str(value))
	step = value

