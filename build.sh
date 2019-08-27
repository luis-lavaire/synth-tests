#! /bin/sh

apt -y update
apt -y install git

git clone https://github.com/Nitrux/tools

export PATH="$PATH:$(pwd)/tools"

for d in _*; do

	echo -e "\n\e[32m :: GENERATING '$d'.\e[0m\n"

	(
		cd $d
		synth *
		ls
	)
done
