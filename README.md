![image](https://user-images.githubusercontent.com/5173607/37890070-18c60268-310a-11e8-8ce4-cf3a1af29fe6.png)

# skk-dict-imassc

携帯電話向けブラウザゲーム「アイドルマスター シャイニーカラーズ」に関する語句を収録したSKK辞書です。

現在はモバマス/デレステに実装済のアイドルの名前と、彼女らの声を担当する声優さんの名前が収録されています。  

## おことわり
* 声優辞書(actors)は字体の都合でUTF-8版とEUC版に分かれています。UTF-8に対応している実装の場合はUTF-8版を使用してください。
* 辞書の編集を行う際は、/srcフォルダ内の辞書を操作した後で/build.shを実行してください。(skktoolsが必要です)

## ダウンロード
[master.zip](https://github.com/project-brightblue/skk-dict-imassc/archive/master.zip)

もしくはgitがインストールされている環境で

```
$ git clone https://github.com/project-brightblue/skk-dict-imassc.git
```

## 辞書一覧

|ファイル名                   |辞書の内容                     |
|-----------------------------|-------------------------------|
|SKK-JISYO.imassc.firstname   |アイドル名(下の名前, EUC-JP)   |
|SKK-JISYO.imassc.fullname    |アイドル名(フルネーム, EUC-JP) |

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
声優辞書を使用する場合はEUC版(SKK-JISYO.imascgss.actors.euc)をご使用ください。

## ライセンス
[CC0](https://creativecommons.org/publicdomain/zero/1.0/deed)  

## Special Thanks(敬称略)
* mzp( [@mzp](https://twitter.com/mzp) )
* ばんじゅん( [@banjun](https://twitter.com/banjun) )

・・・上の2名には辞書作成時にTwitterで助言を頂きました。

* kin'u( [@corvussolis](https://twitter.com/corvussolis) )

・・・SKK実装の仕様についてTwitterでの情報提供を頂きました。
