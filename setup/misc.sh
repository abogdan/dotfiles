#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

install_apps() {

	brew_install "FFmpeg" "ffmpeg"

	brew_install "Git" "git"

	brew_install "Yarn" "yarn"

	brew_install "MidnightCommander" "mc"

    brew_install "tmux" "tmux"
    brew_install "tmux (pasteboard)" "reattach-to-user-namespace"
    
    brew_install "Web Font Tools: TTF/OTF → WOFF (Zopfli)" "sfnt2woff-zopfli" "bramstein/webfonttools"
    brew_install "Web Font Tools: TTF/OTF → WOFF" "sfnt2woff" "bramstein/webfonttools"
    brew_install "Web Font Tools: WOFF2" "woff2" "bramstein/webfonttools"

    brew_install "ShellCheck" "shellcheck"

    brew_install "ImageMagick" "imagemagick --with-webp"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Miscellaneous\n\n"

    install_apps
    printf "\n"
    brew_cleanup

}

main