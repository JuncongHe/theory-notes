#import "../prelude.typ": *

#let neuro_bio_foundation(include_bibliography: true) = [
  #hd2("Bio-Foundation")

  #include "bio-foundation/cell.typ"
  #include "bio-foundation/ion-channels.typ"
  #include "bio-foundation/synapse.typ"
  #include "bio-foundation/sensory-circuits.typ"

  #if include_bibliography {
    pagebreak()
    bibliography("/ref.bib", style: "ieee", title: "参考文献")
  }
]

#neuro_bio_foundation(include_bibliography: false)
