extends Node3D

signal pidgeon_hit
var velocity = Vector3.ZERO

func _on_area_3d_body_entered(body):
	pidgeon_hit.emit()
	velocity = Vector3(randf_range(-1, 1), randf_range(0, 1), randf_range(-1,1))
	velocity = velocity.normalized()
	var quat = Quaternion(Vector3(1, 0, 0), velocity)
	velocity *= 3
	rotation = quat.get_euler()

func _process(delta):
	position += velocity * delta
	