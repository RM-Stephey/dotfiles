#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# For Rofi Beats to play online Music or Locally save media files

# Directory local music folder
mDIR="$HOME/Music/"

# Directory for icons
iDIR="$HOME/.config/swaync/icons"

# Online Stations. Edit as required
declare -A online_music=(
["DI.FM - PsyChill 🍦🎶"]="http://prem1.di.fm:80/psychill_hi?e075e74ba712d11ffe"
["DI.FM - Future Synthpop ðŸŽµ"]="http://prem1.di.fm:80/futuresynthpop_hi?e075e74ba712d11ffe"
["DI.FM - Electronic Pioneers ðŸŽµ"]="http://prem1.di.fm:80/electronicpioneers_hi?e075e74ba712d11ffe"
["DI.FM - LoFi Lounge & Chill 🍦🎶"]="http://prem4.di.fm:80/lofiloungenchill_hi?e075e74ba712d11ffe"
["DI.FM - Vocal Lounge ðŸŽµ"]="http://prem1.di.fm:80/vocallounge_hi?e075e74ba712d11ffe"
["DI.FM - Jazz House 🏠"]="http://prem4.di.fm:80/jazzhouse_hi?e075e74ba712d11ffe"
["DI.FM - Electro Swing ðŸŽµ"]="http://prem1.di.fm:80/electroswing_hi?e075e74ba712d11ffe"
["DI.FM - EDM Festival ðŸŽµ"]="http://prem4.di.fm:80/mainstage_hi?e075e74ba712d11ffe"
["DI.FM - Synthwave ðŸŽµ"]="http://prem1.di.fm:80/synthwave_hi?e075e74ba712d11ffe"
["DI.FM - Trap ðŸŽµ"]="http://prem1.di.fm:80/trap_hi?e075e74ba712d11ffe"
["DI.FM - Vocal Trance 🍥"]="http://prem1.di.fm:80/vocaltrance_hi?e075e74ba712d11ffe"
["DI.FM - Club Hits (Slavic) ðŸŽµ"]="http://prem4.di.fm:80/russianclubhits_hi?e075e74ba712d11ffe"
["DI.FM - Hardstyle ðŸŽµ"]="http://prem1.di.fm:80/hardstyle_hi?e075e74ba712d11ffe"
["DI.FM - Big Room House 🏠"]="http://prem4.di.fm:80/bigroomhouse_hi?e075e74ba712d11ffe"
["DI.FM - 00s Club Hits ðŸŽµ"]="http://prem1.di.fm:80/00sclubhits_hi?e075e74ba712d11ffe"
["DI.FM - Vocal House 🏠"]="http://prem4.di.fm:80/vocalhouse_hi?e075e74ba712d11ffe"
["DI.FM - Vocal Chillout 🍦🎶"]="http://prem1.di.fm:80/vocalchillout_hi?e075e74ba712d11ffe"
["DI.FM - Melodic Progressive ðŸŽµ"]="http://prem4.di.fm:80/melodicprogressive_hi?e075e74ba712d11ffe"
["DI.FM - LoFi Hip-Hop ðŸŽµ"]="http://prem1.di.fm:80/lofihiphop_hi?e075e74ba712d11ffe"
["DI.FM - EDM Hits ðŸŽµ"]="http://prem4.di.fm:80/edm_hi?e075e74ba712d11ffe"
["DI.FM - Bass & Jackin' House 🏠"]="http://prem4.di.fm:80/bassnjackinhouse_hi?e075e74ba712d11ffe"
["DI.FM - Glitch Hop ðŸŽµ"]="http://prem1.di.fm:80/glitchhop_hi?e075e74ba712d11ffe"
["DI.FM - Classic Vocal Trance 🍥"]="http://prem1.di.fm:80/classicvocaltrance_hi?e075e74ba712d11ffe"
["DI.FM - Club Dubstep ðŸŽµ"]="http://prem1.di.fm:80/clubdubstep_hi?e075e74ba712d11ffe"
["DI.FM - Oldschool Acid ðŸŽµ"]="http://prem1.di.fm:80/oldschoolacid_hi?e075e74ba712d11ffe"
["DI.FM - DJ Mixes ðŸŽµ"]="http://prem1.di.fm:80/djmixes_hi?e075e74ba712d11ffe"
["DI.FM - Club Sounds ðŸŽµ"]="http://prem1.di.fm:80/club_hi?e075e74ba712d11ffe"
["DI.FM - Deep House 🏠"]="http://prem1.di.fm:80/deephouse_hi?e075e74ba712d11ffe"
["DI.FM - Trance 🍥"]="http://prem1.di.fm:80/trance_hi?e075e74ba712d11ffe"
["DI.FM - Epic Trance 🍥"]="http://prem4.di.fm:80/epictrance_hi?e075e74ba712d11ffe"
["DI.FM - UMF Radio ðŸŽµ"]="http://prem4.di.fm:80/umfradio_hi?e075e74ba712d11ffe"
["DI.FM - Nightcore ðŸŽµ"]="http://prem1.di.fm:80/nightcore_hi?e075e74ba712d11ffe"
["DI.FM - Soulful House 🏠"]="http://prem1.di.fm:80/soulfulhouse_hi?e075e74ba712d11ffe"
["DI.FM - House 🏠"]="http://prem4.di.fm:80/house_hi?e075e74ba712d11ffe"
["DI.FM - Funky House 🏠"]="http://prem1.di.fm:80/funkyhouse_hi?e075e74ba712d11ffe"
["DI.FM - Tech House 🏠"]="http://prem1.di.fm:80/techhouse_hi?e075e74ba712d11ffe"
["DI.FM - Gabber ðŸŽµ"]="http://prem1.di.fm:80/gabber_hi?e075e74ba712d11ffe"
["DI.FM - Electro House 🏠"]="http://prem1.di.fm:80/electrohouse_hi?e075e74ba712d11ffe"
)


