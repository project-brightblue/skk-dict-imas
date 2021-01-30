#!/bin/bash
generate (){
    # ソートしてあるUTF-8の統合辞書をつくる
    cat ../src/ACTORS | skkdic-sort > ./ATOK-DICT.imasml.actors
    cat ../src/FIRSTNAME | iconv -f EUC-JP -t UTF-8 | skkdic-sort > ./ATOK-DICT.imasml.firstname
    cat ../src/FULLNAME | iconv -f EUC-JP -t UTF-8 | skkdic-sort > ./ATOK-DICT.imasml.fullname
    skkdic-expr2 ATOK-DICT.imasml.actors + ATOK-DICT.imasml.firstname + ATOK-DICT.imasml.fullname > ATOK-DICT.imasml.tmp
    rm ATOK-DICT.imasml.actors ATOK-DICT.imasml.firstname ATOK-DICT.imasml.fullname
    # 統合辞書をATOKフォーマットに変換する
    echo -e '!!ATOK_TANGO_TEXT_HEADER_1\r\n!!一覧出力\r\n!!対象辞書;\r\n!!単語種類;登録単語(*)\r\n!!出力日時;2018-05-10 00:00:00 +0000\r\n' > ATOK-DICT.imasml.txt
    sed -f skktoatok.sed ATOK-DICT.imasml.tmp >> ATOK-DICT.imasml.txt
    iconv -f UTF-8 -t UTF-16 ATOK-DICT.imasml.txt -o ATOK-DICT.imasml.txt.utf16
    mv ATOK-DICT.imasml.txt.utf16 ATOK-DICT.imasml.txt
    rm ATOK-DICT.imasml.tmp
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