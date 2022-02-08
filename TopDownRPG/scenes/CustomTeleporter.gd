extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"fd
export (int) var Pad1X
export (int) var Pad1Y
export (int) var Pad2X
export (int) var Pad2Y

# Called when the node enters the scene tree for the first time.
func _ready():
	$Pad1.global_position = Vector2(Pad1X, Pad1Y)
	$Pad2.global_position = Vector2(Pad2X, Pad2Y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var teleported = false 

func _on_Pad1_body_entered(body):
	if(body.is_in_group("Player")):
		if(!teleported):
			teleported = !teleported
			body.position = $Pad2/Position2D.global_position

func _on_Pad1_body_exited(body):
	teleported = false

func _on_Pad2_body_entered(body):
	if(body.is_in_group("Player")):
		if(!teleported):
			teleported = !teleported
			body.position = $Pad1/Position2D.global_position

func _on_Pad2_body_exited(body):
	teleported = false
