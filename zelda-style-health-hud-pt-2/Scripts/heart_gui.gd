#region DETAILS==============#
class_name HeartGUI
extends Panel
#endregion DETAILS==============#

#region VARIABLES==============#
@export_category("Heart Components")
@export var sprite : TextureRect
@export_category("Heart Images")
##Full heart
@export var sprite_4_4_heart : AtlasTexture
##3/4 heart
@export var sprite_3_4_heart : AtlasTexture
##half heart
@export var sprite_2_4_heart : AtlasTexture
##1/4 heart
@export var sprite_1_4_heart : AtlasTexture
##empty heart
@export var sprite_0_4_heart : AtlasTexture
#endregion VARIABLES==============#

#region FUNCTIONS==============#
##Updates the value of a heart based on its fill rate
func update(update_value : int):
	update_value = clampi(update_value, 0, 4)
	match update_value:
		0: sprite.texture = sprite_0_4_heart
		1: sprite.texture = sprite_1_4_heart
		2: sprite.texture = sprite_2_4_heart
		3: sprite.texture = sprite_3_4_heart
		4: sprite.texture = sprite_4_4_heart
#endregion FUNCTIONS==============#
