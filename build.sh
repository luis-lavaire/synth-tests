#! /bin/sh

# -- Install dependencies.

pacman --noconfirm -Syu \
	git \
	curl \
	jq \
	sed

git clone https://github.com/Nitrux/tools
export PATH="$PATH:$(pwd)/tools"


# -- Generate the images.

for d in _*; do

	echo -e "\n\e[32m :: GENERATING '$d'.\e[0m\n"

	(
		cd $d
		synth *
		ls
	)
done
