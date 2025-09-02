say_hello() {
    echo "
        Welcome, to the setup script written by Me 
        for setting up the tools that I often use. 
        Me: Saroj Regmi; sarojregmi.sh
        "
}

create_input() {
  if [ -n "$1" ]; then
    echo "No input Name provided."
  fi
}

get_cursor_pos() {
    # Ask terminal for cursor position (ESC [ 6 n)
    echo -ne "\033[6n" > /dev/tty

    # Read response: ESC [ row ; col R
    IFS=';' read -sdR -p '' row col < /dev/tty

    # Strip the leading ESC[
    row=${row#*[}
    echo "$row $col"
}

# write a function to move the cursor to the given position if provided
# Modify it to do so.
move_cursor_x_y() {
   x=$1
   y=$2

   if [[ -z $x && -z $y ]];then 
     return 0
   fi

  tput cup $y $x
}

# Waits till provided pid is completed. 
spinner() {
  local pid
  pid=$1

  cols=$2
  rows=$3

  if [[ -z $pid ]];then
    echo "pid must be provided for the spinner to work"
    exit 0
  fi

  frames=( "⣾" "⣽" "⣻" "⢿" "⡿" "⣟" "⣯" "⣷ ")

  while kill -0 "$pid" 2>/dev/null;do
    for string in ${frames[@]}; do
      center_cursor
      echo $string 
      sleep 0.1
    done
  done
}

get_cursor_pos
