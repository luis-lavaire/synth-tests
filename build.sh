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
	mtools \
	xorriso


#   Install the build tools.

git clone https://github.com/Nitrux/tools
export PATH="$PATH:$(pwd)/tools"


#   Generate the images.

synth manjaro.th
