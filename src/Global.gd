extends Node

const RANDI_MIN : int = 100
const RANDI_MAX : int = 200

const MIN_SPEED : int = -100
const MAX_SPEED : int = -300
const MAX_BACKGROUND_SPEED : int = -100
const MIN_BACKGROUND_SPEED : int = -15

const BACKGROUND_COLOR : Color = Color("ececec")

# Random number generator for general entites
var random : RNGFixed
# Random number generator for background stuff
var random_background : RNGFixed
# Global speed for all entities
var speed : Vector2 = Vector2(-100, 0)
# Global speed for background stuff
var speed_background : Vector2 = Vector2(-100, 0)
# Last score from previous game
var last_score : int = 0
# Activate debug mode
var debug : bool = false

func init():
	randomize()
	random = RNGFixed.new(RANDI_MIN, RANDI_MAX)
	random_background = RNGFixed.new(RANDI_MIN * 4, RANDI_MAX * 5)
	speed = Vector2(MIN_SPEED, 0)
	speed_background = Vector2(MIN_BACKGROUND_SPEED, 0)

# Get all sprites of a TileMap.
# Returns a Dictionary <int, (Sprite2D, PackedVector2Array)>
func getAllSprites(map : TileMap) -> Dictionary :
	var tileSet : TileSet = map.tile_set
	# Cache sprite of tile
	var dict : Dictionary = {}
	
	for sourceI in range(tileSet.get_source_count()):
		var id = tileSet.get_source_id(sourceI)
		var source : TileSetAtlasSource = tileSet.get_source(id)
		for index in range(source.get_tiles_count()):
			var coords : Vector2i = source.get_tile_id(index)
			var region = source.get_tile_texture_region(coords)
			var sprite = Sprite2D.new()

			sprite.texture = source.get_texture()
			sprite.region_enabled = true
			sprite.set_region_rect(region)

			var data : TileData = source.get_tile_data(coords, 0) # Always get first alt
			var polygon : PackedVector2Array
			if tileSet.get_physics_layers_count() == 0:
				polygon = PackedVector2Array()
			else:
				polygon = data.get_collision_polygon_points(0, 0)
			dict[dict.size() + 1] = [sprite, polygon]
	return dict

func speedUp() -> void:
	if speed.x == MAX_SPEED:
		return
	
	speed.x = clamp(MAX_SPEED, maximize(speed.x, 10), MIN_SPEED)
	speed_background.x = clamp(MAX_BACKGROUND_SPEED, maximize(speed_background.x, 5), MIN_BACKGROUND_SPEED)
	random.maximum = minimize(random.maximum, 11)
	random.minimum = minimize(random.minimum, 11)
	
	random_background.maximum = minimize(random_background.maximum, 5)
	random_background.minimum = minimize(random_background.minimum, 5)

# Succession formula to maximize/minimze a percentage of a number
func minimize(p_speed, percentage):
	var decimal = 1.0 + (percentage / 100.0)
	return p_speed / decimal

func maximize(p_speed, percentage):
	var percent : float = (percentage / 100.0)
	var decimal : float = p_speed * percent
	return p_speed + decimal
