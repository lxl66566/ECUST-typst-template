
// 默认本科生毕业论文的页面设置 (CSE 格式)
#import "../fonts/font.typ": *

// 页面大小
#let _set_paper_page_size(body) = {
  set page(
    paper: "a4",
    margin: (
      top: 2.8cm,
      bottom: 2.5cm,
      left: 2.5cm,
      right: 2.5cm,
    ),
  )

  body
}

// 页面布局
#let _set_paper_page_par(body) = {
  set text(font: songti, 12pt)
  set par(justify: true, leading: 1.24em, first-line-indent: 2em)
  show par: set block(spacing: 1.24em)

  body
}

// 页眉
#let _set_paper_page_header(anonymous: false, title: "默认标题", show_page: true, body) = {
  set page(
    margin: (
      top: 3.17cm,
    ),
    header-ascent: 18pt,
    header: {
      set text(font: songti, 字号.五号, baseline: 8pt, spacing: 2pt)
      grid(
        columns: (5fr, 1fr),
        {
          set align(left)

          if not anonymous {
            title
          } else {
            [█████████████████████████]
          }
        },
        {
          if show_page {
            set align(right)
            context { counter(page).display("1") }
          }
        },
      )

      line(length: 100%, stroke: 0.1pt)
    },
  )

  // v(2em)
  body
}

// 摘要部分页脚
#let _set_paper_page_footer_pre(body) = {
  set page(
    margin: (
      bottom: 3.7cm,
    ),
    footer: {
      set align(center)
      context { text(font: songti, 字号.五号, baseline: 0pt, counter(page).display("I")) }
    },
  )

  body
}

// 正文部分页脚
#let _set_paper_page_footer_main(body) = {
  set page(
    footer: none,
    margin: (
      bottom: 2cm,
    ),
  )
  body
}
