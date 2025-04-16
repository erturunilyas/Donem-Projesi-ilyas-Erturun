extends Area2D

func _ready():
	$AnimatedSprite.play("stand") # Başlangıçta beklemede olsun

func _on_attack_trigger_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite.play("attack")
		body.gameOver() # oyuncuya hasar verme işlemin varsa burası

func _on_attack_trigger_body_exited(body):
	if body.name == "Player":
		$AnimatedSprite.play("stand")


func _on_skulwolf_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite.play("attack")
		


func _on_skulwolf_body_exited(body):
	if body.name == "Player":
		$AnimatedSprite.play("stand")
