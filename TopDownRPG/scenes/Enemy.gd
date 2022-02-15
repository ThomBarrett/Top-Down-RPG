extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var blood = preload("res://scenes/Blood.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("Player_Projectile"):
		var blood_spawn = blood.instance()
		blood_spawn.global_position = position
		blood_spawn.scale = blood_spawn.scale * 2
		get_parent().add_child(blood_spawn)
		queue_free()

