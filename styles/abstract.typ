#let abstract(
  title: "Abstract",
  language: "en",
  body-font: "",
  dark-color: black,
  body
) = {
  set text(
    font: body-font, 
    size: 11pt
  )
  set par(
    leading: 1em,
    justify: true
  )
  set text(lang: language)

  heading(title, outlined: false)

  body
}