# Populate local_music array with files from music directory and subdirectories
populate_local_music() {
  local_music=()
  filenames=()
  while IFS= read -r file; do
    local_music+=("$file")
    filenames+=("$(basename "$file")")
  done < <(find "$mDIR" -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.wav" -o -iname "*.ogg" -o -iname "*.mp4" \))
}

# Function for displaying notifications
notification() {
  notify-send -u normal -i "$iDIR/music.png" "Playing: $@"
}

# Main function for playing local music
play_local_music() {
  populate_local_music

  # Prompt the user to select a song
  choice=$(printf "%s\n" "${filenames[@]}" | rofi -i -dmenu -config ~/.config/rofi/config-rofi-Beats.rasi -p "Local Music")

  if [ -z "$choice" ]; then
    exit 1
  fi

  # Find the corresponding file path based on user's choice and set that to play the song then continue on the list
  for (( i=0; i<"${#filenames[@]}"; ++i )); do
    if [ "${filenames[$i]}" = "$choice" ]; then
		
	    notification "$choice"

      # Play the selected local music file using mpv
      mpv --playlist-start="$i" --loop-playlist --vid=no  "${local_music[@]}"

      break
    fi
  done
}

# Main function for shuffling local music
shuffle_local_music() {
  notification "Shuffle local music"

  # Play music in $mDIR on shuffle
  mpv --shuffle --loop-playlist --vid=no "$mDIR"
}

# Main function for playing online music
play_online_music() {
  choice=$(printf "%s\n" "${!online_music[@]}" | rofi -i -dmenu -config ~/.config/rofi/config-rofi-Beats.rasi -p "Online Music")

  if [ -z "$choice" ]; then
    exit 1
  fi

  link="${online_music[$choice]}"

  notification "$choice"
  
  # Play the selected online music using mpv
  mpv --shuffle --vid=no "$link"
}

# Check if an online music process is running and send a notification, otherwise run the main function
pkill mpv && notify-send -u low -i "$iDIR/music.png" "Music stopped" || {

# Prompt the user to choose between local and online music
user_choice=$(printf "Play from Online Stations\nPlay from Music Folder\nShuffle Play from Music Folder" | rofi -dmenu -config ~/.config/rofi/config-rofi-Beats-menu.rasi -p "Select music source")

  case "$user_choice" in
    "Play from Music Folder")
      play_local_music
      ;;
    "Play from Online Stations")
      play_online_music
      ;;
    "Shuffle Play from Music Folder")
      shuffle_local_music
      ;;
    *)
      echo "Invalid choice"
      ;;
  esac
}
