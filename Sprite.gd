extends Sprite

var move_strategy : MoveStrategy = NullMoveStrategy.new()

onready var Sprite_x = $"/root/Sprite_move/View/VBoxContainer2/Sprite_y"
onready var Sprite_y = $"/root/Sprite_move/View/VBoxContainer2/Sprite_x"
 # ex : $"/root/Pigmint/View/Menus/MainMenu/FileSubmenu"

var sprite_dim:Vector2 = get_rect().size
var sprite_pos:Vector2 = Vector2(0,0) 

var viewport_rect:Rect2 = Rect2(Vector2.ZERO, Vector2.ZERO)
var viewport_transform:Transform2D = Transform2D(Vector2.ZERO, Vector2.ZERO, Vector2.ZERO)

var viewport_x = 0
var viewport_y = 0


func _ready():
	viewport_rect = get_viewport().get_visible_rect()
	viewport_transform = get_owner().get_transform()
	print ("Window width : " + str(viewport_rect.size.x) + " Window height : " + str(viewport_rect.size.y))
	print ("Window x : " + str(viewport_rect.position.x) + " Window y : " + str(viewport_rect.position.y))
	
	print ("Sprite width: " + str(sprite_dim.x) + "  height: " + str(sprite_dim.y))
	
	move_strategy = RandomMoveStrategy.new()
	#move_strategy = TestMoveStrategy.new()
	
	#Exit app
	#get_tree().quit()


#-------------------- _process() --------------------
func _process(_delta):
	
	var t:Transform2D = get_transform()
		
	#sprite_pos = Vector2(get_transform().x.x, get_transform().y.y)
	sprite_pos = t.origin
	
	viewport_transform = get_owner().get_transform()
	#print ("Number = " + str (Sprite_direction))
	
	Sprite_y.set_text("y : " + str(t.origin.y))
	Sprite_x.set_text("x : " + str(t.origin.x))
	#print ("sprite_pos.x = " + str (t.origin.x) + " sprite_pos.y = " + str (t.origin.y))

#---------------------------------------------------------------#
	var colliding_edge:int = check_collision_with_edge(t.origin)
	var is_colliding:bool  = (colliding_edge != MoveStrategy.Direction.NONE)
	
	if (is_colliding):
		move_strategy.edge_hit(colliding_edge)
	else:
		if (move_strategy.get_direction() == colliding_edge) : 
			if (t.origin.x - sprite_dim.x/2 >= viewport_rect.position.x) : 
				move_strategy.set_collision_state(false)
				t.origin.x = move_strategy.move(t.origin).x
#---------------------------------------------------------------#		
		elif (move_strategy.get_direction() == MoveStrategy.Direction.UP) : 
			if (t.origin.y - sprite_dim.y/2 >= viewport_rect.position.y) : 
				move_strategy.set_collision_state(false)
				t.origin.y = move_strategy.move(t.origin).y
#---------------------------------------------------------------#
		elif (move_strategy.get_direction() == MoveStrategy.Direction.DOWN) : 
			if (t.origin.y + sprite_dim.y/2 <= viewport_rect.size.y) : 
				move_strategy.set_collision_state(false)
				t.origin.y = move_strategy.move(t.origin).y
#--------------------------------------------------------------------------#
		elif (move_strategy.get_direction() == MoveStrategy.Direction.RIGHT) : 
			if (t.origin.x + sprite_dim.x/2 <= viewport_rect.size.x) : 
				move_strategy.set_collision_state(false)
				t.origin.x = move_strategy.move(t.origin).x

	move_strategy.update(self)
#-------------------- _process()


func check_collision_with_edge(position:Vector2) -> int:
	#---------------------------------------------------------------#
	if (move_strategy.get_direction() == MoveStrategy.Direction.LEFT) : 
		if (position.x - sprite_dim.x/2 <= viewport_rect.position.x) : 
			return MoveStrategy.Direction.LEFT
	
	elif (move_strategy.get_direction() == MoveStrategy.Direction.UP) : 
		if (position.y - sprite_dim.y/2 <= viewport_rect.position.y) : 
			return MoveStrategy.Direction.UP

	elif (move_strategy.get_direction() == MoveStrategy.Direction.DOWN) : 
		if (position.y + sprite_dim.y/2 >= viewport_rect.size.y) : 
			return MoveStrategy.Direction.DOWN

	elif (move_strategy.get_direction() == MoveStrategy.Direction.RIGHT) : 
		if (position.x + sprite_dim.x/2 >= viewport_rect.size.x) : 
			return MoveStrategy.Direction.RIGHT
			
	return MoveStrategy.Direction.NONE

