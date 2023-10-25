#!/bin/bash
set -o errexit
set -o errtrace
set -o nounset

# shellcheck disable=SC2154
trap '_es=${?};
    _lo=${LINENO};
    _co=${BASH_COMMAND};
    echo "${0}: line ${_lo}: \"${_co}\" exited with a status of ${_es}";
    exit ${_es}' ERR

# https://en.wikipedia.org/wiki/ANSI_escape_code
E0="$(printf "\e[0m")"        # reset
E30="$(printf "\e[30m")"      # black foreground
E97="$(printf "\e[97m")"      # bright white foreground
E100="$(printf "\e[100m")"    # bright black (gray) background
E107="$(printf "\e[107m")"    # bright white background


#### FUNCTIONS ################################################################


header() {
    # Print 80 character wide black on white heading with time
    printf "${E30}${E107} %-71s$(date '+%T') ${E0}\n" "${@}"
}


pandoc_with_options() {
    local _input _lang _output _title _toc_title
    _input="${1}"
    _lang="${2}"
    _title="${3}"
    _toc_title="${4}"
    _output="${5}"
    _mod_date="$(TZ=UTC date -r "${_input}" '+%F %T %Z')"
    print_var _input
    print_var _lang
    print_var _title
    print_var _toc_title
    print_var _output
    print_var _mod_date
    # pandoc options are ordered the same as: https://pandoc.org/MANUAL.html
    pandoc \
        --from markdown \
        --to html5 \
        --output "${_output}" \
        --verbose \
        --metadata lang="${_lang}" \
        --metadata title="${_title}" \
        --template template.html \
        --variable lastmodified:"${_mod_date}" \
        --variable toc_title:"${_toc_title}" \
        --eol=lf \
        --wrap=auto \
        --columns=79 \
        --toc \
        --toc-depth 4 \
        --ascii \
        --email-obfuscation javascript \
        "${_input}"
}


print_key_val() {
    printf "${E97}${E100}%12s${E0} %s\n" "${1}:" "${2}"
}


print_var() {
    print_key_val "${1}" "${!1}"
}


#### MAIN #####################################################################


header 'Building English FAQ HTML'
pandoc_with_options faq-en.md en-US 'Frequently Asked Questions' \
    'Table of contents' faq/index.html
echo

header 'Building French FAQ HTML'
pandoc_with_options faq-fr.md fr 'Foire Aux Questions' 'Table des matières' \
    faq/fr/index.html
echo
