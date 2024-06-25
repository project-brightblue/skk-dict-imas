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

	echo '🦄 Generate Cinderella Girls dict...'
	# idol name
	echo '👧 Generate idols name dict...'
	skkdic-expr2 ./src/cg/FIRSTNAME | skkdic-sort >> ./SKK-JISYO.imascg.firstname.utf8
	case "$(uname 2>/dev/null)" in
		Darwin ) gsed -f ./src/NAME.sed ./src/cg/FIRSTNAME | skkdic-sort | skkdic-expr2 | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.firstname.euc ;;
		Linux ) sed -f ./src/NAME.sed ./src/cg/FIRSTNAME | skkdic-sort | skkdic-expr2 | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.firstname.euc ;;
	esac
	skkdic-expr2 ./src/cg/FULLNAME | skkdic-sort >> ./SKK-JISYO.imascg.fullname.utf8
	case "$(uname 2>/dev/null)" in
		Darwin ) gsed -f ./src/NAME.sed ./src/cg/FULLNAME | skkdic-sort | skkdic-expr2 | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.fullname.euc ;;
		Linux ) sed -f ./src/NAME.sed ./src/cg/FULLNAME | skkdic-sort | skkdic-expr2 | iconv -f UTF-8 -t EUC-JP > ./SKK-JISYO.imascg.fullname.euc ;;
	esac
	echo 'done.'

	# actors
	echo '🎙️ Generate actors dict...'
	case "$(uname 2>/dev/null)" in
		Darwin ) gsed -f ./src/NAME.sed ./src/cg/ACTORS | iconv -f UTF-8 -t EUC-JP | skkdic-sort | skkdic-expr2 > ./SKK-JISYO.imascg.actors.euc ;;
		Linux ) sed -f ./src/NAME.sed ./src/cg/ACTORS | iconv -f UTF-8 -t EUC-JP | skkdic-sort | skkdic-expr2 > ./SKK-JISYO.imascg.actors.euc ;;
	esac
	skkdic-expr2 ./src/cg/ACTORS | skkdic-sort >> ./SKK-JISYO.imascg.actors.utf8
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

	echo '🦋 Generate 765Pro All-Stars / Million Live dict...'

	# 下準備
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imasasml.actors.utf8
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imasasml.unified.utf8

	# idol name
	echo '👧 Generate idols name dict...'
	skkdic-expr2 ./src/asml/FIRSTNAME | skkdic-sort > ./SKK-JISYO.imasasml.firstname
	skkdic-expr2 ./src/asml/FULLNAME | skkdic-sort > ./SKK-JISYO.imasasml.fullname
	echo 'done.'
	
	# actors
	echo '🎙️ Generate actors dict...'
	case "$(uname 2>/dev/null)" in
		Darwin ) gsed -f ./src/NAME.sed ./src/asml/ACTORS | iconv -f UTF-8 -t EUC-JP | skkdic-sort | skkdic-expr2 > ./SKK-JISYO.imasasml.actors.euc ;;
		Linux ) sed -f ./src/NAME.sed ./src/asml/ACTORS | iconv -f UTF-8 -t EUC-JP | skkdic-sort | skkdic-expr2 > ./SKK-JISYO.imasasml.actors.euc ;;
	esac
	skkdic-expr2 ./src/asml/ACTORS | skkdic-sort >> ./SKK-JISYO.imasasml.actors.utf8
	echo 'done.'

	# unified
	echo '🎙️ Generate unified dict...'
	skkdic-expr2 SKK-JISYO.imasasml.actors.euc + SKK-JISYO.imasasml.firstname + SKK-JISYO.imasasml.fullname > SKK-JISYO.imasasml.unified.euc
	skkdic-expr2 ./SKK-JISYO.imasasml.firstname | iconv -f EUC-JP -t UTF-8 > ./firstname.utf8
	skkdic-expr2 ./SKK-JISYO.imasasml.fullname | iconv -f EUC-JP -t UTF-8 > ./fullname.utf8
	skkdic-expr2 SKK-JISYO.imasasml.actors.utf8 + ./firstname.utf8 + ./fullname.utf8 >> SKK-JISYO.imasasml.unified.utf8
	rm firstname.utf8 fullname.utf8
	echo 'done.'

	echo '✨ Generate Shiny Colors dict...'
	
	# idol name
	echo '👧 Generate idols name dict...'
	skkdic-expr2 ./src/sc/FIRSTNAME | skkdic-sort > ./SKK-JISYO.imassc.firstname
	skkdic-expr2 ./src/sc/FULLNAME | skkdic-sort > ./SKK-JISYO.imassc.fullname
	echo 'done.'

	# actors
	echo '🎙️ Generate actors dict...'
	skkdic-expr2 ./src/sc/ACTORS | skkdic-sort > ./SKK-JISYO.imassc.actors
	echo 'done.'

	# unified
	echo '🌀 Generate unified dict...'
	skkdic-expr2 ./SKK-JISYO.imassc.firstname + ./SKK-JISYO.imassc.fullname + ./SKK-JISYO.imassc.actors > ./SKK-JISYO.imassc.unified
	echo 'done.'

	echo '🏫 Generate Gakuen dict...'

	# idol name
	echo '👧 Generate idols name dict...'
	skkdic-expr2 ./src/gk/FIRSTNAME | skkdic-sort > ./SKK-JISYO.gkmas.firstname
	skkdic-expr2 ./src/gk/FULLNAME | skkdic-sort > ./SKK-JISYO.gkmas.fullname
	echo 'done.'

	# actors
	echo '🎙️ Generate actors dict...'
	skkdic-expr2 ./src/gk/ACTORS | skkdic-sort > ./SKK-JISYO.gkmas.actors
	echo 'done.'

	# unified
	echo '🌀 Generate unified dict...'
	skkdic-expr2 ./SKK-JISYO.gkmas.firstname + ./SKK-JISYO.gkmas.fullname + ./SKK-JISYO.gkmas.actors > ./SKK-JISYO.gkmas.unified
	echo 'done.'

	# Unified everything
	echo '🌀 Unifying everything...'
	echo ';; -*- fundamental -*- ; coding: utf-8 -*-' > ./SKK-JISYO.imas.unified.utf8
	skkdic-expr2 ./SKK-JISYO.imassc.unified | iconv -f EUC-JP -t UTF-8 > ./sc.utf8
	skkdic-expr2 ./SKK-JISYO.gkmas.unified | iconv -f EUC-JP -t UTF-8 > ./gk.utf8
	skkdic-expr2 SKK-JISYO.imascg.unified.euc + SKK-JISYO.imasasml.unified.euc + SKK-JISYO.imassc.unified + SKK-JISYO.gkmas.unified > ./SKK-JISYO.imas.unified.euc
	skkdic-expr2 SKK-JISYO.imascg.unified.utf8 + SKK-JISYO.imasasml.unified.utf8 + sc.utf8 + gk.utf8 >> ./SKK-JISYO.imas.unified.utf8
	rm sc.utf8 gk.utf8
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



