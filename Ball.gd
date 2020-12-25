extends KinematicBody2D

var velocity = Vector2(0,0)
var sidespeed = 70;
var verticalspeed = 50;
var resetsidespeed = 70;
var resetverticalspeed = 50;
var coins = 0;

func _physics_process(delta):
	velocity.y = lerp(verticalspeed, 0, 0.2);
	if Input.is_action_pressed("right"):
		velocity.x = lerp(sidespeed, 0, 0.1);
		sidespeed = sidespeed+2
	if Input.is_action_pressed("left"):
		velocity.x = lerp(-sidespeed, 0, 0.1);
		sidespeed = sidespeed+2;
	if Input.is_action_pressed("up"):
		
		velocity.y = lerp(-verticalspeed, 0, 0.1);
		verticalspeed = (verticalspeed+2)
	if Input.is_action_just_released("up"):
		verticalspeed = resetverticalspeed;
	if Input.is_action_just_released("right"):
		sidespeed = resetsidespeed;
		print(velocity.x);
		velocity.x = lerp(0, 0, 0.9)
	if Input.is_action_just_released("left"):
		sidespeed = resetsidespeed;
		while(velocity.x < -0.2):
			velocity.x = velocity.x*0.2
	if Input.is_action_pressed("down"):
		print("down")
		velocity.y = lerp(verticalspeed, 0, 0.2);
		verticalspeed = verticalspeed+10;
		print(velocity.y)
	if Input.is_action_just_released("down"):
		velocity.y = resetverticalspeed;
		
	
	
	move_and_slide(velocity);

		


func _on_Fallzone_body_entered(body):
	print("Body has enetered")
	get_tree().change_scene("res://GameOver.tscn");
	
func add_coin():
	coins = coins+1;
	if(coins == 4):
		get_tree().change_scene("res://GameOver.tscn")


func _on_coin_collected():
	pass # Replace with function body.
