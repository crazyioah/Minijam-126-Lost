extends Node2D

onready var tilemap = $Tiles/Raft
var map_size = Vector2(20, 20)




func _on_Timer_timeout():
	for x in range(map_size.x):
		for y in range(map_size.y):
			if randf() < 0.2:
				tilemap.set_cell(x, y, randi() % tilemap.tile_set.tile_count)
