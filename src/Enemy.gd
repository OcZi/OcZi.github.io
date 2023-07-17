class_name Enemy extends CharacterBody2D

@onready var sprite : Sprite2D = $Sprite2D
@onready var shape : CollisionPolygon2D = $Shape2D

func install(s : Sprite2D, polygon : PackedVector2Array):
	sprite.set_texture(s.get_texture())
	sprite.region_enabled = true
	sprite.set_region_rect(s.get_region_rect())
	sprite.position = position
	
	# After six months of testing godot 4
	# while the school they were killing me
	# I finally found a propertly way to centered the shape collision
	# like godot 3 by sprite.pos + sprite size / 2 ...
	shape.position = position + (sprite.get_rect().size / 2)
	shape.set_polygon(polygon)

func _process(_delta):
	set_velocity(Global.speed)
	move_and_slide()
