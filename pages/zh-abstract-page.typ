#import "../fonts/font.typ": *

// 中文摘要
#let zh_abstract_page(abstract, keywords: ()) = {
  set heading(level: 1, numbering: none)
  show <_zh_abstract_>: {
    align(center)[
      #text(font: heiti, size: 字号.小二, "摘要")
    ]
  }
  [= 摘要 <_zh_abstract_>]

  set text(font: songti, size: 字号.小四)

  abstract
  par(first-line-indent: 0em)[
    #text(weight: "bold", font: heiti, size: 字号.小四)[
      关键词：
    ]
    #text(weight: "regular", font: songti, size: 字号.小四)[
      #keywords.join("，")
    ]
  ]
}
