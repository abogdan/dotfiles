#!/usr/bin/env bash

declare -r GITHUB_REPOSITORY="abogdan/dotfiles"

declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/master"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/master/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare dotfilesDirectory="$HOME/projects/dotfiles"
declare skipQuestions=false

# ----------------------------------------------------------------------
# | Helper Functions                                                   |
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {

    # Ensure that the following actions
    # are made relative to this file's path.

    cd "$(dirname "${BASH_SOURCE[0]}")" \
        || exit 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Load utils

    if [ -x "utils.sh" ]; then
        . "utils.sh" || exit 1
    else
        download_utils || exit 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Ensure the OS is supported and
    # it's above the required version.

    verify_os \
        || exit 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ask_for_sudo

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if this script was run directly (./<path>/setup.sh),
    # and if not, it most likely means that the dotfiles were not
    # yet set up, and they will need to be downloaded.

    printf "%s" "${BASH_SOURCE[0]}" | grep "setup.sh" &> /dev/null \
        || download_dotfiles

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./create_symlinks.sh "$@"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./setup/run.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    ./preferences.sh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! $skipQuestions; then
        print_in_purple "\n • Restart\n\n"

	    ask_for_confirmation "Do you want to restart?"
	    printf "\n"

	    if answer_is_yes; then
	        sudo shutdown -r now &> /dev/null
	    fi
	fi

}

main "$@"
