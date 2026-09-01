#import "../prelude.typ": *
#import "bio-foundation.typ": neuro_bio_foundation

#let neuro_index(include_bibliography: true) = [
  #hd1("Neuroscience")
  #pagebreak()

  #neuro_bio_foundation(include_bibliography: false)

  #if include_bibliography {
    pagebreak()
    bibliography("/ref.bib", style: "ieee", title: "参考文献")
  }
]

#neuro_index(include_bibliography: false)
