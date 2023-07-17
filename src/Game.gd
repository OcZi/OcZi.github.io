class_name Game extends Node

const enemyFactory = preload("res://scenes/enemy.tscn")

@export var start : bool = false
@export var time : int = 0
# Countdown to spawn an enemy
# First enemy always spawns after 150 delta times
@export var countdown : int = 150
@export var countdown_background : int = 200
# Enemy position spawn (outside right screen)
@export var enemy_spawn : Vector2

@export var cloud_spawn : Vector2

# All cactus texture processed
@onready var cactusTexture : Dictionary

# Player instance
@onready var player : Player = $Player

# Score timer (duration: 1 second)
@onready var scoreTimer : Timer = $ScoreTimer
# Terrain stuff (floor, clouds)
@onready var terrain : Terrain = $Terrain
# External node to catch control input after game over
@onready var end : Node = $EndTask

# Score label
@onready var label : Label = $ScoreLabel
# High score label
# Hidden by default
@onready var highScoreLabel : Label = $HighScoreLabel
# Game over label
# Hidden by default
@onready var game_over : Label = $GameOverLabel
@onready var start_label : Label = $StartLabel
# Score audio (played every 100 scores)
@onready var score_audio : AudioStreamPlayer2D = $ScoreAudio

# Random instance
@onready var random : RandomNumberGenerator

@onready var score_base_str : String
@onready var hi_base_str : String
var post_game : bool = false

func _ready():
	Global.init()
	score_base_str = label.text
	hi_base_str = highScoreLabel.text
	updateScoreLabel()
	

func _process(_delta):
	if not start or game_over.visible:
		return
	
	countdown -= 1
	countdown_background -= 1
	if countdown <= 0:
		terrain.randomCactus()
		countdown = Global.random.randi_fixed()
	if countdown_background <= 0:
		terrain.randomCloud()
		countdown_background = Global.random_background.randi_fixed()

func updateScoreLabel() -> void :
	if Global.last_score > 0:
		if !highScoreLabel.visible:
			highScoreLabel.visible = true
		highScoreLabel.set_text(hi_base_str % Global.last_score)
	if Global.debug:
		var count = 0
		for node in get_children():
			if node is Enemy:
				count += 1
		label.set_text(score_base_str % count)
	else:
		label.set_text(score_base_str % time)

func stop():
	terrain.stop()
	scoreTimer.stop()
	print("Score: ", time)
	game_over.visible = true
	get_tree().paused = true
	
	end.set_catch_input(true)
	Global.last_score = time

func _on_Player_collide():
	stop()

func _on_ScoreTimer_timeout():
	time += 1
	if time % 100 == 0:
		score_audio.play()
		Global.speedUp()
	updateScoreLabel()

func _on_Player_start():
	start = true
	start_label.visible = false
	terrain.start()
	scoreTimer.start()

func _on_DespawnArea_body_exited(body):
	if body is Enemy or body is Cloud:
		# print("deferring ", body.name)
		body.get_parent().call_deferred("remove_child", body)
