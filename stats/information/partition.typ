#import "../../prelude.typ": *

#hd3("Partition")
#index([Partition])

#hd4("Indistinguishability")

Let finite probability space $(Omega, cal(F), P)$, and a partition of $Omega$:
$
  Pi = {B_1, B_2, dots, B_n}
$

A partition defines a distingushability structure, tells us which events are not distinguishable. If samples $omega, omega'$ are in the same partition cell $B_i$, then we cannot distinguish them only by observing the partition label.

We call this equivalence relation, written as:
$
  omega tilde_Pi omega'
$
satisfying:
1. reflexive: $omega tilde_Pi omega$
2. symmetric: $omega tilde_Pi omega' arrow omega' tilde_Pi omega$
3. transitive: $omega tilde_Pi omega' and omega' tilde_Pi omega'' arrow omega tilde_Pi omega''$

This tells us: events within a same partition cell are equivalent under this information resolution.

#hd4("Preimage")

Consider an event $C subset.eq Omega$, to determine if $C$ happens only observing the partition cell, $C$ must be a union of partition cells, i.e. there exists an index set $I subset.eq {1,2, dots, n}$ such that:
$
  C = union.big_(i in I) B_i
$

$C$ is called preimage, defined as:
$
  B_y = Y^(-1)({y}) = {omega in Omega: Y(omega) = y}
$

// 左图选取完整原子；右图切开原子，无法仅凭分割标签判定。
#figure(
  {
    let selected = rgb("#c9e5f5")
    let cell(label, fill: white) = rect(
      width: 65pt, height: 42pt, inset: 0pt,
      stroke: 0.6pt + black, fill: fill,
      align(center + horizon, label),
    )
    set text(size: 9pt)
    set par(justify: false)
    grid(
      columns: (1fr, 1fr), gutter: 16pt,
      align(center)[
        *Union of whole cells*

        $Omega$

        #grid(
          columns: 2, gutter: 0pt,
          cell([$B_1$], fill: selected), cell([$B_2$]),
          cell([$B_3$]), cell([$B_4$], fill: selected),
        )

        $C = B_1 union B_4 in sigma(Pi)$
      ],
      align(center)[
        *Only part of a cell*

        $Omega$

        #grid(
          columns: 2, gutter: 0pt,
          cell([
            #place(top + left, rect(
              width: 32.5pt, height: 42pt,
              fill: selected, stroke: none,
            ))
            #place(center + horizon)[$B_1$]
          ]),
          cell([$B_2$]), cell([$B_3$]), cell([$B_4$]),
        )

        $emptyset subset.neq D subset.neq B_1$

        $D in.not sigma(Pi)$
      ],
    )
  },
) <fig-partition-atoms>

#hd4("Observation Functions")

To explain, let's define an observation function:
$
  T: Omega arrow cal(S)={s_1, s_2, dots, s_n}
$
where $cal(S)$ is a set of states, these states can be values, labels, or any other information we can observe.
$
  T(omega) = s_i arrow.double.l.r.long omega in B_i
$
then we are only able to observe $T(omega)$ (i.e. the state $s_i$) if hidden state is $omega$, which equivalent to observing the partition cell $B_i$. The information flow is:
$
  omega arrow.long^T s_i arrow.long.l.r B_i
$
where we lost information in $T$.

#hd4("Generated Sigma-Algebra and Atoms")

All possible events we can determine only observing the partition cell, is defined as generated $sigma$-algebra given by:
$
  cal(G)_Pi = {union.big_(i in I) B_i: I subset.eq {1,2, dots, k}}
$
denoted as $cal(G)_Pi = sigma(Pi)$. This also illustrates the amount of information provided by $T$.

$B_i$ are called atoms of $cal(G)_Pi$, which is the finest distinguishable structure we can observe only observing the partition cell.

Besides the observation $T$, suppose there exists another quantity we are interested in (usually is: what does this observation tell us), denoted as $Y(omega)$. $Y$ is $sigma(T)$-measurable if $T(omega) arrow Y(omega)$, i.e.
$
  exists g space s.t. space Y = g circle.small T
$

#hd4("Conditional Probability of A Given Information")

Consider now we condition on more than an event, that we actually know a $sigma$-algebra $cal(G) subset.eq cal(F)$, let:
$
  cal(G) = sigma(B_1, B_2, dots, B_n)
$
are generated from partition, then conditional probability is not a number, but a random variable that has different values in different partition cells. For any event $A$, we have:
$
  P(A|cal(G)) = sum_i P(A|B_i) indicator_(B_i)
$
if $omega in B_i$, then:
$
  P(A|cal(G))(omega) = P(A|B_i)
$
This random variable satisfies:
1. Constant in a same partition cell: 

  This is beacuse we are only allowed to use the information of partition.

  Let forcast (probability of happening given partition information) $Q_A : Omega arrow [0,1]$, then
  $
    Q_A (omega)=P(A|B_i), space.quad "whenever"space omega in B_i
  $
  equivalently:
  $
    Q_A = sum_i P(A|B_i) indicator_(B_i) = sum_i q_i indicator_(B_i)
  $
2. Local probability consistency:

  For all distinguishable partition cell $B_i$, the forcast probability must be the same as the original probability:
  $
    q_i = P(A inter B_i)/P(B_i) = P(A|B_i)
  $
  proof:
  $
    integral_(B_i) Q_A d P = P(A inter B_i)
  $
  therefore:
  $
    integral_B_i q_i d P &= P(A inter B_i) \
    q_i integral 1 d P &= P(A inter B_i) \
    q_i P(B_i) &= P(A inter B_i) \
    q_i &= P(A inter B_i)/P(B_i) = P(A|B_i)
  $

A more general situation, consider $C in cal(G)$, then
$
  bb(E)[Q_A indicator_C] = P(A inter C) space.quad forall C in cal(G)
$
proof:

for any $C in cal(G)$, we can write it as a union of partition cells:
$
  C = union.big_(i in I) B_i  
$
therefore, the intergral can be written into a sumation:
$
  bb(E)[Q_A indicator_C] &= integral_C Q_A d P = sum_(i in I) q_i P(B_i)\
  &=sum_(i in I) P(A inter B_i) = P(A inter C)
$

Consider $Q_A = P(A|cal(G))$

#hd4("Conditional Expectation")

Random variable $X$ is integrable if $E[|X|]<infinity$.

#hd4("Refinement")

Consider two partitions:
$
  Pi &= {B_1, B_2, dots, B_k} \
  Pi' &= {C_1, C_2, dots, C_m}
$
$Pi'$ is a refinement of $Pi$ if any $C_j$ is contained in some $B_i$:
$
  forall j, exists i space.quad s.t. space.quad C_j subset.eq B_i
$
therefore any $B_i$ can be written as a union of more refined cells $C_j$:
$
  B_i = union.big_(j:C_j subset.eq B_i) C_j
$
which is:
$
  sigma(Pi) subset.eq sigma(Pi')
$
