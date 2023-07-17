class_name Terrain
extends Node

const cloudFactory = preload("res://scenes/cloud.tscn")
const cactusFactory = preload("res://scenes/enemy.tscn")

@onready var cactusTextures : Dictionary
@onready var cloudTextures : Dictionary
@onready var cactusTileMap : TileMap = $TileCactusMap
@onready var cloudsTileMap : TileMap = $TileCloudMap

@onready var _floor = $Floor/Background

@onready var cactusSpawn : Vector2
@onready var cloudSpawn : Vector2

func _ready():
	cactusTextures = Global.getAllSprites(cactusTileMap)
	cloudTextures = Global.getAllSprites(cloudsTileMap)
	cactusSpawn = get_parent().enemy_spawn
	cloudSpawn = get_parent().cloud_spawn

func start() -> void :
	_floor.start = true
	
func stop() -> void :
	_floor.start = false

func randomCloud() -> void :
	spawnRandom(cloudSpawn, cloudTextures, cloudFactory)

func randomCactus() -> void:
	spawnRandom(cactusSpawn, cactusTextures, cactusFactory)

func spawnRandom(spawn: Vector2, textures, factory) -> void:
	var index = Global.random.randi_range(0, textures.size() - 1)
	var data = textures.values()[index]
	
	var entity = factory.instantiate()
	add_child(entity)
	entity.position = spawn
	entity.install(data[0], data[1])
	entity.z_index = -1
