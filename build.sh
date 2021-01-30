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

	echo '🦄 Generate cinderella girls dict...'
	# idol name
	echo '👧 Generate idols name dict...'
	skkdic-expr2 ./src/FIRSTNAME_cg | skkdic-sort >> ./SKK-JISYO.imascg.firstname.utf8
	case "$(uname 2>/dev/null)" in
		Darwin ) gsed -f ./src/NAME.sed ./src/FIRSTNAME_cg | skkdic-sort | skkdic-expr2 | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.firstname.euc ;;
		Linux ) sed -f ./src/NAME.sed ./src/FIRSTNAME_cg | skkdic-sort | skkdic-expr2 | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.firstname.euc ;;
	esac
	skkdic-expr2 ./src/FULLNAME_cg | skkdic-sort >> ./SKK-JISYO.imascg.fullname.utf8
	case "$(uname 2>/dev/null)" in
		Darwin ) gsed -f ./src/NAME.sed ./src/FULLNAME_cg | skkdic-sort | skkdic-expr2 | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.fullname.euc ;;
		Linux ) sed -f ./src/NAME.sed ./src/FULLNAME_cg | skkdic-sort | skkdic-expr2 | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.fullname.euc ;;
	esac
	echo 'done.'

	# actors
	echo '🎙️ Generate actors dict...'
	case "$(uname 2>/dev/null)" in
		Darwin ) gsed -f ./src/NAME.sed ./src/ACTORS_cg | iconv -f UTF-8 -t EUC-JP | skkdic-sort | skkdic-expr2 > ./SKK-JISYO.imascg.actors.euc ;;
		Linux ) sed -f ./src/NAME.sed ./src/ACTORS_cg | iconv -f UTF-8 -t EUC-JP | skkdic-sort | skkdic-expr2 > ./SKK-JISYO.imascg.actors.euc ;;
	esac
	
	skkdic-expr2 ./src/ACTORS_cg | skkdic-sort >> ./SKK-JISYO.imascg.actors.utf8
	echo 'done.'

	# song
	# echo 'Generate song dict...'
	# case "$(uname 2>/dev/null)" in
	#	Darwin ) gsed -f ./src/SONG.sed ./src/SONG | iconv -f UTF-8 -t EUC-JP | skkdic-sort > ./SKK-JISYO.imascg.song.euc ;;
	#	Linux ) sed -f ./src/SONG.sed ./src/SONG | iconv -f UTF-8 -t EUC-JP | skkdic-sort > ./SKK-JISYO.imascg.song.euc ;;
	# esac
	# echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.song.utf8
	# skkdic-expr2 ./src/SONG | skkdic-sort >> ./SKK-JISYO.imascg.song.utf8
	# echo 'done.'

	# unified
	echo '🌀 Generate unified dict...'
	skkdic-expr2 SKK-JISYO.imascg.actors.euc + SKK-JISYO.imascg.firstname.euc + SKK-JISYO.imascg.fullname.euc > SKK-JISYO.imascg.unified.euc
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imascg.unified.utf8
	skkdic-expr2 SKK-JISYO.imascg.actors.utf8 + SKK-JISYO.imascg.firstname.utf8 + SKK-JISYO.imascg.fullname.utf8 >> SKK-JISYO.imascg.unified.utf8
	echo 'done.'

	echo '🦋 Generate million live dict...'

	# 下準備
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imasml.actors.utf8
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imasml.unified.utf8

	# idol name
	echo '👧 Generate idols name dict...'
	skkdic-expr2 ./src/FIRSTNAME_ml | skkdic-sort > ./SKK-JISYO.imasml.firstname
	skkdic-expr2 ./src/FULLNAME_ml | skkdic-sort > ./SKK-JISYO.imasml.fullname
	echo 'done.'
	
	# actors
	echo '🎙️ Generate actors dict...'
	case "$(uname 2>/dev/null)" in
		Darwin ) gsed -f ./src/ACTORS.sed ./src/ACTORS_ml | iconv -f UTF-8 -t EUC-JP | skkdic-sort | skkdic-expr2 > ./SKK-JISYO.imasml.actors.euc ;;
		Linux ) sed -f ./src/ACTORS.sed ./src/ACTORS_ml | iconv -f UTF-8 -t EUC-JP | skkdic-sort | skkdic-expr2 > ./SKK-JISYO.imasml.actors.euc ;;
	esac
	skkdic-expr2 ./src/ACTORS_ml | skkdic-sort >> ./SKK-JISYO.imasml.actors.utf8
	echo 'done.'

	# unified
	echo '🎙️ Generate unified dict...'
	skkdic-expr2 SKK-JISYO.imasml.actors.euc + SKK-JISYO.imasml.firstname + SKK-JISYO.imasml.fullname > SKK-JISYO.imasml.unified.euc
	skkdic-expr2 ./SKK-JISYO.imasml.firstname | iconv -f EUC-JP -t UTF-8 > ./firstname.utf8
	skkdic-expr2 ./SKK-JISYO.imasml.fullname | iconv -f EUC-JP -t UTF-8 > ./fullname.utf8
	skkdic-expr2 SKK-JISYO.imasml.actors.utf8 + ./firstname.utf8 + ./fullname.utf8 >> SKK-JISYO.imasml.unified.utf8
	rm firstname.utf8 fullname.utf8
	echo 'done.'

	echo '✨ Generate shiny colors dict...'
	
	# idol name
	echo '👧 Generate idols name dict...'
	skkdic-expr2 ./src/FIRSTNAME_sc | skkdic-sort > ./SKK-JISYO.imassc.firstname
	skkdic-expr2 ./src/FULLNAME_sc | skkdic-sort > ./SKK-JISYO.imassc.fullname
	echo 'done.'

	# actors
	echo '🎙️ Generate actors dict...'
	skkdic-expr2 ./src/ACTORS_sc | skkdic-sort > ./SKK-JISYO.imassc.actors
	echo 'done.'

	# unified
	echo '🌀 Generate unified dict...'
	skkdic-expr2 ./SKK-JISYO.imassc.firstname + ./SKK-JISYO.imassc.fullname + ./SKK-JISYO.imassc.actors > ./SKK-JISYO.imassc.unified
	echo 'done.'

	# Unified everything
	echo '🌀 Unifying everything...'
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imas.unified.utf8
	skkdic-expr2 ./SKK-JISYO.imassc.unified | iconv -f EUC-JP -t UTF-8 > ./sc.utf8
	skkdic-expr2 SKK-JISYO.imascg.unified.euc + SKK-JISYO.imasml.unified.euc + SKK-JISYO.imassc.unified > ./SKK-JISYO.imas.unified.euc
	skkdic-expr2 SKK-JISYO.imascg.unified.utf8 + SKK-JISYO.imasml.unified.utf8 + sc.utf8 >> ./SKK-JISYO.imas.unified.utf8
	rm sc.utf8
	echo 'done.'
}

check (){
	echo 'Checking build dependencies...'
	which skkdic-sort > /dev/null 2>&1
	if [ $? = 0 ]; then
		echo 'OK.'
		case "$(uname 2>/dev/null)" in
			Darwin ) echo 'You are on macOS. Build will fail if you do not have gnu-sed installed in your Mac.' ;;
			Linux ) echo 'You are on GNU/Linux.' ;;
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



