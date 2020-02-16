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
	move_strategy = RandomMoveStrategy.new()
	#Exit app
	#get_tree().quit()
	
func _process(_delta):
	
	sprite_pos = Vector2(get_transform().x.x, get_transform().y.y)
	move_strategy.update()
	viewport_transform = get_owner().get_transform()
	#print ("Number = " + str (Sprite_direction))
	var t:Transform2D = get_transform()
	Sprite_y.set_text("y : " + str(t.origin.y))
	Sprite_x.set_text("x : " + str(t.origin.x))
	#print ("sprite_pos.x = " + str (t.origin.x) + " sprite_pos.y = " + str (t.origin.y))
#--------------------------------------------------------------------------#
	if (move_strategy.get_direction() == MoveStrategy.Direction.RIGHT) : 
		if sprite_pos.x + sprite_dim.x <= viewport_rect.size.x : 
			t.origin.x = move_strategy.move(sprite_pos).x
		else:
			#---- Detect collision with RIGHT side ----
			move_strategy.edge_hit(MoveStrategy.Direction.RIGHT)
			#t.origin.x -= speed
#---------------------------------------------------------------#
	elif (move_strategy.get_direction() == MoveStrategy.Direction.LEFT) : 
		if sprite_pos.x + sprite_dim.x <= viewport_rect.size.x : 
			t.origin.x = move_strategy.move(sprite_pos).x
		else:
			#---- Detect collision with LEFT side ----
			move_strategy.edge_hit(MoveStrategy.Direction.LEFT)
			#t.origin.x += speed
#---------------------------------------------------------------#
	elif (move_strategy.get_direction() == MoveStrategy.Direction.DOWN) : 
		if sprite_pos.x + sprite_dim.x <= viewport_rect.size.x : 
			t.origin.x = move_strategy.move(sprite_pos).x
		else:
			#---- Detect collision with DOWN side ----
			move_strategy.edge_hit(MoveStrategy.Direction.DOWN)
			#t.origin.y += speed
#---------------------------------------------------------------#		
	elif (move_strategy.get_direction() == MoveStrategy.Direction.UP) : 
		if sprite_pos.x + sprite_dim.x <= viewport_rect.size.x : 
			t.origin.x = move_strategy.move(sprite_pos).x
		else:
			#---- Detect collision with UP side ----
			move_strategy.edge_hit(MoveStrategy.Direction.UP)
			#t.origin.y -= speed
#---------------------------------------------------------------#
	set_transform(t)
	update()

