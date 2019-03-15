#!/bin/bash
set -o errexit
set -o errtrace
set -o nounset

trap '_es=${?};
    _lo=${LINENO};
    _co=${BASH_COMMAND};
    echo "${0}: line ${_lo}: \"${_co}\" exited with a status of ${_es}";
    exit ${_es}' ERR


DATE=$(date -u '+%F %T %Z')


pandoc --from markdown --to html5 --ascii \
    --toc --toc-depth 4 \
    --email-obfuscation javascript \
    --template template.html \
    --variable pagetitle:'Frequently Asked Questions' \
    --variable title:'Frequently Asked Questions' \
    --variable lastmodified:"${DATE}" \
    --output faq/index.html faq-en.md

pandoc --from markdown --to html5 --ascii \
    --toc --toc-depth 4 \
    --email-obfuscation javascript \
    --template template.html \
    --variable pagetitle:'Foire Aux Questions' \
    --variable title:'Foire Aux Questions' \
    --variable lastmodified:"${DATE}" \
    --variable toctitle:'Table des matières' \
    --output faq/fr/index.html faq-fr.md
