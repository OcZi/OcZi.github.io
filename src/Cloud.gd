class_name Cloud extends CharacterBody2D

# Same thing of Enemy.gd
@onready var sprite : Sprite2D = $Sprite2D

func install(s : Sprite2D, _ignored):
	sprite.set_texture(s.get_texture())
	sprite.region_enabled = true
	sprite.set_region_rect(s.get_region_rect())
	sprite.position = position

func _process(_delta):
	set_velocity(Global.speed_background)
	move_and_slide()
