# skk-dict-imascgss

![cgss](https://cloud.githubusercontent.com/assets/5173607/21075603/97e3999e-bf59-11e6-9db2-f3816c3b898f.png)

ソーシャルゲーム「アイドルマスター シンデレラガールズ スターライトステージ」に関する語句を収録したSKK辞書です。ある程度はブラウザーゲーム「シンデレラガールズ」に関する文脈でも使用できます。

現在はデレステに実装済のアイドルの名前と声優さんの名前が収録されています。引き続き辞書内容の拡張を検討しています([#3](https://github.com/mlny/skk-dict-imascgss/issues/3))。  

## おことわり
* スターライトステージに実装されていないアイドルの名前は収録されていません。ブラウザーゲーム版の話題をする場合は注意が必要です。
* 声優辞書(actors)は字体の都合でUTF-8版とEUC版に分かれています。UTF-8に対応している実装の場合はUTF-8版を使用してください。
* 辞書の編集を行う際は、/srcフォルダ内の辞書を操作した後で/build.shを実行してください。(skktoolsが必要です)

## ダウンロード

[master.zip](https://github.com/mlny/skk-dict-imascgss/archive/master.zip)

もしくはgitがインストールされている環境で

```
$ git clone https://github.com/mlny/skk-dict-imascgss.git
```

## つかいかた

### [SKK日本語入力FEP](http://coexe.web.fc2.com/programs.html)

```
C:\Windows\IME\SKK0\DICTS
```
の下に辞書をコピーします。声優辞書を使用する場合はUTF-8版(SKK-JISYO.imascgss.actors.utf8)をコピーしてください。

**17年1月時点で開発中のαバージョン(11系)以降では、ユーザ個別辞書フォルダ機能が実装されています。バージョン11系以降をご利用の方は、 %APPDATA%\SKKFEP\DICTS 以下に辞書をコピーしてください。(どちらか分からない場合は上記のシステムフォルダ内にコピーしてください)**

### [AquaSKK](https://github.com/codefirst/aquaskk)

![2017-01-08 4 09 42](https://cloud.githubusercontent.com/assets/5173607/21744443/28e1fc28-d559-11e6-92cc-8a173416bdf0.png)

1. 設定画面を開き、辞書タブを開きます。
2. 追加 を押します。
3. 辞書の種類をSKK 辞書(EUC-JP)にします。
4. 場所の選択... を押し、ダウンロードした辞書を選択します。
5. 声優辞書を使用する場合、3. の手順でSKK 辞書(UTF-8)を選択し、辞書ファイルはSKK-JISYO.imascgss.actors.utf8を選択してください。
6. codefirst版AquaSKKを使用していない、もしくはAquaSKK 4.4.0以前のバージョンをお使いの場合、「場所」の先頭にある*file:/*を削除します(この挙動は[AquaSKK 4.4.1で修正されました](https://github.com/codefirst/aquaskk/issues/55))。

### ibus-skk

ibus-skkの設定画面を開き、辞書タブ内でダウンロードした辞書をシステム辞書として追加すると辞書が使用できるようになります。  

## ライセンス

[CC0](https://creativecommons.org/publicdomain/zero/1.0/deed)  
2016/12/10にMIT LicenseよりCC0に変更されました。

## Special Thanks(敬称略)

* mzp( [@mzp](https://twitter.com/mzp) )
* ばんじゅん( [@banjun](https://twitter.com/banjun) )

・・・上の2名には辞書作成時にTwitterで助言を頂きました。

* kin'u( [@corvussolis](https://twitter.com/corvussolis) )

・・・SKK実装の仕様についてTwitterでの情報提供を頂きました。
