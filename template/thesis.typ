#import "../thesis-template.typ": *

#let title-english = "Towards Smart Inventions and their Novelty"
#let title-german = "Über schlaue Erfindungen und deren Neuartigkeit"
#let author = "Findus"
#let degree = "Master"
#let submission-date = datetime.today() // or use: datetime(day: 1, month: 1, year: 2025)
#let institute = "Institut für schlaue Erfindungen"
#let program = "Tüfteln und Basteln"
#let company = "Pettersson's Patentideen"
#let university = "Universität Småland"
#let supervisor = "Pettersson"
#let advisor = "Gustravsson"
#let place = "Lübeck"
#let top-left-img = image("images/top-left.png")
#let top-right-img = image("images/top-right.png")
#let slogan-img = image("images/slogan.png")
#let acknowledgement-text = include "texts/acknowledgement.typ"
#let appendix = include "texts/appendix.typ"
#let abbreviations = include "texts/abbreviations.typ"
#let abstract-en = include "texts/abstract-en.typ"
#let abstract-de = include "texts/abstract-de.typ"
#let bib-file = bibliography("thesis.bib")
#let is-print = false
#let body-font = "New Computer Modern"
#let sans-font = "New Computer Modern Sans"

#show: thesis.with(
  title-english: title-english,
  title-german: title-german,
  author: author,
  degree: degree,
  submission-date: submission-date,
  institute: institute,
  program: program,
  company: company,
  university: university,
  supervisor: supervisor,
  advisor: advisor,
  place: place,
  top-left-img: top-left-img,
  top-right-img: top-right-img,
  slogan-img: slogan-img,
  acknowledgement-text: acknowledgement-text,
  appendix: appendix,
  abstract-en: abstract-en,
  abstract-de: abstract-de,
  abbreviations: abbreviations,
  bib-file: bib-file,
  is-print: is-print,
  body-font: body-font,
  sans-font: sans-font
)

= Fist Chapter
#TODO[
  Write your thesis here! Just start typing.
]

// You can remove this when you are done looking at the examples.
#include "texts/tutorial.typ"
