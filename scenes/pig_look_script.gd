extends Node3D

@export var max_head_rotation : float = 180

@onready var player_marker : Marker3D = get_node("../../Player/PlayerMarker")
@onready var pig_head_marker : BoneAttachment3D = get_parent().get_node("Armature_002/Skeleton3D/BoneAttachment3D")
@onready var skeleton : Skeleton3D = get_parent().get_node("Armature_002/Skeleton3D")
#@onready var neckbone = pig_head_marker.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Make the marker look at our target
	pig_head_marker.look_at(player_marker.global_position, Vector3.UP, true)
	# Clamp head_marker rotation
	pig_head_marker.global_rotation.y = clampf(pig_head_marker.global_rotation.y, -max_head_rotation / 100, max_head_rotation / 100)
	#pig_head_marker.global_rotation.x = clampf(pig_head_marker.global_rotation.x, -max_head_rotation / 100, max_head_rotation / 100)
	# Apply rotation
	var new_rot : Quaternion = Quaternion.from_euler(pig_head_marker.global_rotation)
	skeleton.set_bone_pose_rotation(pig_head_marker.bone_idx, new_rot)
