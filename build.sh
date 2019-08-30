#! /bin/sh

# -- Install dependencies.

apt-get update -yy
apt-get install -yy git curl jq build-essential

git clone https://github.com/Nitrux/tools
export PATH="$PATH:$(pwd)/tools"


# -- Generate the images.

for d in oss/*/; do

	echo -e "\n\e[32m :: GENERATING '$d'.\e[0m\n"

	synth $d/*.th $d/out.ISO

	echo " ==> In $(pwd):"
	ls -l .
	echo " ===>"

	echo " ==> In $d:"
	ls -l $d
	echo " ===>"
done
