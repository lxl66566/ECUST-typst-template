#import "../fonts/font.typ": *

// 原创性声明和授权书
#let declaration(anonymous: false, signature: image("../assets/signature.png"), date: (2025, 5, 16)) = {
  set text(font: songti, 12pt)

  v(3em)
  align(center)[
    #text(font: heiti, size: 14pt, "作    者    声    明", weight: "bold")
  ]
  v(3em)
  text(font: songti, size: 12pt)[
    #set par(justify: false, leading: 0.95em, spacing: 0.95em, first-line-indent: 2em)
    我郑重声明：本人恪守学术道德，崇尚严谨学风。所呈交的毕业论文（设计），是本人在导师的指导下，独立开展工作所取得的结果。除文中明确注明和引用的内容外，本论文（设计）不包含任何他人已经发表或撰写过的内容。论文（设计）为本人亲自完成，并对所写内容负责。
  ]
  v(8.5em)
  align(right)[
    论文（设计）作者签名：
    #if not anonymous {
      box(signature, baseline: 50%)
    }
    #linebreak()
    #date.at(0) 年 #date.at(1) 月 #date.at(2) 日
  ]
}
