extends KinematicBody2D

var velocity = Vector2()
export (int) var speed
var collided = false
 
# Called when the node enters the scene tree for the first time.
func _ready():
	$EmoteBubble.hide()
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input(delta)
	move_and_slide(velocity * delta)
	cast()

func get_input(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed
	if Input.is_action_pressed("cam_out"):
		if $Camera2D.get_zoom().x > 0.5:
			$Camera2D.set_zoom($Camera2D.get_zoom() - Vector2(0.5,0.5) * delta)
	if Input.is_action_pressed("cam_in"):
		if $Camera2D.get_zoom().x < 2.5:
			$Camera2D.set_zoom($Camera2D.get_zoom() + Vector2(0.5,0.5) * delta)

func cast():
	if $RayCast2D.is_colliding() && collided == false:
		print("PLOP")
		collided = true
		print($RayCast2D.get_collider())
		if $RayCast2D.get_collider().is_in_group("Wall") == true:
			$EmoteBubble.display(6)
			print("Wall")
		if $RayCast2D.get_collider().is_in_group("Item") == true:
			$EmoteBubble.display(21)
			print("Item")
	
	if !$RayCast2D.is_colliding() && collided == true:
		collided = false

