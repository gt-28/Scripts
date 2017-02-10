readme_cd() {
    builtin cd "$@" && { [ ! -f .readme ] || cat .readme 1>&2; }
}

alias cd=readme_cd
