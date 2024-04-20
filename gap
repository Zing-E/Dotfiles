#!/bin/sh

# gap a simple script to automate pushing to github

[ "$#" -lt 3 ] && echo "usage: $0 [branch] [comment] [file(s)]" && exit 1

for i in "$@"; do
	[ "$i" = "$1" ] || [ "$i" = "$2" ] && continue
	git add "$i"
done

git commit -m "$2"

git push -u origin "$1"
