#!/usr/bin/env bash
# Copyright (C) 2021 Bart De Roy
set -o pipefail -o errexit
synopsis="$BASH_SOURCE [-h] [-n N] [-i FILE] NAME"
OPTS="hn:i:"
purpose="Zet markdown bestanden klaar met vorige/volgende links voor je stappenplan. Afbeeldingen en text worden uit het gegeven pdf bestand gehaald als pdftotext en pdfimages geïnstalleerd zijn."
declare -A options
options=(\
  ['-h']="toon help" \
  ['-n']="aantal stappen" \
  ['-i']="invoer pdf bestand" \
)

usage () {
  >&2 echo "synopsis" "$synopsis"
  for opt in ${!options[@]}; do
    >&2 echo -e "\t${opt}\t${options[$opt]}"
  done
}
show_help () {
  echo "synopsis" "$synopsis"
  echo "$purpose"
  for opt in ${!options[@]}; do
    >&2 echo -e "\t${opt}\t${options[$opt]}"
  done
}

# print when the user invokes a program with either:
# - the wrong number of command-line arguments
# - invalid command-line arguments
trap '[[ "$?" -gt 0 ]] && usage' EXIT
trap 'exit 1' ERR

if [[ $# -ge 1 ]]; then
  OPTIND=1
  while getopts $OPTS opt; do
    case "$opt" in
      h) show_help
        ;;
      i) [[ -f "$OPTARG" ]] && input="$OPTARG" || \
        >&2 echo "dit is geen bestand: $OPTARG"
        ;;
      n) (( $OPTARG )) && number=$OPTARG
        ;;
      *) >&2 echo "dit is geen optie: $opt"
        ;;
    esac
  done
fi
shift $((OPTIND-1))
[[ $1 == "--" ]] && shift
[[ $number ]] || number=1

[[ $# -ge 1 ]] && name="$1"

if [[ $name ]]; then
  mkdir -p "$name"
  echo -e "# $name\n\n![](../img/$name.png)\n\n[Terug](../) [Stap 1 →](1.html)" > "$name"/index.md
  for index in `seq $number`; do
    if (( index == number )); then
      echo -e "# \n\n\n[← Stap $((index - 1))]($((index - 1)).html) [Terug](../)" > "$name"/$index.md
    elif (( index == 1 )); then
      echo -e "# \n\n\n[Overzicht](index.html) [Stap $((index + 1)) →]($((index + 1)).html)" > "$name"/$index.md
    else
      echo -e "# \n\n\n[← Stap $((index - 1))]($((index - 1)).html) [Stap $((index + 1)) →]($((index + 1)).html)" > "$name"/$index.md
    fi
  done
  if [[ $input ]]; then
    mkdir -p "$name"/.tmp
    mime="$(file -b --mime-type $input)"
    file="${input##*/}"
    if [[ $mime == "application/pdf" ]]; then
      hash pdftotext && pdftotext "$input" "$name"/.tmp/${file%.*}.txt
      hash pdfimages && pdfimages -png "$input" "$name"/.tmp/$name
      [[ -f "$name"/.tmp/${file%.*}.txt ]] && sed -i '/^$/d;s/^/\n\n/g' "$name"/.tmp/${file%.*}.txt
    fi
  fi
else
  >&2 echo "geef een naam voor je tutorial"
fi
