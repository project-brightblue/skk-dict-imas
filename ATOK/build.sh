#!/bin/bash
generate (){
    # ソートしてあるUTF-8の統合辞書をつくる
    cat ../src/ACTORS | skkdic-sort > ./ATOK-DICT.imassc.actors
    cat ../src/FIRSTNAME | iconv -f EUC-JP -t UTF-8 | skkdic-sort > ./ATOK-DICT.imassc.firstname
    cat ../src/FULLNAME | iconv -f EUC-JP -t UTF-8 | skkdic-sort > ./ATOK-DICT.imassc.fullname
    skkdic-expr2 ATOK-DICT.imassc.actors + ATOK-DICT.imassc.firstname + ATOK-DICT.imassc.fullname > ATOK-DICT.imassc.tmp
    rm ATOK-DICT.imassc.actors ATOK-DICT.imassc.firstname ATOK-DICT.imassc.fullname
    # 統合辞書をATOKフォーマットに変換する
    echo -e '!!ATOK_TANGO_TEXT_HEADER_1\r\n!!一覧出力\r\n!!対象辞書;\r\n!!単語種類;登録単語(*)\r\n!!出力日時;2018-05-10 00:00:00 +0000\r\n' > ATOK-DICT.imassc.txt
    sed -f skktoatok.sed ATOK-DICT.imassc.tmp >> ATOK-DICT.imassc.txt
    iconv -f UTF-8 -t UTF-16 ATOK-DICT.imassc.txt -o ATOK-DICT.imassc.txt.utf16
    mv ATOK-DICT.imassc.txt.utf16 ATOK-DICT.imassc.txt
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