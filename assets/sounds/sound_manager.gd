extends Node
# håndterer lyd i spillet

# INFO
# hvis du skal spille en lyd i en scene call funksjonen til lyden som så:
#	SoundManager.test()

func _ready():
	print('sound manager loaded')

func test(): # for testing
	print('SoundManager test 🎵')

func play_background_music(track_to_play):
	# stopper andre bakgrunnsmusikk for å unngå at de spilles samtidig
	# restarter ikke musikken hvis track_to_play alerede spilles
	for track in $BackgroundMusic.get_children():
		if track.playing and track != track_to_play:
			track.stop()
		elif track == track_to_play and not track.playing:
			track.play()

func adjust_music_volume(value):
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("music"),
		linear_to_db(value)
	)
	print('music volume set to ', value)

func adjust_sound_effect_volume(value):
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("sfx"),
		linear_to_db(value)
	)
	print('SFX volume set to ', value)

func button():
	$SoundEffects/ButtonClick.play()

func skade_piano():
	$SoundEffects/SkadePiano.play()

func play_background_menu():
	play_background_music($BackgroundMusic/MenuTrack)

func play_background_forest():
	play_background_music($BackgroundMusic/ForestTrack)
