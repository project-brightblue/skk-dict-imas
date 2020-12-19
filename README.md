# skk-dict-imascg

![cgss](https://user-images.githubusercontent.com/5173607/69078069-68471c00-0a7a-11ea-92aa-d363707e2a97.png)

メディアミックスコンテンツ「アイドルマスター シンデレラガールズ」に関する語句を収録したSKK辞書です。

現在はシンデレラガールズに登場するアイドルの名前と、彼女らの声を担当する声優さんの名前が収録されています。引き続き辞書内容の拡張を検討しています([#3](https://github.com/project-brightblue/skk-dict-imascg/issues/3))。  

## おことわり

* いくつかの辞書はEUC版とUTF-8版に分かれています。字体の違いなどの都合によりUTF-8版のほうがより実際の表記と近いものになっているため、可能な限りUTF-8版の辞書を使ってください。
* 辞書の編集を行う際は、/srcフォルダー内にある辞書を編集して、その後にbuild.shを実行してください。(UNIX系の環境とskktoolsが必要です。Windowsをお使いの方はWSLをお使いください)

## ダウンロード

[master.zip](https://github.com/project-brightblue/skk-dict-imascg/archive/master.zip)

もしくはgitがインストールされている環境で

```
$ git clone https://github.com/project-brightblue/skk-dict-imascg.git
```

## 辞書一覧

|ファイル名                   |辞書の内容             |文字コード|
|-----------------------------|-----------------------|----------|
|SKK-JISYO.imascg.actors.euc  |声優名                 |EUC-JP    |
|SKK-JISYO.imascg.actors.utf8 |声優名                 |UTF-8     |
|SKK-JISYO.imascg.firstname   |アイドル名(下の名前)   |EUC-JP    |
|SKK-JISYO.imascg.fullname    |アイドル名(フルネーム) |EUC-JP    |
|SKK-JISYO.imascg.song.euc    |楽曲名                 |EUC-JP    |
|SKK-JISYO.imascg.song.utf8   |楽曲名                 |UTF-8     |
|SKK-JISYO.imascg.unified.euc |全部入り               |EUC-JP    |
|SKK-JISYO.imascg.unified.utf8|全部入り               |UTF-8     |

## つかいかた

### [SKK日本語入力FEP](http://coexe.web.fc2.com/programs.html)

付属のSKKFEP.batを実行してください。もしくは、

```
%APPDATA%\SKKFEP\DICTS
```
の下に辞書をコピーしてください。声優辞書を使用する場合はUTF-8版(SKK-JISYO.imascgss.actors.utf8)をコピーしてください。

### [AquaSKK](https://github.com/codefirst/aquaskk)

<img width="592" alt="Screenshot 2020-12-19 23 55 25" src="https://user-images.githubusercontent.com/5173607/102692329-885f8680-420a-11eb-90ce-7f541483c1a3.png">

1. 設定画面を開き、辞書タブを開きます。
2. 画面左下の追加ボタンを押します。
3. 辞書の種類を`SKK 辞書(UTF-8)`にしてください。ただしEUC版のアイドル名辞書を使う場合は`SKK 辞書(EUC-JP)`をお使いください。
4. git cloneした、もしくはダウンロードしてきた辞書ファイルを選択してください。

### ibus-skk

ibus-skkの設定画面を開き、辞書タブ内でダウンロードした辞書をシステム辞書として追加すると辞書が使用できるようになります。  
2018年7月8日以降、辞書側の更新でUTF-8版の辞書がご利用いただけるようになりました。OSのロケールがUTF-8の場合は、UTF-8版の辞書をご利用ください。

## ライセンス

[CC0](https://creativecommons.org/publicdomain/zero/1.0/deed)  

## 謝辞(敬称略)

* mzp( [@mzp](https://twitter.com/mzp))
* ばんじゅん( [@banjun](https://twitter.com/banjun))

・・・上の2名には辞書作成時にTwitterで助言を頂きました。

* kin'u( [@corvussolis](https://twitter.com/corvussolis))

・・・SKK実装の仕様についてTwitterでの情報提供を頂きました。
