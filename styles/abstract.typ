#let abstract(
  title: "Abstract",
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

  heading(title, outlined: false)

  body
}
