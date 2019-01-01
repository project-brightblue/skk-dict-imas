#!/bin/bash

# このスクリプトは改良作業中です。

# ソート処理
generate (){
	# 下準備
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.firstname.utf8
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.fullname.utf8
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.actors.utf8
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.song.utf8
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.unified.utf8

	# idol name
	echo 'Generate idols name dict...'
	cat ./src/FIRSTNAME | skkdic-sort >> ./SKK-JISYO.imascg.firstname.utf8
	gsed -f ./src/NAME.sed ./src/FIRSTNAME | skkdic-sort | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.firstname.euc
	cat ./src/FULLNAME | skkdic-sort >> ./SKK-JISYO.imascg.fullname.utf8
	gsed -f ./src/NAME.sed ./src/FULLNAME | skkdic-sort | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.fullname.euc
	echo 'done.'

	# actors
	echo 'Generate actors dict...'
	gsed -f ./src/NAME.sed ./src/ACTORS | iconv -f UTF-8 -t EUC-JP | skkdic-sort > ./SKK-JISYO.imascg.actors.euc
	cat ./src/ACTORS | skkdic-sort >> ./SKK-JISYO.imascg.actors.utf8
	echo 'done.'

	# song
	echo 'Generate song dict...'
	gsed -f ./src/SONG.sed ./src/SONG | iconv -f UTF-8 -t EUC-JP | skkdic-sort > ./SKK-JISYO.imascg.song.euc
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.song.utf8
	cat ./src/SONG | skkdic-sort >> ./SKK-JISYO.imascg.song.utf8
	echo 'done.'

	# unified
	echo 'Generate unified dict...'
	skkdic-expr2 SKK-JISYO.imascg.actors.euc + SKK-JISYO.imascg.song.euc + SKK-JISYO.imascg.firstname.euc + SKK-JISYO.imascg.fullname.euc > SKK-JISYO.imascg.unified.euc
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.unified.utf8
	skkdic-expr2 SKK-JISYO.imascg.actors.utf8 + SKK-JISYO.imascg.song.utf8 + SKK-JISYO.imascg.firstname.utf8 + SKK-JISYO.imascg.fullname.utf8 >> SKK-JISYO.imascg.unified.utf8
	echo 'done.'
}

which skkdic-sort > /dev/null 2>&1

if [ "$(uname)" == 'Darwin' ]; then
	# macOS
	echo 'Your platform is macOS.'
	generate
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
	# Linux
	echo 'Your platform is GNU/Linux.'
	echo 'Use build-gnu.sh.'
	exit 1
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

# if [ $? = 0 ]; then
# 	generate
# else
# 	echo 'Please install skkdic-sort(Included in skktools).'
# 	echo 'Ubuntu/Debian: '
#	echo '$ sudo apt install skktools'
#	echo 'Arch Linux: '
#	echo '$ sudo pacman -S skktools'
#	echo 'macOS(Requires Homebrew): '
#	echo '$ brew install skktools'
#fi

