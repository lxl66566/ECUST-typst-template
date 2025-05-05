#import "../fonts/font.typ": *
#import "../utilities/indent-funs.typ": *

// 致谢，请手动调用
#let acknowledgement(body) = {
  // 这个取消目录里的 numbering
  set heading(level: 1, numbering: none)
  show <_thx>: (
    {
      // 这个取消展示时的 numbering
      set heading(level: 1, numbering: none)
      set align(center)
      set text(weight: "regular", font: heiti, size: 字号.小二)

      "致谢"
    }
      + empty_par()
  )


  [= 致谢 <_thx>]

  body
}
