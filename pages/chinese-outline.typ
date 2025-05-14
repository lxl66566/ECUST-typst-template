#import "../fonts/font.typ": *



#let chinese_outline() = {
  align(center)[
    #text(font: heiti, size: 字号.小二, "目录")
  ]

  set text(font: songti, size: 12pt)
  // 临时取消目录的首行缩进
  set par(leading: 1.24em, first-line-indent: 0pt)
  context {
    // 目录页码以 I 开始，需要重置一次
    counter(page).update(1)

    let loc = here()
    let 填充(n) = {
      box(width: 1fr, h(0.5em) + box(width: 1fr, repeat[.]) + h(0.5em))
      [#n]
      linebreak()
    }
    let elements = query(heading.where(outlined: true))
    for el in elements {
      if el.level > 3 {
        continue
      }

      // 是否有 el 位于前面，前面的目录中用拉丁数字，后面的用阿拉伯数字
      let before_toc = query(heading.where(outlined: true).before(loc)).find(one => { one.body == el.body }) != none
      let page_num = if before_toc {
        numbering("I", counter(page).at(el.location()).first())
      } else {
        counter(page).at(el.location()).first()
      }

      link(el.location())[#{
          // acknoledgement has no numbering
          let chapt_num = if el.numbering != none {
            numbering(el.numbering, ..counter(heading).at(el.location()))
          } else { none }

          if el.level == 1 {
            set text(font: heiti, size: 字号.四号)
            // 段前、段后为12磅
            block(
              above: 0pt,
              below: 0pt,
              inset: (top: 12pt, bottom: 12pt, left: 0pt, right: 0pt),
              {
                if chapt_num == none { } else {
                  chapt_num
                  " "
                }
                el.body
                填充(page_num)
              },
            )
          } else if el.level == 2 {
            set text(font: heiti, size: 字号.小四)
            block(
              above: 0pt,
              below: 0pt,
              inset: (top: 6pt, bottom: 6pt, left: 0pt, right: 0pt),
              {
                "    "
                chapt_num
                " "
                el.body
                填充(page_num)
              },
            )
          } else {
            set text(font: heiti, size: 字号.五号)
            block(
              above: 0pt,
              below: 0pt,
              inset: (top: 6pt, bottom: 6pt, left: 0pt, right: 0pt),
              {
                "        "
                chapt_num
                " "
                el.body
                填充(page_num)
              },
            )
          }
        }]

      // 填充 ......
      // box(width: 1fr, h(0.5em) + box(width: 1fr, repeat[.]) + h(0.5em))
      // [#page_num]
      // linebreak()
    }
  }
}
