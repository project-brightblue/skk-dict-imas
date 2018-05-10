#!/bin/bash
generate (){
    # ソートしてあるUTF-8の統合辞書をつくる
    cat ../src/ACTORS | skkdic-sort > ./ATOK-DICT.imassc.actors
    cat ../src/FIRSTNAME | iconv -f EUC-JP -t UTF-8 | skkdic-sort > ./ATOK-DICT.imassc.firstname
    cat ../src/FULLNAME | iconv -f EUC-JP -t UTF-8 | skkdic-sort > ./ATOK-DICT.imassc.fullname
    skkdic-expr2 ATOK-DICT.imassc.actors + ATOK-DICT.imassc.firstname + ATOK-DICT.imassc.fullname > ATOK-DICT.imassc.tmp
    rm ATOK-DICT.imassc.actors ATOK-DICT.imassc.firstname ATOK-DICT.imassc.fullname
    # 統合辞書をATOKフォーマットに変換する
    echo '!!ATOK_TANGO_TEXT_HEADER_1' > ATOK-DICT.imassc.txt
    sed -f skktoatok.sed ATOK-DICT.imassc.tmp >> ATOK-DICT.imassc.txt
    rm ATOK-DICT.imassc.tmp
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