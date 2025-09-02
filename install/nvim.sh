# --meta--
# name: neovim 
# desc: text editor. 
# deps: git, base-devel, cmake, ninja, curl, git
# source: https://github.com/neovim/neovim
# --meta--

ROOT_DIR="$TEMP_DIR/nvim"

git clone --depth 1 https://github.com/neovim/neovim "$ROOT_DIR"
cd $ROOT_DIR 

make CMAKE_BUILD_TYPE=Release
sudo make install
