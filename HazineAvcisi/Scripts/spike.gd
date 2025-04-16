extends Area2D



func _ready():
	pass 

func _on_spike_body_entered(body):
		if body.name == "Player":
			body.gameOver()
			pass 



