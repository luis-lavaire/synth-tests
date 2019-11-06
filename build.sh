#! /bin/sh

set -e

#   Install dependencies.

apt-get -q -y update
apt-get -q -y install \
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

for i in */*.th; do

	echo
	echo -e "\e[34m ---- GENERATING '$d' ----\e[0m"
	echo

	synth $i
done
