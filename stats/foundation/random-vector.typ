#import "../../prelude.typ": *

#hd3("Random Vectors") #index(["Random Vector"])

#hd4("Definition")

Suppose a probability space $(Omega, cal(F), P)$, then:
- one dimensional random variable is a measurable function
$
  X: (Omega, cal(F)) arrow (bb(R), cal(B)(bb(R)))
$
where $cal(B)(bb(R))$ is the Borel sigma-algebra on $bb(R)$, which contains all possible subsets of $bb(R)$.

- $d$-dimensional random vector:
$
  X = (X_1, dots, X_d): (Omega, cal(F)) arrow (bb(R)^d, cal(B)(bb(R)^d))
$

Random vector is not only a set of random variables, but rather a holistic mapping. The question is what's the distribution of the random vector in $bb(R)^d$?

The cumulative distribution function (CDF) of a random vector $X$ is defined as:
$
  F_X (x_1, dots, x_d) = P(X_1 <= x_1, dots, X_d <= x_d)
$
feature:
- non-decreasing
- right continuous
- $lim_(x_i arrow -infinity) F_X (dots, x_i, dots) = 0$
- $lim_(x_i arrow infinity) F_X (dots, x_(i-1), x_(i+1), dots) = F_X (dots, x_(i-1), x_(i+1), dots)$
the marginal CDF is:
$
  F_(X_i) (x_i) = lim_(x_1,dots,x_(i-1),x_(i+1),dots arrow infinity) F_X (dots, x_i, dots)
$
The probability density function (PDF) of a random vector $X$ is defined as:
$
  F_X (x_1, dots, x_d) = integral_((-infinity,x_1] times dots times (-infinity,x_d]) f_X (u) d u
$
this holds when the joint distribution is absolutely continuous with respect to the Lebesgue measure on $bb(R)^d$ (i.e., it admits a density, and probability distribution can be written as $"density" times "unit volume"$).
#showybox(title: "Lebesgue Measure", breakable: true)[
  Lebesgue measure#index("Lebesgue Measure") is define on $bb(R)^d$, denoted as $lambda$ and has few intuitive properties:
  - on $bb(R)$, measure gives length: $lambda((a,b)) = b - a$
  - on $bb(R)^2$, measure gives area
  - on $bb(R)^3$, measure gives volume
  - on $bb(R)^d$, measure gives intuitive volume: $lambda((a_1,b_1) times dots times (a_d,b_d)) = product_(i=1)^d (b_i - a_i)$
  If we say "probability $P_X$ is absolutely continuous with respect to the Lebesgue measure", denoted as:
  $
    P_X << lambda
  $
  which means: if there exists a set that has volume (Lebesgue measure) 0, then the probability of the set is 0:
  $
    lambda(A) = 0 implies P_X(A) = 0
  $
]
If the function is smooth, we can write PDF in form of partial derivatives:
$
  f_X (x_1, dots, x_d) = (partial^d)/(partial x_1 dots partial x_d) F_X (x_1,dots,x_d)
$
The marginal PDF is:
$
  f_Y (y) = integral_(bb(R)^(d-k)) f_(Y,Z) (y,z) d z
$
where $X=(Y,Z), Y in bb(R)^k, Z in bb(R)^(d-k)$.

#hd4("Characteristic Function")

Characteristic function $phi_X (t)$ is Fourier transform of the probability measure $P_X$

Let $X in bb(R)^d$ to be a random vector, the characteristic function is defined as:
$
  phi_X (t) = bb(E)[e^(i t^top X)], space.quad t in bb(R)^d
$
where $t$ is the wave vector in Fourier domain (dual location of $x$). Linear projection $t^top X$ provides Fourier information of $X$ along direction $t$.

The characteristic function always exists, because $abs(e^(i t^top X)) = 1$ for all $t in bb(R)^d$, therefore:
$
  bb(E)[abs(e^(i t^top X))]  = 1
$
If $X$ has density function $f_X (x)$, then characteristic function is its Fourier transform:
$
  phi_X (t) = integral_(bb(R)^d) e^(-i t^top x) f_X (x) d x
$

if $X, Y in bb(R)^d$ that:
$
  forall t in bb(R)^d: space.quad phi_X (t)=phi_Y (t)
$
then $X$ and $Y$ have the same distribution.

As Fourier transform, characteristic function can be used in the inversion formula to recover the density function:
$
  f_X (x) = 1/(2 pi)^d integral_(bb(R)^d) e^(-i t^top x) phi_X (t) d t
$
This shows that characteristic functions:
- *uniquely reveal the distribution of the random vector*
- *can simplify calculations by moving to the Fourier domain without losing any information*
Characteristic function has few properties:
1. $phi_X (0) = 1$ \
  because when $t = 0$, $t^top X = 0$, therefore:
$
  phi_X (0) = bb(E)[e^(i 0^top X)] = bb(E)[1] = 1
$
2. $abs(phi_X (t)) <= 1$ \
  because:
$
abs(phi_X (t)) = abs(bb(E)[e^(i t^top X)]) <= bb(E)[abs(e^(i t^top X))] = 1
$
3. Conjugate symmetry $phi_X (-t) = overline(phi_X (t))$ \
  because:
$
  phi_X (-t) = bb(E)[e^(-i t^top X)] = overline(bb(E)[e^(i t^top X)]) = overline(phi_X (t))
$
4. Continuity: $phi_X (t)$ is continuous on $bb(R)^d$

Characteristic functions can be factorized: let $X = (X_1, dots, X_d)$ be a random vector, with each component $X_i$ is independent of other components, then:
$
  phi_X (t_1, dots, t_d) = product_(k=1)^d phi_(X_k) (t_k)
$

#hd4([Linear Transformation $Y = A X + b$])

Suppose a linear transformation $Y = A X + b$, where $X in bb(R)^d, A in bb(R)^(m times d), b in bb(R)^m$, then the characteristic function of $Y$ is:
$
  phi_Y (t) &= bb(E)[e^(i t^top Y)], space.quad t in bb(R)^m\
  &= bb(E)[e^(i t^top (A X + b))]\
  &= bb(E)[e^(i t^top A X) e^(i t^top b)]\
  &= e^(i t^top b) bb(E)[e^(i t^top A X)]\
  &= e^(i t^top b) phi_X (A^top t)
$
This tells us: linear transformation $Y = A X + b$ changes the variable from $t$ to $A^top t$ in characteristic domain, then multiple a phase shift $e^(i t^top b)$.
