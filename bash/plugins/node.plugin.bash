
# Node
export NODE_PATH="/usr/local/lib/node_modules"


npmls() {
    npm ls "$@" | grep "^[└├]" | sed "s/─┬/──/g"
}
