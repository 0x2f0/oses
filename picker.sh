source ./utils.sh

say_hello

item_to_install=$(grep -i "list_name:" ./install/*.sh | fzf --multi)
echo $item_to_install
