extends Sprite

var random = RandomNumberGenerator.new()
const STEP_SIZE = 100
var step = STEP_SIZE
var speed = 1.0

#onready var Slider_step = $"/root/Sprite_move/VBoxContainer/Slider_step"
onready var step_value = $"/root/Sprite_move/VBoxContainer/step_value"
onready var speed_value = $"/root/Sprite_move/VBoxContainer/speed_value"
onready var Sprite_x = $"/root/Sprite_move/VBoxContainer2/Sprite_y"
onready var Sprite_y = $"/root/Sprite_move/VBoxContainer2/Sprite_x"
 # ex : $"/root/Pigmint/View/Menus/MainMenu/FileSubmenu"

var sprite_dim:Vector2 = get_rect().size

var sprite_pos:Vector2 = Vector2(0,0) 

var viewport_rect:Rect2 = Rect2(Vector2.ZERO, Vector2.ZERO)
var viewport_transform:Transform2D = Transform2D(Vector2.ZERO, Vector2.ZERO, Vector2.ZERO)

var viewport_x = 0
var viewport_y = 0


enum Direction{ 
UP = 0,
LEFT = 1,
DOWN = 2,
RIGHT = 3
}
var Sprite_direction = Direction.UP

func _ready():
	viewport_rect = get_viewport().get_visible_rect()
	viewport_transform = get_owner().get_transform()
	print ("Window width : " + str(viewport_rect.size.x) + " Window height : " + str(viewport_rect.size.y))
	print ("Window x : " + str(viewport_rect.position.x) + " Window y : " + str(viewport_rect.position.y))
	#Exit app
	#get_tree().quit()
	
func _process(_delta):
	
	sprite_pos = Vector2(get_transform().x.x, get_transform().y.y)
	if (step == 0):
		Sprite_direction = random.randi_range(0,3)
		step = STEP_SIZE
	else :
		step -=1
		
	viewport_transform = get_owner().get_transform()
	
	
	#print ("Number = " + str (Sprite_direction))
	var t:Transform2D = get_transform()
	Sprite_y.set_text("y : " + str(t.origin.y))
	Sprite_x.set_text("x : " + str(t.origin.x))
	#print ("sprite_pos.x = " + str (t.origin.x) + " sprite_pos.y = " + str (t.origin.y))
#--------------------------------------------------------------------------#
	if (Sprite_direction == Direction.RIGHT) : 
		if sprite_pos.x + sprite_dim.x <= viewport_rect.size.x :
			t.origin.x += speed
		else:
			Sprite_direction  = Direction.LEFT
			t.origin.x -= speed
		
#---------------------------------------------------------------#
	elif (Sprite_direction == Direction.LEFT) :
		if sprite_pos.x - sprite_dim.x >= viewport_rect.position.x :
			t.origin.x -= speed 
		else:
			Sprite_direction  = Direction.RIGHT
			t.origin.x += speed
#---------------------------------------------------------------#
	elif (Sprite_direction == Direction.DOWN) :
		#print ("DOWN") 
		#print ("sprite pos y : " +str(t.origin.y))
		#print ("sprite sum y : " +str(t.origin.y + sprite_dim.y))
		#print ("Viewport y position : " +str(viewport_rect.position.y))
		if t.origin.y + sprite_dim.y >= viewport_rect.position.y :
			t.origin.y += speed 
		else:
			Sprite_direction  = Direction.UP
			t.origin.y -= speed
#---------------------------------------------------------------#		
	elif (Sprite_direction == Direction.UP) :
		#print ("UP")
		#print ("sprite dim y : " +str(sprite_dim.y))
		#print ("Viewport y size : " +str(viewport_rect.size.y))
		#print ("sprite pos y : " +str(t.origin.y))
		#print ("sprite sum y : " +str(t.origin.y + sprite_dim.y))
		
		if t.origin.y - sprite_dim.y <= viewport_rect.size.y :
			t.origin.y -= speed 
		else:
			Sprite_direction  = Direction.DOWN
			t.origin.y += speed
#---------------------------------------------------------------#
	set_transform(t)
	update()


func _on_Slider_step_value_changed(value):
	
	#print("bite : " + str (value))
	step_value.set_text( "Step : " + str(value))
	step = value



func _on_Slider_speed_value_changed(value):
	speed_value.set_text( "Speed : " + str(value))
	speed = value
	
