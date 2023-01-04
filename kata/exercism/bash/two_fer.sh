two_fer() {
  if [ $# -gt 0 ] && [ -n "$1" ]; then
    echo "One for ${1}, one for me."
  else
    echo "One for you, one for me."
  fi

  # echo "One for ${1:-you}, one for me."
}

two_fer "$@"
