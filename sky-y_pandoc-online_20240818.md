---
title: Pandocのトレンド2024：DjotとTypst
subtitle: Pandoc ONLINE \#1
author: 藤原 惟 (sky_y)
date: 2024-08-18
---

# Pandocのトレンド

- Djot [^djot-pronunciation]
  - John MacFarlane (jgm) が開発した新しいマークアップ言語
  - CommonMarkを一から作り直したような感じ
- Typst
  - 次世代の組版システム
  - タイプセットが速く、リアルタイムプレビューできる
  - マークアップ言語がフレンドリー

[^djot-pronunciation]: \textipa{/d\textyogh\textscripta t/} と読む (<https://djot.net/>)

## なぜこの2つがトレンドなのか

※主観的なチョイスです

- Djot
  - jgmによる意欲的な提案（面白そう）
- Typst
  - Pandocの最近のリリースノートで頻繁に出てくる
  - 組版界隈でもよく聞く気がする

# Djot

## 参考文献

- 日本におけるDjotエヴァンジェリスト：@daisuke (daisuke osada)さん
  - [Djotはマークダウン愛から産まれてる ～次代のマークダウン「Djot」をウォッチしよう #Markdown - Qiita](https://qiita.com/daisuke/items/06fd183418ee40ef6710)
  - [日本語版README](https://github.com/dai/djot/blob/main/README-ja.md)
  - [Markdownユーザー向けのクイックスタート](https://github.com/dai/djot/blob/main/doc/ja-quick-start-for-markdown-users.md)
  - [Djot構文リファレンス](https://htmlpreview.github.io/?https://github.com/dai/djot/blob/master/doc/ja-syntax.html)
  - [Djot Japanese Docs](https://zenn.dev/daisuke/articles/djot-japanese-readme)
- [次世代のMarkdownみたいなDjotの話](https://zenn.dev/sorairolake/articles/nextgen-markdown-djot)

## あらためてDjotとは

- Djot ≒ CommonMark - CommonMarkの複雑で解析が難しい部分 + 便利な記法
- 発端はjgmのエッセイ「Beyond Markdown」
  - <https://johnmacfarlane.net/beyond-markdown.html>

## Beyond Markdown

- CommonMark
  - 可能な限りJohn GruberのMarkdown仕様に忠実であるように努めた
  - 曖昧さを排除、統一性を高める
  - フェンスコードブロックなどいくつかの記法を追加
- CommonMark仕様は複雑になってしまった
  - 強調を制御する原則は17個もあり、未解決なケースもある
- CommonMark仕様の肥大化と複雑さを修正し、Markdownのよいところを維持したパラダイスみてぇな軽量マークアップ言語を作りてぇ

## Beyond Markdown：例 強調のルール

強調の17個の非常に複雑なルールは、人間が最も自然だと感じる種類の読み方を可能にするために設計されている

::: incremental

- Q: `**this* text**` はどう解釈されうるか？
- `<strong>this* text</strong>`
- `<em><em>this</em> text</em>*`
- PandocのCommonMarkの場合: 
  - `echo '**this* text**' | pandoc -f commonmark -t html`
  - → `<p><em><em>this</em> text</em>*</p>`

:::

## Djotならどう書くか

強調 (emphasis) と強い強調 (strong emphasis) の書き方

- `_強調_`
- `*強い強調*`
- ルール
  - 強調の開き：直後に空白が続かない場合にのみ
  - 強調の閉じ：直前に空白がない場合、および開始文字と終了文字の間に区切り文字以外の文字がある場合のみ
    - `_ 強調されない例 (余計な空白が入ってる) _`
    - `___ 2番目のアンダースコアは強調されない`
  - 入れ子にできる
    - 必要であれば `{_` と `_}` で囲むことで開き・閉じを強制できる
    - \[HTML\] `<em><em>this</em> text</em>*` → \[Djot\] `_{_this_} text_\*`

## Djotのうれしい記法

- ハイライト (mark)
  - `{=ここがハイライトされます=}`
- 挿入と取り消し線 (insert/delete)
  - `うちの上司は{-いじわる-}{+ナイス+}です`
- span
  - `[span]{.some-class #some-id some-key="some val"}.`
- div

```
{.warning}
:::
Watch out!
:::
```

※上記と同等のdiv

```
::: warning
Watch out!
:::
```


## Markdownユーザー向けのクイックスタート

<https://github.com/dai/djot/blob/main/doc/ja-quick-start-for-markdown-users.md>

- Djot Playground (<https://djot.net/playground/>) で試すことができる
- Pandocの最新版の場合 (現時点で3.3)
  - `-f djot` または `-t djot` で変換可能

## Djot：まとめ

- CommonMark
  - 人間にとって自然な読み方を可能にするために複雑なルールを持つ
- Djot
  - CommonMarkの複雑さを排除し、Markdownのよいところを維持した軽量マークアップ言語

# Typst

## 参考文献

- [Typst公式](https://typst.app/)
  - [GitHub - typst/typst](https://github.com/typst/typst)
- [Typst： いい感じのLaTeXの代替](http://www-het.phys.sci.osaka-u.ac.jp/~yamaguch/j/typst.html)

## Typstのインストール

```
# Linux (cargo)
$ cargo install typst-cli

# macOS
$ brew install typst
```

- VS Code: 次の拡張機能をインストール
  - Typst LSP (Nathan Varner)
  - vscode-pdf (tomoki1207)

## 素のTypstを試してみる

VS Codeで`hello.typ`ファイルを作成

```
こんにちは😊
```

→保存すると即座に`hello.pdf`が生成される

## もうちょっとレポートっぽくする

- [GitHub - satshi/typst-jp-template](https://github.com/satshi/typst-jp-template/tree/main)

```
#import "template.typ": *
#show: doc => jarticle(
  fontsize: 11pt,
  title: [夏に食べたいアイスについて],
  authors: ([藤原 惟],),
  date: [2024年8月18日],
  doc,
)

= 序論：夏とアイスの関係

夏は、気温の上昇により冷たい食べ物が特に求められる季節である。
```

## Pandocで変換する：Pandoc's Markdownで書く

example-pandoc.md

```
---
title: 夏に食べたいアイスについて
author: 藤原 惟
date: 2024年8月19日
---

# 序論：夏とアイスの関係

夏は、気温の上昇により冷たい食べ物が特に求められる季節である。
```

## Pandocで変換する：Pandoc側の設定

defaults.yaml

```
variables:
  mainfont: "Harano Aji Mincho"
  section-numbering: true
  papersize: a4
  lang: ja
```

※あえてテンプレートは使わず、Pandocのデフォルト設定を使う

## おまけ：Pandocがデフォルトで使うテンプレートファイルを見る

- テンプレートに埋め込まれている変数 or メタデータを確認する

```
$ pandoc -D typst | less
```

または <https://github.com/jgm/pandoc-templates>

## Pandocで変換する：ビルド

```
$ pandoc example-pandoc.md -s -d defaults.yaml -t typst -o example-pandoc.typ
```

- `-s` は `--standalone` の省略形（ヘッダ・フッタ付き文書）
- `-d` は `--defaults` の省略形（デフォルトファイルを読み込む）

```
$ typst compile example-pandoc.typ
```

## Typst：所感とまとめ

- Typstはいいぞ
  - ビルドが爆速なのが嬉しい
  - 日本語テンプレートは点在するが、LaTeXほど標準化されていない印象
  - マークアップの学習コスト低いし、もう素のTypstでいいんじゃない？
- Pandoc + Typstはがんばる必要あり
  - デフォルトのテンプレートが使いにくいので自作が必要
  - 既存のLaTeXやMarkdown文書の資産を移行するのには役立ちそう

## サンプルコード

- [GitHub - sky-y/pandoc-online-20240818](https://github.com/sky-y/pandoc-online-20240818)

# おわり