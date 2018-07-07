# skk-dict-imascg

![cgss](https://cloud.githubusercontent.com/assets/5173607/21075603/97e3999e-bf59-11e6-9db2-f3816c3b898f.png)

ソーシャルゲーム「アイドルマスター シンデレラガールズ」に関する語句を収録したSKK辞書です。

現在はモバマス/デレステに実装済のアイドルの名前と、彼女らの声を担当する声優さんの名前が収録されています。引き続き辞書内容の拡張を検討しています([#3](https://github.com/project-brightblue/skk-dict-imascg/issues/3))。  

## おことわり
* いくつかの辞書はEUC版とUTF-8版に分かれています。字体の違いなどの都合によりUTF-8版のほうがより実際の表記に近いものになっているため、可能な限りUTF-8版の辞書を使ってください。
* 辞書の編集を行う際は、/srcフォルダ内の辞書を操作した後で/build.shを実行してください。(skktoolsが必要です)

## ダウンロード
[master.zip](https://github.com/project-brightblue/skk-dict-imascg/archive/master.zip)

もしくはgitがインストールされている環境で

```
$ git clone https://github.com/project-brightblue/skk-dict-imascg.git
```

## 辞書一覧

|ファイル名                   |辞書の内容                     |
|-----------------------------|-------------------------------|
|SKK-JISYO.imascg.actors.euc  |声優名(EUC-JP)                 |
|SKK-JISYO.imascg.actors.utf8 |声優名(UTF-8)                  |
|SKK-JISYO.imascg.firstname   |アイドル名(下の名前, EUC-JP)   |
|SKK-JISYO.imascg.fullname    |アイドル名(フルネーム, EUC-JP) |
|SKK-JISYO.imascg.song.euc    |楽曲名(EUC-JP)                 |
|SKK-JISYO.imascg.song.utf8   |楽曲名(UTF-8)                  |
|SKK-JISYO.imascg.unified.euc |全部入り(EUC-JP)               |
|SKK-JISYO.imascg.unified.utf8|全部入り(UTF-8)                |

## つかいかた
### [SKK日本語入力FEP](http://coexe.web.fc2.com/programs.html)
#### β0+11i版以降
付属のSKKFEP.batを実行してください。もしくは、

```
%APPDATA%\SKKFEP\DICTS
```
の下に辞書をコピーしてください。声優辞書を使用する場合はUTF-8版(SKK-JISYO.imascgss.actors.utf8)をコピーしてください。

#### β0+10i版以前
```
C:\Windows\IME\SKK0\DICTS
```
の下に辞書をコピーします。声優辞書を使用する場合はUTF-8版(SKK-JISYO.imascgss.actors.utf8)をコピーしてください。

### [AquaSKK](https://github.com/codefirst/aquaskk)
![2017-01-08 4 09 42](https://cloud.githubusercontent.com/assets/5173607/21744443/28e1fc28-d559-11e6-92cc-8a173416bdf0.png)

1. 設定画面を開き、辞書タブを開きます。
2. 追加 を押します。
3. 辞書の種類をSKK 辞書(EUC-JP)にします。
4. 場所の選択... を押し、ダウンロードした辞書を選択します。
5. 声優辞書を使用する場合、3. の手順でSKK 辞書(UTF-8)を選択し、辞書ファイルはUTF-8版(SKK-JISYO.imascg.actors.utf8)を選択してください。
6. codefirst版AquaSKKを使用していない、もしくはAquaSKK 4.4.0以前のバージョンをお使いの場合、「場所」の先頭にある*file:/*を削除します(この挙動は[AquaSKK 4.4.1で修正されました](https://github.com/codefirst/aquaskk/issues/55))。

### ibus-skk
ibus-skkの設定画面を開き、辞書タブ内でダウンロードした辞書をシステム辞書として追加すると辞書が使用できるようになります。  
2018年7月8日以降、辞書側の更新でUTF-8版の辞書がご利用いただけるようになりました。OSのロケールがUTF-8の場合は、UTF-8版の辞書をご利用ください。

## ライセンス
[CC0](https://creativecommons.org/publicdomain/zero/1.0/deed)  

## Special Thanks(敬称略)
* mzp( [@mzp](https://twitter.com/mzp) )
* ばんじゅん( [@banjun](https://twitter.com/banjun) )

・・・上の2名には辞書作成時にTwitterで助言を頂きました。

* kin'u( [@corvussolis](https://twitter.com/corvussolis) )

・・・SKK実装の仕様についてTwitterでの情報提供を頂きました。
