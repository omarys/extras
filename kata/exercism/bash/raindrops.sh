#!/usr/bin/env sh

pling() {
    number=$1
    if [ $((number % 3)) -eq 0 ]; then
        printf %s "Pling"
    fi
}

plang() {
    number=$1
    if [ $((number % 5)) -eq 0 ]; then
        printf %s "Plang"
    fi
}

plong() {
    number=$1
    if [ $((number % 7)) -eq 0 ]; then
        printf %s "Plong"
    fi
}

main() {
    raindrops="$(pling "$1")$(plang "$1")$(plong "$1")"
    if [ -z "${raindrops}" ]; then
        echo "$1"
    else
        echo "${raindrops}"
    fi
}

main "$@"
