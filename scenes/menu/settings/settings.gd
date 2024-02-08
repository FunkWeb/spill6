extends Node
# instillinger til spillet

# slidere for musikk of lydeffekter
# annet??

func _ready():
	print("settings loaded")
	# henter lydnivå fra audio bus så sliderene viser riktig verdi
	$MusicSlider.value = db_to_linear(
		AudioServer.get_bus_volume_db(
			AudioServer.get_bus_index("music")
		)
	)
	$SfxSlider.value = db_to_linear(
		AudioServer.get_bus_volume_db(
			AudioServer.get_bus_index("sfx")
		)
	)

func _on_close_button_pressed():
	$".".queue_free()

func _on_music_slider_value_changed(value):
	SoundManager.adjust_music_volume(value)

func _on_sound_effect_slider_value_changed(value):
	SoundManager.adjust_sound_effect_volume(value)