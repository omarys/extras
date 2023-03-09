#!/usr/bin/env sh

pling() {
    if [ $(($1 % 3 == 0)) ]; then
        echo "Pling"
    fi
}

plang() {
    if [ $(($1 % 5 == 0)) ]; then
        echo "Plang"
    fi
}

plong() {
    if [ $(($1 % 7 == 0)) ]; then
        echo "Plong"
    fi
}

main() {
    i=pling "$@"
    a=plang "$@"
    o=plong "$@"
    raindrops="${i} ${a} ${o}"
    if [ -z "${raindrops}" ]; then
        echo "{$1}"
    else
        echo "{$raindrops}"
    fi
}

main "$@"
