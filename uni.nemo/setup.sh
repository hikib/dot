#!/usr/bin/env bash

mkdir -p "${HOME}/.local/share/nemo/actions"
THISDIR=$(dirname "$(readlink -f "$0")")

for ACTION in "${THISDIR}"/*action; do
    ln -svf "${ACTION}" "${HOME}/.local/share/nemo/actions/$(basename "$ACTION")"
done
