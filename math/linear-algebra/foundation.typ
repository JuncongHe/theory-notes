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

#hd4("Linear Transformations")

Linear transformation is a mapping between two vector spaces
$
  T: V arrow W
$
if and only if:
$
  T(bold(v) + bold(w)) = T(bold(v)) + T(bold(w)), space.quad T(alpha bold(v)) = alpha T(bold(v))
$

A linear transformation depends on the basis of the vector space. Let a linear transformation $T: bb(R)^n arrow bb(R)^m$, and the standard basis of $bb(R)^n$ is $cal(B)={bold(e)_1, dots, bold(e)_n}$. For any
$
  bold(x) = [x_1, dots, x_n]^tack.b in bb(R)^n
$
rewrite it in terms of the basis:
$
  bold(x) = sum_(i=1)^n x_i bold(e)_i
$
because of linearity:
$
  T(bold(x)) = T(sum_(i=1)^n x_i bold(e)_i) = sum_(i=1)^n x_i T(bold(e)_i)
$
let
$
  bold(a)_i = T(bold(e)_i) = [bold(a)_(i,1), dots, bold(a)_(i,m)]^tack.b in bb(R)^m
$
then after transformation:
$
  T(bold(x)) = sum_(i=1)^n x_i bold(a)_i
$
therefore:
$
  bold(A)bold(x) = mat(|, ,|;bold(a)_1, dots, bold(a)_n;|, ,|) mat(x_1; dots.v; x_n) = T(bold(x))
$

A set of linear transformations also forms a vector space:
$
  cal(L)(V, W) = {T: V arrow W | T "is" "linear"}
$
if $T_1, T_2 in cal(L)(V, W)$, then
$
  (T_1 + T_2)(bold(v)) &= T_1(bold(v)) + T_2(bold(v))\
  (alpha T_1)(bold(v)) &= alpha T_1(bold(v))\
  dim(cal(L)(V,W)) &= dim(V) dim(W)
$

#hd4("Matrix Multiplication")

$
  bold(x) arrow.long^(bold(B)) bold(B x) arrow.long^(bold(A)) bold(A(B x))
$

Properties:
1. $(bold(A B))bold(C) = bold(A)(bold(B) bold(C))$
2. $(bold(A) + bold(B))bold(C) = bold(A) bold(C) + bold(B) bold(C)$
3. $alpha(bold(A) bold(B)) = (alpha bold(A)) bold(B) = bold(A) (alpha bold(B))$
4. $bold(A B) eq.not bold(B A)$ in general
5. $(bold(A B))^tack.b = bold(B)^tack.b bold(A)^tack.b$

If $bold(A) in bb(R)^(n times n)$, then:
$
  tr(bold(A)) = sum_(i=1)^n bold(A)_(i,i)
$

Identity transformation is:
$
  I: V arrow V, space.quad I(bold(x)) = bold(x)
$
and the identity matrix is:
$
  bold(I) = mat(1, 0, dots, 0; 0, 1, dots, 0; dots, ,dots.down, dots.v; 0, 0, dots, 1) = diag(1, dots, 1)
$
Inverse:
1. Left inverse: if for a transformation $A: V arrow W$, there exists a transformation $B: W arrow V$ such that $B A = I_V$, then $B$ is called the left inverse of $A$.

  If $A$ has a left inverse, then $A$ is injective:
  $
    A(bold(v)_1) = A(bold(v)_2) arrow.double bold(v)_1 = bold(v)_2
  $
  Proof:

  suppose $A$ has a left inverse $B$ but is not injective, then there exists $bold(v)_1 eq.not bold(v)_2$ s.t.
  $
    A(bold(v)_1) = A(bold(v)_2) = bold(w)
  $
  applying left inverse:
  $
    B(bold(w)) = bold(v)_1 \
    B(bold(w)) = bold(v)_2
  $
  which is impossible given $B$ is a function

2. Right inverse: if for a transformation $A: V arrow W$, there exists a transformation $C: W arrow V$ such that $A C = I_W$, then $C$ is called the right inverse of $A$.

  If $A$ has a right inverse, then $A$ is surjective:
  $
    forall bold(w) in W, exists bold(v) in V space.quad s.t. space.quad A(bold(v)) = bold(w)
  $
  Proof:

  given $A C = bold(I)$, suppose $bold(w) in W$, therefore
  $
    C(bold(w)) in V
  $
  then
  $
    A (C(bold(w))) = bold(w) = A(bold(v))
  $
  this shows for any $bold(w) in W$, there exists $bold(v) in V$ s.t. $A(bold(v)) = bold(w)$, which is the definition of surjective

3. Invertible: if for a transformation $A: V arrow W$, there exists both left inverse and right inverse, then $A$ is called invertible, denoted by $A^(-1)$, then the left inverse and right inverse are the same.

  If $A$ is invertible, then $A$ is bijective:

If both $bold(A), bold(B)$ are invertible, then $bold(A) bold(B)$ is also invertible and
$
  (bold(A) bold(B))^(-1) = bold(B)^(-1) bold(A)^(-1)
$
If $bold(A)$ is invertible, then
$
  (bold(A)^tack.b)^(-1) = (bold(A)^(-1))^tack.b
$
If a linear transformation $T: V arrow W$ is invertible, then $T$ is called isomorphism.

Isomorphism is a mathematical way of saying two objects are the same in terms of the structure we care about. In linear algebra, the structure is vector addition and scalar multiplication.

Isomorphism perseves both structure (addition and scalar multiplication) and information (bijective). Denoted by
$
  V tilde.equiv W
$

For any finite-dimensional vector space, the dimension of the space determines the structure of the space:
$
  V tilde.equiv W arrow.long.double dim(V) = dim(W)
$
therefore, choosing a basis for a vector space is equivalent to choosing an isomorphism between the vector space and $bb(R)^n$.
