#import "../fonts/font.typ": *

#let en_abstract_page(abstract, keywords: ()) = {
  set heading(level: 1, numbering: none)
  show <_en_abstract_>: {
    align(center)[
      #text(font: "Times New Roman", size: 18pt, "Abstract", weight: "bold")
    ]
  }
  [= Abstract <_en_abstract_>]

  set text(font: "Times New Roman", size: 字号.小四)

  abstract
  par(first-line-indent: 0em)[
    #text(weight: "bold", font: "Times New Roman", size: 字号.小四)[
      Keywords:
    ]
    #text(weight: "regular", font: "Times New Roman", size: 字号.小四)[
      #keywords.join(",")
    ]
  ]
}
