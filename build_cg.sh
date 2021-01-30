#!/bin/bash

# このスクリプトは改良作業中です。
# sedスクリプトがBSDのsedではうまく動かないものになってしまっているため、macOS環境でのビルドにはgnu-sedが必要です。

# ソート処理
generate (){
	# 下準備
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.firstname.utf8
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.fullname.utf8
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.actors.utf8
	# echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.song.utf8
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.unified.utf8

	# idol name
	echo 'Generate idols name dict...'
	cat ./src/FIRSTNAME | skkdic-sort >> ./SKK-JISYO.imascg.firstname.utf8
	case "$(uname 2>/dev/null)" in
		Darwin ) gsed -f ./src/NAME.sed ./src/FIRSTNAME | skkdic-sort | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.firstname.euc ;;
		Linux ) sed -f ./src/NAME.sed ./src/FIRSTNAME | skkdic-sort | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.firstname.euc ;;
	esac
	cat ./src/FULLNAME | skkdic-sort >> ./SKK-JISYO.imascg.fullname.utf8
	case "$(uname 2>/dev/null)" in
		Darwin ) gsed -f ./src/NAME.sed ./src/FULLNAME | skkdic-sort | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.fullname.euc ;;
		Linux ) sed -f ./src/NAME.sed ./src/FULLNAME | skkdic-sort | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.fullname.euc ;;
	esac
	echo 'done.'

	# actors
	echo 'Generate actors dict...'
	case "$(uname 2>/dev/null)" in
		Darwin ) gsed -f ./src/NAME.sed ./src/ACTORS | iconv -f UTF-8 -t EUC-JP | skkdic-sort > ./SKK-JISYO.imascg.actors.euc ;;
		Linux ) sed -f ./src/NAME.sed ./src/ACTORS | iconv -f UTF-8 -t EUC-JP | skkdic-sort > ./SKK-JISYO.imascg.actors.euc ;;
	esac
	
	cat ./src/ACTORS | skkdic-sort >> ./SKK-JISYO.imascg.actors.utf8
	echo 'done.'

	# song
	# echo 'Generate song dict...'
	# case "$(uname 2>/dev/null)" in
	#	Darwin ) gsed -f ./src/SONG.sed ./src/SONG | iconv -f UTF-8 -t EUC-JP | skkdic-sort > ./SKK-JISYO.imascg.song.euc ;;
	#	Linux ) sed -f ./src/SONG.sed ./src/SONG | iconv -f UTF-8 -t EUC-JP | skkdic-sort > ./SKK-JISYO.imascg.song.euc ;;
	# esac
	# echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.song.utf8
	# cat ./src/SONG | skkdic-sort >> ./SKK-JISYO.imascg.song.utf8
	# echo 'done.'

	# unified
	echo 'Generate unified dict...'
	skkdic-expr2 SKK-JISYO.imascg.actors.euc + SKK-JISYO.imascg.firstname.euc + SKK-JISYO.imascg.fullname.euc > SKK-JISYO.imascg.unified.euc
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.unified.utf8
	skkdic-expr2 SKK-JISYO.imascg.actors.utf8 + SKK-JISYO.imascg.firstname.utf8 + SKK-JISYO.imascg.fullname.utf8 >> SKK-JISYO.imascg.unified.utf8
	echo 'done.'
}

check (){
	echo 'Checking build dependencies...'
	which skkdic-sort > /dev/null 2>&1
	if [ $? = 0 ]; then
		echo 'OK.'
		case "$(uname 2>/dev/null)" in
			Darwin ) echo 'You are on macOS. Build will fail if you do not have gnu-sed installed in your Mac.' ;;
			Linux ) echo 'You are on Linux.' ;;
		esac 
		generate
	else
		echo 'We need skktools to build dict.'
		echo 'Ubuntu/Debian: '
		echo '$ sudo apt install skktools'
		echo 'Arch Linux: '
		echo '$ sudo pacman -S skktools'
		echo 'for macOS, we also need gnu-sed(Requires Homebrew): '
		echo '% brew install skktools'
		echo '% brew install gnu-sed'
	fi
}

case "$(uname 2>/dev/null)" in
	Darwin | Linux ) check ;;
	* ) echo 'Your platform is not supported.' ;;
esac



