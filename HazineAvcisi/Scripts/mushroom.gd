extends Area2D


func _ready():
	pass 



func _on_mushroom_body_entered(body):
		if body.name == "Player":
			$AnimatedSprite.play("mush_attack") 
			body.gameOver()
			pass 
