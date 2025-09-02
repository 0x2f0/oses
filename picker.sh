source ./utils.sh

say_hello
export TEMP_DIR="$HOME/temp-install"

item_to_install=$(ls ./install/)

echo $item_to_install
