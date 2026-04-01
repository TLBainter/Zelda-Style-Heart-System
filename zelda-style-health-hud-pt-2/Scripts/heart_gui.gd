#region DETAILS==============#
class_name HeartGUI
extends Panel
#endregion DETAILS==============#

#region VARIABLES==============#
@export_category("Heart Components")
@export var sprite : TextureRect
@export var flash_anim : AnimationPlayer
@export var pulse_anim : AnimationPlayer
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

##Causes the heart to flash
func flash(flash_state : bool):
	if not flash_anim:
		return
	if flash_state:
		if flash_anim and flash_anim.current_animation != "heart_flash":
			flash_anim.play("heart_flash")
		elif flash_anim.is_playing() or sprite.modulate != Color.WHITE:
			sprite.modulate = Color.WHITE
			flash_anim.stop()

##Causes the heart to pulse
func pulse(pulse_state : bool):
	if not pulse_anim:
		return
	if pulse_state:
		if pulse_anim and pulse_anim.current_animation != "heart_pulse":
			pulse_anim.play("heart_pulse")
	elif pulse_anim.is_playing or sprite.scale != Vector2.ONE:
		sprite.scale = Vector2.ONE
		pulse_anim.play("RESET")
	

#endregion FUNCTIONS==============#
