extends RandomMoveStrategy

class_name TestMoveStrategy


func move(current_position:Vector2) -> Vector2:
	var moved:bool = false
	
	if (collision_state == true):
		return current_position
		
	if (Input.is_action_pressed("ui_right")):
		#print("RIGHT")
		sprite_direction = Direction.RIGHT
		current_position.x += speed
		moved = true
		
	elif (Input.is_action_pressed("ui_left")):
		#print("LEFT")
		sprite_direction = Direction.LEFT
		current_position.x -= speed
		moved = true
		
	elif (Input.is_action_pressed("ui_up")):
		#print("UP")
		sprite_direction = Direction.UP
		current_position.y -= speed
		moved = true
		
	elif (Input.is_action_pressed("ui_down")):
		#print("DOWN")
		sprite_direction = Direction.DOWN
		current_position.y += speed
		moved = true
	
	if (moved):
		print ("<TestMoveStrategy> move()  collision_state: " + str(collision_state) 
			   + "  direction: " + str(sprite_direction) ) 
	
	return current_position

