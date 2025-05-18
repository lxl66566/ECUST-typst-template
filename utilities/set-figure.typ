#import "../fonts/font.typ": *

// 设置图表
#let _set_figure(body) = {
  // 设置前缀
  show figure.where(kind: image): set figure(supplement: [图])
  show figure.where(kind: table): set figure(supplement: [表])
  show figure.where(kind: raw): set figure(supplement: [代码])
  show figure.where(kind: table): set figure.caption(position: top)

  // 使用正确的编号与图表标题字体及分隔符
  show figure.caption: set text(font: songti, size: 字号.五号, weight: "bold")
  set figure.caption(separator: " ")

  // 设置代码块字体，其中中文默认使用宋体。
  show raw: set text(font: ("Consolas", "SimSun"))

  set math.equation(supplement: [公式])

  body
}
