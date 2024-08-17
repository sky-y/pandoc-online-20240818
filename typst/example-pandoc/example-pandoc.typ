// Some definitions presupposed by pandoc's typst output.
#let horizontalrule = [
  #line(start: (25%,0%), end: (75%,0%))
]

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]
#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#set table(
  inset: 6pt,
  stroke: none
)

#let content-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content-to-string).join("")
  } else if content.has("body") {
    content-to-string(content.body)
  } else if content == [ ] {
    " "
  }
}
#let conf(
  title: none,
  subtitle: none,
  authors: (),
  keywords: (),
  date: none,
  abstract: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: (),
  fontsize: 11pt,
  sectionnumbering: none,
  doc,
) = {
  set document(
    title: title,
    author: authors.map(author => content-to-string(author.name)),
    keywords: keywords,
  )
  set page(
    paper: paper,
    margin: margin,
    numbering: "1",
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)

  if title != none {
    align(center)[#block(inset: 2em)[
      #text(weight: "bold", size: 1.5em)[#title]
      #(if subtitle != none {
        parbreak()
        text(weight: "bold", size: 1.25em)[#subtitle]
      })
    ]]
  }

  if authors != none and authors != [] {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[Abstract] #h(1em) #abstract
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
#show: doc => conf(
  title: [夏に食べたいアイスについて],
  authors: (
    ( name: [藤原 惟],
      affiliation: "",
      email: "" ),
    ),
  date: [2024年8月19日],
  lang: "ja",
  paper: "a4",
  font: ("Harano Aji Mincho",),
  cols: 1,
  doc,
)


= 序論：夏とアイスの関係
<序論夏とアイスの関係>
夏は、気温の上昇により冷たい食べ物が特に求められる季節である。中でもアイスは、その冷たさと甘さによって、身体を涼しく保ちながら、爽快感と癒しを提供する特別な存在である。アイスが夏に人気を博する背景には、歴史的に暑さをしのぐための冷却技術の発展と、嗜好品としての多様なアイスが普及したことが挙げられる。本論文では、夏に食べたいアイスの種類や文化、そしてその魅力について考察する。

= 第1章：アイスの種類と特性
<第1章アイスの種類と特性>
== ソフトクリーム、ジェラート、かき氷などの多様な選択肢
<ソフトクリームジェラートかき氷などの多様な選択肢>
== 各アイスの製造方法と風味の特徴
<各アイスの製造方法と風味の特徴>
= 第2章：日本における夏のアイス文化
<第2章日本における夏のアイス文化>
== 地域ごとの人気アイスとその文化的背景
<地域ごとの人気アイスとその文化的背景>
== 夏祭りやイベントにおけるアイスの重要性
<夏祭りやイベントにおけるアイスの重要性>
= 第3章：アイスがもたらす心理的・生理的効果
<第3章アイスがもたらす心理的生理的効果>
== 冷たい食品が与える身体的リフレッシュ効果
<冷たい食品が与える身体的リフレッシュ効果>
== 食べる楽しみがもたらす心の安らぎ
<食べる楽しみがもたらす心の安らぎ>
= 第4章：健康的なアイスの選び方
<第4章健康的なアイスの選び方>
== 低カロリーや無添加アイスの人気
<低カロリーや無添加アイスの人気>
== 健康志向の消費者が注目する成分や栄養価
<健康志向の消費者が注目する成分や栄養価>
= 結論：夏に最適なアイスの未来
<結論夏に最適なアイスの未来>
== アイス産業の未来と消費者トレンド
<アイス産業の未来と消費者トレンド>
== 夏に食べたいアイスの選び方の提案
<夏に食べたいアイスの選び方の提案>
