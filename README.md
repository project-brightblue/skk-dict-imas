# skk-dict-imascgss

アイドルマスターシンデレラガールズ スターライトステージ SKK辞書

(現時点では)デレステに登場するアイドルたちの名前を一発で変換できるだけのSKK辞書です。  
作者が個人的に使えればいいので

* ソートしていません。多くのSKK実装はソートされていない辞書を追加しても正常に動作し、作者の環境ではAquaSKK(4.4.0 2016-5-7)とSKK日本語入力FEP(β0+10i 20160712)で動作確認済です。
* (作者が本家シンデレラガールズをプレーしていないので)スターライトステージに実装されていないアイドルの名前は収録されていません。

ので、あらかじめご了承ください。

## Download

[master.zip](https://github.com/mlny/skk-dict-imascgss/archive/master.zip)

もしくはgitがインストールされている環境で

```
$ git clone https://github.com/mlny/skk-dict-imascgss.git
```

## Usage

### SKK日本語入力FEP(Windows)

```
C:\Windows\IME\SKK0\DICTS
```
の下に辞書をコピーします。

### AquaSKK(macOS)

1. 設定画面を開き、辞書タブを開きます。
2. 追加 を押します。
3. 辞書の種類をSKK 辞書(EUC-JP)にします。
4. 場所の選択... を押し、ダウンロードした辞書を選択します。

### ibus-skk

ibus-skkの設定画面を開き、辞書タブ内でダウンロードした辞書をシステム辞書として追加すると辞書が使用できるようになります。

## License

[MIT License](https://github.com/mlny/skk-dict-imascgss/blob/master/LICENSE)

## Special Thanks(敬称略)

* mzp( [@mzp](https://twitter.com/mzp) )
* ばんじゅん( [@banjun](https://twitter.com/banjun) )

・・・上の2名には辞書作成時にTwitterで助言を頂きました。