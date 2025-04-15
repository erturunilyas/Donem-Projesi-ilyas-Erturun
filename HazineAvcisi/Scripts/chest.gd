extends Area2D


func _ready():
	$AnimationPlayer.play("close")
	pass 
	

func _on_TriggerArea_body_entered(body):
	if body.name == "Player" and body.keySayisi == 1:
		$AnimationPlayer.play("open")
		pass
	
	pass


func _on_TriggerArea_body_exited(body):
	if body.name == "Player" and body.keySayisi == 1:
		$AnimationPlayer.play("close")
		pass
	pass 

func _on_chest_body_entered(body):
	if body.name == "Player" and body.keySayisi == 1:
		print("Level başarılı")
		body.levelBasariylaTamamlandi()
		
	pass 
