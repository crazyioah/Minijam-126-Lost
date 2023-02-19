extends Node2D

onready var timer = $Timer
onready var tilemap = $Tiles/Raft
var map_size = Vector2(20, 20)

func _ready():
	timer.start()

func _on_Timer_timeout():
	var x = rand_range(0, map_size.x - 1)
	var y = rand_range(0, map_size.y - 1)
	var tile_path = get_tile_path(x, y)
	print("Tile at position (" + str(x) + ", " + str(y) + ") has path: " + tile_path)
	timer.start()

func get_tile_path(x: int, y: int) -> String:
	var tileset = tilemap.tile_set
	var tile_id = tilemap.get_cell(x, y)
	var tile_info = tileset.get_tile_info(tile_id)
	return tile_info.texture.get_path()
