# --meta--
# name: fzf (fuzzy finder)
# desc: general purpose fuzzy finder.
# deps: git 
# source: https://github.com/junegunn/fzf.git
# --meta--

git clone --depth 1 https://github.com/junegunn/fzf.git "$TEMP_DIR/fzf"

$TEMP_DIR/fzf/.fzf/install
