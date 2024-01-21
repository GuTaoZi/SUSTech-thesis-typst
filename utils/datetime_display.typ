#let datetime_display_zh(date) = {
  date.display("[year] 年 [month] 月 [day] 日")
}

#let datetime_display_en(date) = {
  date.display("[month repr:short] [day], [year]")
}