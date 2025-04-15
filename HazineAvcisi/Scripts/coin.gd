extends Area2D
var skorDegeri = 1


func _ready():
	$AnimatedSprite.play("coin_move")
	pass



func _on_coin_body_entered(body):
	if body.name == "Player":
		Global.playerData.skor += skorDegeri
		
		# mevcut script çalıştığı düğümü sahneden siler
		queue_free()
	pass
