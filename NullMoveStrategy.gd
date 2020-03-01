# "Null object" subclass of MoveStrategy
extends MoveStrategy

class_name NullMoveStrategy

func update(sprt:Sprite):
	print ("<NullMoveStrategy> update() !!!!!!!!!!!!!!!!!")
	#pass

func move(current_position:Vector2) -> Vector2:
	print ("<NullMoveStrategy> move() !!!!!!!!!!!!!!!!!!!")
	return Vector2.ZERO
	#pass
	
func edge_hit(edge):
	print ("<NullMoveStrategy> edge_hit() !!!!!!!!!!!!!!!!!")

