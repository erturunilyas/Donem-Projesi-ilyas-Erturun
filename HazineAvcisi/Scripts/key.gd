extends Area2D



func _ready():
	pass 




func _on_key_body_entered(body):
	if body.name == "Player":
		print("Key alındı.")
		body.keySayisi += 1
		print("Key Sayısı:"+str(body.keySayisi))

		queue_free()
		
	pass 
