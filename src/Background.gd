extends ParallaxBackground

# Godot 4 needs a multiplier
# to have the same speed as the enemies
const WEIRD_GODOT4_SPEED = 3.50

@onready var start : bool
@onready var sprite : Sprite2D = $Layer/Sprite2D

func _ready():
	sprite.modulate = Global.BACKGROUND_COLOR

func _process(delta):
	if !start:
		return
	
	scroll_base_offset.x -= -Global.speed.x * delta * WEIRD_GODOT4_SPEED
