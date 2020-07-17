#! /bin/sh


#   install dependencies.

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


#   install the build tools.

git clone https://github.com/Nitrux/tools
export PATH="$PATH:$(pwd)/tools"


#   generate the images.

synth *.sy && {
	set -- *.iso
	for f in "$@"; do
		curl -F="$f" "https://transfer.sh"
	done
}
