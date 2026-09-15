#import "../../prelude.typ": *

#hd3("Foundation")

#hd4("Vector Spaces")

A vector space $V$ is a set of vectors that satisfies the following axioms:

for $bold(v), bold(w), bold(u) in V$ and $alpha, beta in bb(R)$:
$
  &1. space bold(v) + bold(w) in V \
  &2. space (bold(u) + bold(v)) + bold(w) = bold(u) + (bold(v) + bold(w)) \
  &3. space exists bold(0) in V space s.t. space bold(v) + bold(0) = bold(v) \
  &4. space forall bold(v) in V, exists -bold(v) in V space s.t. space bold(v) + (-bold(v)) = bold(0) \
  &5. space 1 bold(v) = bold(v) \
  &6. space (alpha beta) bold(v) = alpha (beta bold(v))\ 
  &7. space alpha (bold(v) + bold(w)) = alpha bold(v) + alpha bold(w)\ 
  &8. space (alpha + beta) bold(v) = alpha bold(v) + beta bold(v)\
$

#hd4("Linear Combinations and Basis")

Consider a set of vectors $bold(v)_1, bold(v)_2, dots, bold(v)_k in V$, a linear comibination is a vector of the form:
$
  bold(v) = alpha_1 bold(v)_1 + alpha_2 bold(v)_2 + dots + alpha_k bold(v)_k = sum_(i=1)^k alpha_i bold(v)_i
$

All possible linear combinations are a set, call the complete or the span of the vectors $bold(v)_1, bold(v)_2, dots, bold(v)_k$, given by:
$
  span{bold(v)_1, bold(v)_2, dots, bold(v)_k} = {sum_(i=1)^k alpha_i bold(v)_i : alpha_i in bb(R)}
$
A $"Span"(S)$ is the minimal vector space that contains the set $S$.

A set of vectors $bold(v)_1, bold(v)_2, dots, bold(v)_k in V$ is said to be linearly independent if the only solution to the equation:
$
  sum_(i=1)^k alpha_i bold(v)_i = bold(0)
$
is
$  
  alpha_1 = alpha_2 = dots = alpha_k = 0
$
This also means that a vector only has a unique linear combination of this set of vectors.

A set of vectors $bold(v)_1, bold(v)_2, dots, bold(v)_k in V$ is said to be linearly dependent if at least one of the vectors can be expressed as a linear combination of the others. Consider $bold(v)_k$ to be the only vector that can be expressed as a linear combination of the others, then:
$
  sum_(i=1)^(n) alpha_i bold(v)_i = bold(0) arrow.double bold(v)_j = -sum_(i eq.not j) alpha_i / alpha_j bold(v)_i
$

A set of vectors $bold(v)_1, bold(v)_2, dots, bold(v)_k in V$ is said to be the basis of the vector space $V$ if any $bold(v) in V$ can be written uniquely as a linear combination.
$
  "Basis" arrow.long.double.l.r "Span" + "Linear Independent"
$
- Basis: the only representation system
- Span: contains all possible vectors
- Linear independent: unique representation

Suppose $S = {bold(v)_1, dots, bold(v)_m} subset.eq V$, then there always exists a subset $B subset.eq S$ that is linearly independent such that:
$
  span(B) = span(S)
$

if the original vector space is zero vector space, then $B = emptyset$

proof:

suppose for linear dependent set $S = {bold(v)_1, dots, bold(v)_m} subset.eq V$, there exist $bold(v)_j$ such that:
$
  bold(v)_j = -sum_(i eq.not j) a_i/a_j bold(v)_i
$
if we remove $bold(v)_j$:
$
  S' = S \\ {bold(v)_j} subset.eq S
$
then
$
  span(S') subset.eq span(S)
$
for any $x in span(S)$, we can write it in:
$
  bold(x) = sum_i c_i bold(v)_i
$
given
$
  bold(v)_j = sum_(i eq.not j) d_i bold(v_i)
$
we can rewrite
$
  bold(x) = sum_(i eq.not j) c_i bold(v)_i + c_j sum_(i eq.not j) d_i bold(v)_i in span(S')
$
which indicates
$
  span(S) subset.eq span(S')
$
combine both ways:
$
  span(S') = span(S)
$

Any two basis for a finite-dimensional vector space have the same number of vectors, and the number is called dimension of the space, denoted as:
$
  dim V = \#("basis vectors") = n
$
the dimension of the space is also the independent degrees of freedom, that is the number of independent coordinates number to decribe any vector in the space.

If $dim V = n$, and $\#{"vectors"in V} = m$:
- if the vectors are basis, then $m = n$
- if $m > n$, then must be linear dependent
- if $m < n$, then cannot span to $V$

Let $cal(B) = (bold(b)_1, dots, bold(b)_n)$ be a set of basis, if $bold(v) = sum_i alpha_i bold(b)_i$, then a coordinate of vector $bold(v)$ under basis $cal(B)$ is denoted by:
$
  [bold(v)]_cal(B)=[alpha_1, dots, alpha_n]^tack.b
$
defined by coordinate mapping:
$
  T: V arrow bb(R)^n, space.quad T_cal(B)(bold(v))=[bold(v)]_cal(B)
$
