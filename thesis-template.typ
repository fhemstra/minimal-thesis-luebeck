#import "@preview/abbr:0.2.1":
#import "utils/todo.typ": TODO
#import "utils/print-page-break.typ": print-page-break
#import "styles/acknowledgement.typ": *
#import "styles/abstract.typ": *
#import "styles/toc.typ": *
#import "styles/disclaimer.typ": *
#import "styles/titlepage.typ": *

#let thesis(
  title-english: none,
  title-german: none,
  author: none,
  degree: none,
  submission-date: datetime.today(),
  institute: none,
  program: none,
  company: none,
  university: none,
  supervisor: none,
  advisor: none,
  place: none,
  top-left-img: none,
  top-right-img: none,
  slogan-img: none,
  acknowledgement-text: none,
  appendix: none,
  abstract-en: none,
  abstract-de: none,
  confidentiality-notice: none,
  abbreviations: none,
  bib-file: none,
  body-font: none,
  sans-font: none,
  dark-color: black,
  light-color: gray,
  is-print: false,
  make-list-of-figures: false,
  make-list-of-tables: false,
  body
) = {
  set document(title: title-english, author: author)

  // #############################################
  // ################# Settings ##################
  // #############################################
  let body-font = "New Computer Modern"
  let sans-font = "New Computer Modern Sans"
  set text(
    font: body-font, 
    size: 11pt, 
    lang: "en"
  )
  // Heading style
  show heading: set block(below: 0.85em, above: 1.75em)
  show heading: set text(font: sans-font, fill: dark-color)
  // Heading outline and numbers
  show heading.where(level: 4): set heading(outlined: false, numbering: none)
  show heading.where(level: 5): set heading(outlined: false, numbering: none)
  show heading.where(level: 6): set heading(outlined: false, numbering: none)
  // Reference first-level headings as "chapters"
  show ref: it => {
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
  show math.equation: set text(weight: 400)
  // Count headings and number equations
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }
  set math.equation(numbering: num =>
    numbering("(1.1)", counter(heading).get().first(), num)
  )
  // Paragraphs
  set par(leading: 1em)
  // Figures
  show figure: set text(size: 11pt)
  // Links
  show link: underline
  // #############################################
  // ############## End of Settings ##############
  // #############################################

  // --- Title ---
  titlepage(
    top-left-img: top-left-img,
    top-right-img: top-right-img,
    title-english: title-english,
    title-german: title-german,
    degree: degree,
    institute: institute,
    program: program,
    university: university,
    company: company,
    author: author,
    supervisor: supervisor,
    advisor: advisor,
    place: place,
    submission-date: submission-date,
    slogan-img: slogan-img,
    dark-color: dark-color,
    light-color: light-color,
    sans-font: sans-font
  )
  print-page-break(print: is-print, to: "even")

  // --- Disclaimer ---
  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: "i",
    number-align: center,
  )
  disclaimer(body-font, author, [
    Eidesstattliche Erklärung

    Ich erkläre hiermit an Eides statt, dass ich diese Arbeit selbständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe.
  ])
  print-page-break(print: is-print)

  // --- Confidentiality notice ---
  if confidentiality-notice != none {
    heading("Sperrvermerk", outlined: false)
    confidentiality-notice
    print-page-break(print: is-print)
  }

  // --- Acknowledgement ---
  acknowledgement(body-font: body-font, sans-font: sans-font, dark-color: dark-color, acknowledgement-text)
  print-page-break(print: is-print)

  // --- Abstract ---
  v(0.5fr) // these insert fractions of vertical space
  abstract(title: "Abstract", language: "en", body-font: body-font, dark-color: dark-color, abstract-en)
  v(1fr)
  abstract(title: "Zusammenfassung", language: "de", body-font: body-font, dark-color: dark-color, abstract-de)
  v(1fr)
  pagebreak()

  // --- Table of contents ---
  toc(body-font: body-font, sans-font: sans-font, dark-color: dark-color)
  pagebreak()

  // Turn off heading numbers and outline for now
  set heading(numbering: none, bookmarked: true, outlined: false)
  // --- List of figures ---
  if make-list-of-figures {
    heading[List of Figures]
    outline(
      title:"",
      target: figure.where(kind: image),
    )
    pagebreak()
  }

  // --- List of tables ---
  if make-list-of-tables {
    heading[List of Tables]
    outline(
      title: "",
      target: figure.where(kind: table)
    )
    pagebreak()
  }

  // --- List of abbreviations ---
  if abbreviations != none {
    abbreviations
    pagebreak()
  }

  // --- Main body ---
  set par(justify: true, first-line-indent: 2em)
  set page(
    numbering: "1",
  )
  // start at page 1 again
  counter(page).update(1)
  set heading(numbering: "1.1", bookmarked: true, outlined: true)

  body

  // --- Bibliography ---
  pagebreak()
  bib-file

  if appendix != none {
    // --- Appendix ---
    set heading(numbering: none)
    pagebreak()
    set math.equation(numbering: "(1)")
    heading("Appendix")

    appendix
  }
}
