#import "@preview/abbr:0.1.1"
#import "utils/todo.typ": TODO
#import "utils/print-page-break.typ": print-page-break
#import "texts/metadata.typ": *
#import "utils/bib_state.typ": *
#import "styles/acknowledgement.typ": *
#import "styles/abstract.typ": *
#import "styles/toc.typ": *
#import "styles/disclaimer.typ": *
#import "styles/titlepage.typ": *

#set document(title: title-english, author: author)

// #############################################
// ################# Settings ##################
// #############################################
#let body-font = "New Computer Modern"
#let sans-font = "New Computer Modern Sans"
#set text(
  font: body-font, 
  size: 12pt, 
  lang: "en"
)
// Headings
#show heading: set block(below: 0.85em, above: 1.75em)
#show heading: set text(font: sans-font)
#set heading(numbering: "1.1")
// Reference first-level headings as "chapters"
#show ref: it => {
  let el = it.element
  if el != none and el.func() == heading and el.level == 1 {
    [Chapter ]
    numbering(
      el.numbering,
      ..counter(heading).at(el.location())
    )
  } else {
    it
  }
}
// Math
#show math.equation: set text(weight: 400)
// Paragraphs
#set par(leading: 1em)
// Citations
#set cite(style: "alphanumeric")
// Figures
#show figure: set text(size: 0.85em)
// Bibliography
#bib_state.update(none)
// #############################################
// ############## End of Settings ##############
// #############################################

// --- Title ---
#titlepage()
#print-page-break(print: is-print, to: "even")

// --- Disclaimer ---
#set page(
  margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
  numbering: "i",
  number-align: center,
)
#disclaimer([
  Eidesstattliche Erklärung

  Ich erkläre hiermit an Eides statt, dass ich diese Arbeit selbständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe.
])
#print-page-break(print: is-print)

// --- Acknowledgement ---
#acknowledgement([
  Write your acknowledgement here or leave it out if you do not want one.
  #lorem(50)
])
#print-page-break(print: is-print)

// --- Abstract ---
#v(1fr) // these insert 1 fraction of vertical space
#abstract(title: "Abstract", language: "en", [
  Write your english abstract here.
  #lorem(80)
])
#v(1fr)
#abstract(title: "Zusammenfassung", language: "de", [
  Schreibe deine deutsche Zusammenfassung hier.
  #lorem(80)
])
#v(1fr)
#pagebreak()

// --- Table of contents ---
#toc()
#pagebreak()

// --- List of acronyms ---
#include "texts/acronyms.typ"
#abbr.list(title: "List of acronyms")
#pagebreak()

// --- Main body ---
#set par(justify: true, first-line-indent: 2em)
#set page(
  numbering: "1",
)
// start at page 1 again
#counter(page).update(1)

#include "thesis.typ"

// --- Bibliography ---
#pagebreak()
#bibliography("thesis.bib")

// --- List of figures ---
#pagebreak()
#heading(numbering: none)[List of Figures]
#outline(
  title:"",
  target: figure.where(kind: image),
)

// --- List of tables ---
#pagebreak()
#heading(numbering: none)[List of Tables]
#outline(
  title: "",
  target: figure.where(kind: table)
)

// --- Appendix ---
#pagebreak()
#set heading(numbering: none)

= Appendix
If you need one, write your appendix here.
#lorem(100)