#!/bin/bash

# ソート処理
generate (){
	
	# idol name
	echo 'Generate idols name dict...'
	cat ./src/FIRSTNAME | skkdic-sort > ./SKK-JISYO.imasml.firstname
	cat ./src/FULLNAME | skkdic-sort > ./SKK-JISYO.imasml.fullname
	echo 'done.'
	
	# actors
	echo 'Generate actors dict...'
	sed -f ./src/ACTORS.sed ./src/ACTORS | iconv -f UTF-8 -t EUC-JP | skkdic-sort > ./SKK-JISYO.imasml.actors.euc
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imasml.actors.utf8
	cat ./src/ACTORS | skkdic-sort >> ./SKK-JISYO.imasml.actors.utf8
	echo 'done.'

	# unified
	echo 'Generate unified dict...'
	skkdic-expr2 SKK-JISYO.imasml.actors.euc + SKK-JISYO.imasml.firstname + SKK-JISYO.imasml.fullname > SKK-JISYO.imasml.unified.euc
	cat ./SKK-JISYO.imasml.firstname | iconv -f EUC-JP -t UTF-8 > ./firstname.utf8
	cat ./SKK-JISYO.imasml.fullname | iconv -f EUC-JP -t UTF-8 > ./fullname.utf8
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imasml.unified.utf8
	skkdic-expr2 SKK-JISYO.imasml.actors.utf8 + ./firstname.utf8 + ./fullname.utf8 >> SKK-JISYO.imasml.unified.utf8
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

