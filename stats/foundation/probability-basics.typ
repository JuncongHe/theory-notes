#import "../../prelude.typ": *

#hd3("Probability Basics") #index(["Probability Basics"])

#hd4("Probability")

The probability space is a triplet $(Omega, cal(F), P)$, where:

- $Omega$ is the sample space, the set of all possible outcomes.
- $cal(F)$ is the $sigma$-algebra of events, the set of all possible events.
- $P$ is the probability measure
$
  P: cal(F) -> [0, 1]
$

#hd4("sigma-algebra")

$sigma$-algebra on $Omega$ if it satisfies the following properties given a family of sets $cal(F) subset 2^Omega$:

1. $Omega in cal(F)$
2. $A in cal(F) arrow.double A^c in cal(F)$
3.
$
  A_1, A_2, dots in cal(F) arrow.double union.big_(i=1)^infinity A_i in cal(F)
$

Basically $cal(F)$ indicates what can be measured, in a way mathematically express the amount of information now we observe/distinguish

The bigger $cal(F)$ is, the more information we can observe/distinguish:
$
  cal(F)_0 = {emptyset.zero, Omega} subset cal(F)_1 = {emptyset.zero, {1,3,5}, {2,4,6}, Omega} subset cal(F)_2 = 2^Omega
$
meaning $cal(F)_2$ provides more information than $cal(F)_1$ and $cal(F)_1$ provides more information than $cal(F)_0$

where $2^Omega$ is the power set of $Omega$, which is the set of all subsets of $Omega$:
$
  2^Omega = P(Omega)
$
to get construct a subset of $Omega$, we either include or exclude each element of $Omega$, so $|2^Omega| = 2^{|Omega|}$



#hd4("Axioms")

Kolmogorov Axioms:

1.
$
  P(A) >= 0
$

2.
$
  P(Omega) = 1
$

3. If $A_1, A_2, \ldots$ are pairwise disjoint events, then
$
  P(union.big_(i=1)^infinity A_i) = sum_(i=1)^infinity P(A_i)
$

Given the axioms, we have consequence:
- (Disjoint Seperation) $A = (A \\ B) union.sq (A inter B)$, where $union.sq$ means disjoint union
- (Inclusion–Exclusion Formula) $P(A union B) = P(A) + P(B) - P(A inter B)$

  proof:
  $
    A union B &= (A \\ B) union.sq (B \\ A) union.sq (A inter B) \
    P(A union B) &= P(A \\ B) + P(B \\ A) + P(A inter B) \
    &=^"DS" P(A) - P(A inter B) + P(B) - P(A inter B) + P(A inter B) \
    &= P(A) + P(B) - P(A inter B)
  $

- (Symmetric difference) $P(A triangle B) = P(A) + P(B) - 2 P(A inter B)$

  proof:
  $
    A triangle B &= (A \\ B) union.sq (B \\ A) \
    P(A triangle B) &= P(A \\ B) + P(B \\ A) \
    &= P(A) - P(A inter B) + P(B) - P(A inter B) \
    &= P(A) + P(B) - 2 P(A inter B)
  $

- (Monotonicity) if $A subset.eq B$ then $P(A) <= P(B)$

  proof:
  $
    B &= (B \\ A) union.sq (B inter A) \
    &= (B \\ A) union.sq A \
    P(B) &= P(B \\ A) + P(A) >= P(A)
  $

- (Union Bound) $P(union.big_(i=1)^n A_i) <= sum_(i=1)^n P(A_i)$

  proof:

  This holds equal when $A_i$ are mutally disjoint, so we care about the overlaps.

  Let $D_i = A_i \\ union.big_(i=1)^(n-1) (A_i)$ indicates the change, so that
  $
    union.big_(i=1)^n A_i &= union.big.sq_(i=1)^n D_i \
    P(union.big_(i=1)^n A_i) &= P(union.big.sq_(i=1)^n D_i) \
    &= sum_(i=1)^n P(D_i)
  $
  because $D_i subset.eq A_i$, so $P(union.big_(i=1)^n A_i) = sum_(i=1)^n P(D_i) <= sum_(i=1)^n P(A_i)$

- (Symmetric Difference Bound) $|P(A)-P(B)|<=P(A triangle B)$

proof:
$
  P(A Delta B) =P(A \\ B) + P(B \\ A)
$
$
  P(A) &= P(A inter B) + P(A \\ B)\
  P(B) &= P(A inter B) + P(B \\ A)\
$
therefore
$
  P(A) - P(B) = P(A \\ B) - P(B \\ A) \
$
given
$
  |x-y|<=x+y
$
then
$
  |P(A) - P(B)| &= |P(A \\ B) - P(B \\ A)| \
  &<= P(A \\ B) + P(B \\ A) = P(A triangle B)
$
