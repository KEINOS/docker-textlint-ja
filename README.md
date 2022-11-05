# docker-textlint-ja

> [Textlint](http://textlint.github.io/) Docker image for technical writing in Japanese.

日本語の技術記事を書くための [Textlint](http://textlint.github.io/) の Docker イメージです。以下のプリセットをベースに校正ルールをカスタムしています。

- [preset-ja-technical-writing](https://github.com/textlint-ja/textlint-rule-preset-ja-technical-writing)【[概要](https://efcl.info/2016/07/13/textlint-rule-preset-ja-technical-writing/)】
- [preset-ja-spacing](https://github.com/textlint-ja/textlint-rule-preset-ja-spacing)【[概要](https://efcl.info/2016/07/21/textlint-rule-spacing/)】

## 校正ルール（Proofing Rules）

- ルールセットのデフォルト値と異なる設定
  - [半角文字と全角文字の間にスペースを入れる（句読点を除く）](https://github.com/textlint-ja/textlint-rule-preset-ja-spacing/tree/master/packages/textlint-rule-ja-space-between-half-and-full-width)
  - [感嘆符「!！?？」の使用を許可する](https://github.com/textlint-rule/textlint-rule-no-exclamation-question-mark)
- 特筆すべき設定ルール
  - [ひらがな表記が、漢字よりも読みやすい副詞を指摘する](https://github.com/lostandfound/textlint-rule-ja-hiragana-fukushi)
  - [1 文の長さは 100 文字以下とする](https://github.com/azu/textlint-rule-sentence-length)
  - [カンマは1文中に 3 つまで](https://github.com/textlint-rule/textlint-rule-max-comma)
  - 読点は 1 文中に 3 つまで
  - 連続できる最大の漢字長は 6 文字まで
  - 漢数字と算用数字を使い分ける
  - 「ですます調」、「である調」を統一する
  - 文末の句点記号として「。」を使う
  - 二重否定は使用しない
  - ら抜き言葉を使用しない
  - 逆接の接続助詞「が」を連続して使用しない
  - 同じ接続詞を連続して使用しない
  - 同じ助詞を連続して使用しない
  - UTF8-MAC 濁点を使用しない
  - 不必要な制御文字を使用しない
  - 不必要なゼロ幅スペースを使用しない
  - 半角カナを使用しない
  - 弱い日本語表現の利用を使用しない
  - 同一の単語を間違えて連続しているのをチェックする
  - よくある日本語の誤用をチェックする
  - 冗長な表現をチェックする
  - 入力ミスで発生する不自然なアルファベットをチェックする
  - 対になっていない括弧をチェックする

## Related repositories

- [https://github.com/miy4/docker-textlint](https://github.com/miy4/docker-textlint)
- [https://github.com/shimizukawa/docker-textlint](https://github.com/shimizukawa/docker-textlint)
