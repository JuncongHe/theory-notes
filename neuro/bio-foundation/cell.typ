#import "../../prelude.typ": *

#hd3("Neuron")

#hd4("Feature")
Neuron#index([neuron]), as the basic communication unit of the nervous system, has two features: *accuracy* and *efficiency*.

1. Accuracy: neurons have receptive denrites at the one end and a transmitting axon at the other end.
2. Efficiency:
  1. Neurons are both electrically and chemically excitable.
  2. Cell membrane of neurons contains ion channels and receptors that can receive and transmit signals; thereby are able to redistribute charges and induce wave of depolarization (moving towards the end of the axon), which is able to propagate the signal along the axon.

  #showybox()[
    *Polarization*: When the neuron is at resting state, the charges on either side of the cell membrane are asymmetry. Charge inside the neuron is relatively positive, while the charge outside is relatively negative (about -70 mV).

    *Depolarization*: When the neuron is excited, the ion channels uptake the positive charges ($"Na"^+$) from the outside to the inside of the neuron, making the potential less negative.
  ]

Glia#index([glia]) is also excitable, and can uptake ions as well as proteins that remove neurotransmitters from extralcellular space. Thus used as regulation of neuronal function.

#hd4("Morphology")
The *structural and functional diversity* of both neurons and glia depends on:
1. Neurons: dendritic morphology, pattern of axonal projections, and electrophysiological properties.
2. Glia: morphological, physiological, and biochemical features.

#showybox(title: "Morphology in Computational Neuroscience")[
  In computational neuroscience, morphology is studied in roughly three aspects:
    1. *How morphology decide the computational properties of the neuron*: the cable (axon and dendrite) properties are related to morphology of the nueron:
      - Different branches of the dendrite can have different ion channels (Na, Ca, K, ...)
      - Local dendritic structure can generate local deritric spikes (Na/Ca spike) or NMDA plateau
    2. *How morphology affect the connectivity and the dynamics of the network*: how neurons with various morphologies within a cortical area can form a functional network:
      - Morphology decides the pattern of connectivity
      - Morphology affects the conduction delay and timing structure
    3. *Is morphology continuous or discrete*: convert the morphology of a neuron to a high dimensional feature vector, to study:
      - Given features (e.g. genomes, morphologies, electrical properties, etc.), are they: independent clusters / manifolds / core clusters + continuum
      - Is is possible to predict the developmental generative process?
]

In vertebrate nervous system, glia can be categorized into two major classes:
1. *Macroglia*: contains
  - Oligodendrocytes: provide insulating myelin sheaths of the axons for some neurons in CNS
  - Schwann cells:
    1. provide insulating myelin sheaths of the axons for some neurons in PNS
    2. nonmyelinating Schwann cells play a role in promoting development, maintenance and repair of neuromuscular synapse
  - Astrocytes: support neurons and modulate neuronal signaling, maintain blood-brain barrier
2. *Microglia*

#image("../../assets/neuro/glial-cells.png")

#pagebreak()
