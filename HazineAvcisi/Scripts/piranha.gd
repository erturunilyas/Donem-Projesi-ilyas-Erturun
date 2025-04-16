extends Area2D

func _ready():
	pass




func _on_piranha_body_entered(body):
		if body.name == "Player":
			$AnimatedSprite.play("attack") 
			body.gameOver()
			pass 
