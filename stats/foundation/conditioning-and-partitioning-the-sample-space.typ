#import "../../prelude.typ": *

#hd3("Conditioning and Partitioning the Sample Space")
#index([Conditioning and Partitioning the Sample Space])

Playing with sample space will introduce conditional probability, independence and Baye's rule.

#hd4("Conditional probability")

For any event $A$, if we know event $B$ happens, then we can restrict sample space from $Omega$ to $B$, then
$
  P(A|B) = P(A inter B)/P(B),space.quad P(B)>0
$
where measure $P(dot|B)$ satisfies axioms.

#hd4("Independence")

If event $A$ is independent from event $B$ (i.e. $A perp B$), then
$
  P(A inter B) = P(A)P(B)
$

Proposition: if $A perp B$ then $A perp B^c$

Proof:

because:

$
  A = (A inter B) union (A inter B^c)
$

then:

$
  P(A) &= P(A inter B) + P(A inter B^c)\
  P(A inter B^c) &= P(A) - P(A inter B)
$

from independence：

$
  P(A inter B) = P(A) P(B)
$

therefore:

$
P(A inter B^c)
  &= P(A) - P(A) P(B) \
  &= P(A) [1 - P(B)] \
  &= P(A) P(B^c).
$

#hd4("Partitioning")

If a set of events ${B_i}_(i=1)^n$ satisfies:
1. pairwise disjoint:
$
  B_i inter B_j = emptyset, space.quad (i eq.not j)
$
2. exhaustive
$
  union.big_(i=1)^n B_i = Omega
$
then ${B_i}_(i=1)^n$ is call a partition of $Omega$, can be written in:
$
  Omega = union.big.sq_(i=1)^n B_i
$

Law of total probability:
$
  P(A) = sum_i P(A|B_i) P(B_i),space.quad Omega = union.big.sq_(i=1)^n B_i
$
where $P(B_i)$ can be seen as weight

#hd4("Bayes' rule")

The Bayes' rule is given by:
$
  P(B|A) = (P(A|B) P(B))/P(A)
$
apply the law of total probability, we have:
$
  P(B|A) = (P(A|B) P(B))/(sum_i P(A|B_i) P(B_i))
$
