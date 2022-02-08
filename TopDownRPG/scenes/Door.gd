extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#$Wall.visible = true
	pass # Replace with function body.

func _process(delta):
	pass

func _on_DetectionArea_body_entered(body):
	if body.is_in_group("Player"):
		$Wall.position.x -= 64
	pass # Replace with function body.


func _on_DetectionArea_body_exited(body):
	if body.is_in_group("Player"):
		$Wall.position.x += 64
	pass # Replace with function body.
