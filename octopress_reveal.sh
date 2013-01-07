#!/bin/sh

UNAME=`uname`
URLBASE="http://sh.tchen.me"
URL="$URLBASE/downloads/octopress_reveal.tgz"
DIFFFILE="rakefile.diff"
SLIDEDIR="source/slides"
TARGET="."

if [ "$UNAME" != "Linux" -a "$UNAME" != "Darwin" ] ; then
	echo "Sorry, this OS is not supported yet."
	exit 1
fi

set -e
trap "echo Installation failed." EXIT

#echo "downloading..."
#if [ "$UNAME" = "Darwin" ] ; then
#	curl $URL | tar -C "$TARGET" -xzf -
#elif [ "$UNAME" = "Linux" ] ; then
#	curl -# -O $URL | tar -C "$TARGET" -xzf -
#fi

patch -p0 < rakefile.diff
mkdir "$SLIDEDIR"
rm rakefile.diff

cat <<EOF

reveal.js for octopress has been installed! To get started fast:

  $ rake new_slide["Your slide name"]
  $ vim source/slides/your-slide-name/index.markdown

Your can embedded slides in your post with:
  {% reveal url/to/slides width height %}

EOF

trap - EXIT
