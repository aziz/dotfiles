
function npmls() {
    npm ls "$@" | grep "^[└├]" | sed "s/─┬/──/g"
}
