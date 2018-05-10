#!/bin/bash
generate (){
    # ソートしてあるUTF-8の統合辞書をつくる
    cat ../src/ACTORS | skkdic-sort > ./ATOK-DICT.imascg.actors
    cat ../src/FIRSTNAME | iconv -f EUC-JP -t UTF-8 | skkdic-sort > ./ATOK-DICT.imascg.firstname
    cat ../src/FULLNAME | iconv -f EUC-JP -t UTF-8 | skkdic-sort > ./ATOK-DICT.imascg.fullname
    skkdic-expr2 ATOK-DICT.imascg.actors + ATOK-DICT.imascg.firstname + ATOK-DICT.imascg.fullname > ATOK-DICT.imascg.tmp
    rm ATOK-DICT.imascg.actors ATOK-DICT.imascg.firstname ATOK-DICT.imascg.fullname
    # 統合辞書をATOKフォーマットに変換する
    echo '!!ATOK_TANGO_TEXT_HEADER_1' > ATOK-DICT.imascg.txt
    sed -f skktoatok.sed ATOK-DICT.imascg.tmp >> ATOK-DICT.imascg.txt
    rm ATOK-DICT.imascg.tmp
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