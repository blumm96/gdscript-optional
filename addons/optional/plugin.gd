@tool
extends EditorPlugin

const custom_script := preload("optional.gd")
const icon := preload("icon.png")

func _enter_tree() -> void:
	add_custom_type("Optional", "RefCounted", custom_script, icon)


func _exit_tree() -> void:
	remove_custom_type("Optional")
