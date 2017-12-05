#!/bin/bash
# ソート処理
generate (){
	# idol name
	echo 'Generate idols name dict...'
	cat ./src/FIRSTNAME | skkdic-sort > ./SKK-JISYO.imascg.firstname
	cat ./src/FULLNAME | skkdic-sort > ./SKK-JISYO.imascg.fullname
	echo 'done.'

	# actors
	echo 'Generate actors dict...'
	sed -f ./src/ACTORS.sed ./src/ACTORS | iconv -f UTF-8 -t EUC-JP | skkdic-sort > ./SKK-JISYO.imascg.actors.euc
	cat ./src/ACTORS | skkdic-sort > ./SKK-JISYO.imascg.actors.utf8
	echo 'done.'

	# song
	echo 'Generate song dict...'
	sed -f ./src/SONG.sed ./src/SONG | iconv -f UTF-8 -t EUC-JP | skkdic-sort > ./SKK-JISYO.imascg.song.euc
	cat ./src/SONG | skkdic-sort > ./SKK-JISYO.imascg.song.utf8
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

