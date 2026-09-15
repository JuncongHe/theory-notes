#import "../../prelude.typ": *

#hd3("Counting Taxonomy")

#table(
  columns: (1.2fr, 1fr, 1fr),
  inset: (x: 0pt, y: 8pt),
  stroke: (x: none, y: 0.5pt + luma(80%)),
  align: left,
  [], [*Ordered*], [*Unordered*],
  [*with replacement*], [sequences], [multiset],
  [*without replacement*], [permutations], [combinations],
)

1. ordered with replacement:

  Suppose $S = {1, 2, dots, n}$, an outcome is a sequence ${a_1, a_2, dots, a_k}$ where $a_i in S$.

  Therefore $Omega=S^k, |Omega|=n^k$

2. ordered without replacement:

  Suppose $S = {1, 2, dots, n}$, an outcome is a permutation ${a_1, a_2, dots, a_k}$

  Therefore
  $
    Omega = {(a_1, a_2, dots, a_k) in S^k: a_i eq.not a_j "whenever" i eq.not j}
  $
  and
  $
    |Omega| = n (n-1) dots (n-k+1) = (n!)/((n-k)!) = P(n,k)
  $
