#!/bin/bash
# ソート処理
generate (){
	# idol name
	echo 'Generate idols name dict...'
	cat ./src/FIRSTNAME | skkdic-sort > ./SKK-JISYO.imassc.firstname
	cat ./src/FULLNAME | skkdic-sort > ./SKK-JISYO.imassc.fullname
	echo 'done.'

	# actors
	echo 'Generate actors dict...'
	cat ./src/ACTORS | skkdic-sort > ./SKK-JISYO.imassc.actors
	echo 'done.'

	# unified
	echo 'Generate unified dict...'
	skkdic-expr2 ./SKK-JISYO.imassc.firstname + ./SKK-JISYO.imassc.fullname + ./SKK-JISYO.imassc.actors > ./SKK-JISYO.imassc.unified
	echo 'done.'

	# ATOK
	echo 'Generate ATOK dict...'
	cd ./ATOK
	sh ./build.sh
	echo 'done.'
}

which skkdic-sort > /dev/null 2>&1

if [ $? = 0 ]; then
	generate
else
	echo 'Please install skkdic-sort(Included in skktools).'
	echo 'Ubuntu/Debian: '
	echo '$ sudo apt install skktools'
	echo 'Arch Linux: '
	echo '$ sudo pacman -S skktools'
	echo 'macOS(Requires Homebrew): '
	echo '$ brew install skktools'
fi

