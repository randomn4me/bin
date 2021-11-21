#!/bin/sh

usage() {
	echo "$(basename $0) [-o outdir] <file> <clean-name>"
	exit 1
}

while getopts "o:" opt; do
	case $opt in
		o) test -d $OPTARG && outdir="$OPTARG/" || usage ;;
		*) usage ;;
	esac
done

shift $((OPTIND - 1))

test $# -le 1 && usage

file="$1"
extension="${1##*.}"
shift 1
sanitized=`echo $@ | tr [A-Z\ ] [a-z\-]`
extension_sanitized="$(echo $extension | tr [A-Z] [a-z])"

test -e "$file" && mv "$file" "${outdir}$(date +%F)_$sanitized.$extension_sanitized" && exit 0

usage
