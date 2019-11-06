#! /bin/sh

set -e

#   Install dependencies.

apt-get update -yy
apt-get install -yy \
	git \
	curl \
	tar \
	jq \
	build-essential \
	grub-efi-amd64-bin \
	mtools


#   Install the build tools.

git clone https://github.com/Nitrux/tools
export PATH="$PATH:$(pwd)/tools"


#   Generate the images.

for d in *; do

	echo
	echo -e "\e[32m ---- GENERATING '$d' ----\e[0m"
	echo

	synth $d/*.th

	echo " ==> In $(pwd):"
	ls -l .
	echo " ===>"

	echo " ==> In $d:"
	ls -l $d
	echo " ===>"
done
