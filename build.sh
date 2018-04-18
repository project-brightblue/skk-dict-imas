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

	# unified
	echo 'Generate unified dict...'
	skkdic-expr2 SKK-JISYO.imascg.actors.euc + SKK-JISYO.imascg.song.euc + SKK-JISYO.imascg.firstname + SKK-JISYO.imascg.fullname > SKK-JISYO.imascg.unified.euc
	cat ./SKK-JISYO.imascg.firstname | iconv -f EUC-JP -t UTF-8 > ./firstname.utf8
	cat ./SKK-JISYO.imascg.fullname | iconv -f EUC-JP -t UTF-8 > ./fullname.utf8
	skkdic-expr2 SKK-JISYO.imascg.actors.utf8 + SKK-JISYO.imascg.song.utf8 + ./firstname.utf8 + fullname.utf-8 > SKK-JISYO.imascg.unified.utf8
	rm firstname.utf8 fullname.utf8
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

