#import "../thesis-function.typ": *
#import "config/utils/todo.typ": TODO
#import "config/utils/print-page-break.typ": print-page-break
#import "config/titlepage.typ": *
#import "config/acknowledgement.typ": *
#import "config/disclaimer.typ": *
#import "config/abstract.typ": *
#import "@preview/abbr:0.1.1"

#let title-english = "Towards Smart Inventions and their Novelty"
#let author = "Findus"
#let is-print = false
#let degree = "Master"
#let submission-date = datetime.today() // or use: datetime(day: 1, month: 1, year: 2025)

#let body-font = "New Computer Modern"
#let sans-font = "New Computer Modern Sans"
#show math.equation: set text(weight: 400)

#set document(title: title-english, author: author)

#titlepage(
  title: title-english,
  title-german: "Über schlaue Erfindungen und deren Neuartigkeit",
  degree: degree,
  institute: "Institut für schlaue Erfindungen",
  program: "Tüfteln und Basteln",
  company: "Pettersson's Patentideen",
  university: "Universität Småland",
  supervisor: "Pettersson",
  advisor: "Gustravsson",
  submission-date: submission-date,
  place: "Lübeck",
  top-left-img: image("images/top-left.png"),
  top-right-img: image("images/top-right.png"),
  slogan-img: image("images/slogan.png"),
)
#print-page-break(print: is-print, to: "even")

#set page(
  margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
  numbering: "i",
  number-align: center,
)
#disclaimer(
  degree: degree,
  author: author,
  submission-date: submission-date
)
#print-page-break(print: is-print)

#acknowledgement(include "texts/acknowledgement.typ")
#print-page-break(print: is-print)

#abstract(lang: "en", include "texts/abstract-en.typ")
#abstract(lang: "de", include "texts/abstract-de.typ")
#pagebreak()

#set text(
  font: body-font, 
  size: 12pt, 
  lang: "en"
)

// --- Headings ---
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

// --- Paragraphs ---
#set par(leading: 1em)

// --- Citations ---
#set cite(style: "alphanumeric")

// --- Figures ---
#show figure: set text(size: 0.85em)

// --- Table of Contents ---
#[
  // Make chapter bold but only in the TOC
  #show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(text(it, font: sans-font))
  }

  #outline(
    title: {
      text(font: body-font, 1.5em, weight: 700, "Contents")
      v(15mm)
    },
    indent: 2em
  )
]
#pagebreak()

// List of acronyms
#include "texts/acronyms.typ"
#abbr.list(title: "List of acronyms")
#pagebreak()

// Main body.
#set par(justify: true, first-line-indent: 2em)
#set page(
  numbering: "1",
)
// start at page 1 again
#counter(page).update(1)

#TODO[
  Write your thesis here!
]
#include "texts/tutorial.typ"

#pagebreak()
#bibliography("thesis.bib")

// List of figures.
#pagebreak()
#heading(numbering: none)[List of Figures]
#outline(
  title:"",
  target: figure.where(kind: image),
)

  // List of tables.
#pagebreak()
#heading(numbering: none)[List of Tables]
#outline(
  title: "",
  target: figure.where(kind: table)
)

// Appendix.
#pagebreak()
#include "texts/appendix.typ"