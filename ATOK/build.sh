#!/bin/bash
#generate (){
#    # ソートしてあるUTF-8の統合辞書をつくる
#    cat ../src/ACTORS | skkdic-sort > ./ATOK-DICT.imascg.actors
#    cat ../src/FIRSTNAME | iconv -f EUC-JP -t UTF-8 | skkdic-sort > ./ATOK-DICT.imascg.firstname
#    cat ../src/FULLNAME | iconv -f EUC-JP -t UTF-8 | skkdic-sort > ./ATOK-DICT.imascg.fullname
#    skkdic-expr2 ATOK-DICT.imascg.actors + ATOK-DICT.imascg.firstname + ATOK-DICT.imascg.fullname > ATOK-DICT.imascg.tmp
#    rm ATOK-DICT.imascg.actors ATOK-DICT.imascg.firstname ATOK-DICT.imascg.fullname
#    # 統合辞書をATOKフォーマットに変換する
#    echo -e '!!ATOK_TANGO_TEXT_HEADER_1\r\n!!一覧出力\r\n!!対象辞書;\r\n!!単語種類;登録単語(*)\r\n!!出力日時;2018-05-10 00:00:00 +0000\r\n' > ATOK-DICT.imascg.txt
#    sed -f skktoatok.sed ATOK-DICT.imascg.tmp >> ATOK-DICT.imascg.txt
#    iconv -f UTF-8 -t UTF-16 ATOK-DICT.imascg.txt -o ATOK-DICT.imascg.txt.utf16
#    mv ATOK-DICT.imascg.txt.utf16 ATOK-DICT.imascg.txt
#    rm ATOK-DICT.imascg.tmp
#	echo 'done.'
#}

generate (){
	cat ../src/ACTORS > ./tmp
	cat ../src/FIRSTNAME >> ./tmp
	cat ../src/FULLNAME >> ./tmp
	cat ./tmp | skkdic-sort > ./tmp2
	echo -e '!!ATOK_TANGO_TEXT_HEADER_1\r\n!!一覧出力\r\n!!対象辞書;\r\n!!単語種類;登録単語(*)\r\n!!出力日時;2019-01-01 00:00:00 +0000\r\n' > ATOK-DICT.imascg.txt
	sed -f skktoatok.sed ./tmp2 >> ATOK-DICT.imascg.txt.utf8
	iconv -f UTF-8 -t UTF-16 ATOK-DICT.imascg.txt.utf8 -o ATOK-DICT.imascg.txt
	rm ATOK-DICT.imascg.txt.utf8
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