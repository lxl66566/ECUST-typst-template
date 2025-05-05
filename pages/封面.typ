#import "../fonts/font.typ": *

#let paper_cover(
  cover_logo_path: "../assets/ecust.jpg",
  anonymous,
  title,
  title2,
  school,
  department,
  major,
  grade,
  id,
  author,
  mentor,
  date,
) = {
  align(center)[
    // logo
    #v(28pt)

    // 匿名化处理需要去掉个人、机构信息
    #let logo_path = if not anonymous {
      cover_logo_path
    } else {
      "../assets/black.png"
    }
    #image(logo_path, width: 9.55cm, height: 2.4cm)
    #v(-15pt)

    #text(
      size: 40pt,
      font: zhongsong,
      weight: "bold",
      tracking: 5pt, // 字间距加宽
    )[毕业论文(设计)]

    #v(53pt)

    #let info_value(body) = {
      rect(
        width: 100%,
        inset: 2pt,
        stroke: (
          bottom: 1pt + black,
        ),
        text(
          font: zhongsong,
          size: 字号.小二,
          bottom-edge: "descender",
        )[
          #body
        ],
      )
    }

    #let info_key(body) = {
      rect(
        width: 100%,
        inset: 2pt,
        stroke: none,
        text(
          font: zhongsong,
          size: 字号.小二,
          body,
        ),
      )
    }

    #grid(
      columns: (90pt, 200pt),
      rows: 31pt,
      column-gutter: 0pt,
      row-gutter: 0pt,
      info_key("题        目"),
      info_value(if not anonymous {
        title
      } else { "████████████" }),

      [],
      info_value(if not anonymous {
        title2
      } else { "████████████" }),

      info_key("学        院"), info_value(if not anonymous { school } else { "██████████" }),
      info_key("系        别"), info_value(if not anonymous { department } else { "██████████" }),
      info_key("专        业"), info_value(if not anonymous { major } else { "██████████" }),
      info_key("年        级"), info_value(if not anonymous { grade } else { "██████████" }),
      info_key("学        号"), info_value(if not anonymous { id } else { "██████████" }),
      info_key("姓        名"), info_value(if not anonymous { author } else { "██████████" }),
      info_key("导        师"), info_value(if not anonymous { mentor } else { "██████████" }),
    )

    #v(75pt)

    #text(
      font: zhongsong_pure,
      size: 字号.小二,
    )[
      定稿日期： #date.at(0) 年 #date.at(1) 月 #date.at(2) 日
    ]
    #pagebreak()
  ]
}
