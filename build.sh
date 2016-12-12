#!/bin/bash

# ソート処理
generate (){

	# idol name
	echo 'Generate idols name dict...'
	cat ./src/FIRSTNAME | skkdic-sort > ./SKK-JISYO.imascgss.firstname
	cat ./src/FULLNAME | skkdic-sort > ./SKK-JISYO.imascgss.fullname
	echo 'done.'
	
	# actors
	echo 'Generate actors dict...'
	cat ./src/ACTORS_euc | skkdic-sort > ./SKK-JISYO.imascgss.actors.euc
	cat ./src/ACTORS_utf8 | skkdic-sort > ./SKK-JISYO.imascgss.actors.utf8
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
fi

