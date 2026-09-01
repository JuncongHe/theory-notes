#import "../../prelude.typ": *

#hd3("Convergence") #index(["Convergence"])

#hd4("Sample Path")

Let probability space
$
  (Omega, cal(F), P)
$
where:
- $Omega$ is the sample space, containing all possible outcomes
- $omega in Omega$ is a specific sample outcome
- $P$ is the probability measure, giving the probability of each $omega$

A random variable $X$ is a function
$
  X: Omega arrow bb(R)
$
when $omega$ is fixed, $X(omega)$ is a definite number.

For a stochastic process $X$, fixing $omega$ yields a deterministic function of time (or $n$) $t mapsto X_t (omega)$, called a sample path (or trajectory) of $X$.

For discrete random variables ${X_n}_(n=1, dots):Omega arrow bb(R)$, the sample path is the deterministic sequence once $omega$ is fixed:
$
  n mapsto X_n (omega)
$

For continuous random variable ${X(t)}_(t in T), T = [0, infinity)$, it can be viewed as a bivariate function:
$
  X: T times Omega arrow bb(R), space.quad (t, omega) mapsto X(t, omega)
$
for given time $t$, we get random variable $X(t, dot): Omega arrow bb(R)$

The sample path is the deterministic function for given $omega$:
$
  X(dot, omega): T arrow bb(R), space.quad t mapsto X(t, omega)
$

#figure(
  image("../../assets/stats/stochastic-process-sample-paths.png")
)

#hd4("Foundation")

The convergence in statistics is a measure of how a sequence of random variables converges to a limit.

Let probability space $(Omega, cal(F), P)$, random variables $X_n: Omega arrow bb(R)$, the means of convergence usually contains:
- almost sure convergence
- convergence in probability
- convergence in $L^p$
- convergence in distribution

*a.s. convergence*#index(["almost sure convergence"]) \
Denoted as
$
  X_n stretch(arrow)^(a.s.) X
$
defined as:
$
  P({omega: lim_(n arrow infinity) X_n (omega) = X(omega)}) = 1
$
which means for all possible sample paths $omega$ (except for a set of sample paths with probability 0), the limit of $X_n (omega)$ is $X(omega)$:
$
  X_n (omega) arrow X(omega)
$

*convergence in probability*#index(["convergence in probability"]) \
Denoted as
$
  X_n stretch(arrow)^(P) X
$
defined as:
$
  forall epsilon > 0, space.quad lim_(n arrow infinity) P(abs(X_n - X) > epsilon) = 0
$
That is, it does not require convergence along every sample path; it only requires that $X_n$ be close to $X$ with probability tending to 1 as $n arrow infinity$.

*convergence in $L^p$*#index(["convergence in $L^p$"]) \
Suppose:
$
 bb(E)[|X_n|^p] < infinity, space.quad bb(E)[|X|^p] < infinity
$

The convergence in $L^p$ is denoted as
$
  X_n stretch(arrow)^(L^p) X
$
defined as:
$
  lim_(n arrow infinity) bb(E)[abs(X_n - X)^p] = 0
$
For example, consider mean square error for $hat(theta)_n$:
$
  "MSE" (hat(theta)_n) = bb(E)[(hat(theta)_n - theta)^2]
$
if $"MSE"(hat(theta)_n) arrow 0$, then $hat(theta)_n stretch(arrow)^(L^2) theta$

Convergence in $L^p$ can interpret as convergence in probability. If $p >= 1$, then:
$
  X_n stretch(arrow)^(L^p) X arrow 0 implies X_n stretch(arrow)^(P) X
$

*Difference between convergence in probability and convergence in $L^p$*
- Convergence in probability cares more about the overall probability of seeing huge deviations from the limit, it cares less about how huge the deviations are.
- Convergence in $L^p$ cares more about the average magnitude of the deviations ($abs(X_n - X)^p$), it cares less about the frequency (though small magnitude equals to small frequency).

Therefore, convergence in $L^p$ is a stronger condition than convergence in probability.

*convergence in distribution*#index(["convergence in distribution"]) \
Denoted as
$
  X_n stretch(arrow)^(d) X
$
defined as:
$
  lim_(n arrow infinity) F_(X_n) (x) = F_X (x)
$
for all $x$ where $F_X (x)$ is continuous, where $F_X (x)$ is the cumulative distribution function of $X$.

This is the weakest convergence, only cares about the distribution rather than point-wise convergence in sample space.

*Relationships*

$
  X_n stretch(arrow)^(a.s.) X implies X_n stretch(arrow)^(P) X implies X_n stretch(arrow)^(d) X \
  X_n stretch(arrow)^(L^p) X implies X_n stretch(arrow)^(P) X implies X_n stretch(arrow)^(d) X
$
specially, when limit $X$ is a constant $c$, then:
$
  X_n stretch(arrow)^d c biimplies X_n stretch(arrow)^(P) c
$

#figure(
  image(
    "../../assets/stats/modes-of-convergence.png",
    width: 80%
  )
)

#hd4("Cramér–Wold Theorem")#index(["Cramer–Wold theorem"])

Let $X: (Omega, cal(F), P) arrow (bb(R)^d, cal(B)(bb(R)^d))$ be a random vector, the linear projection given $t in bb(R)^d$ is defined as:
$
  ip(t, X) = t^top X = sum_(i=1)^d t_i X_i
$
Cramer–Wold theorem states that:

1. Identification:\
  Let $X, Y in bb(R)^d$ to be random vectors, then:
$
  X stretch(=)^(d) Y biimplies ip(t, X) stretch(=)^(d) ip(t, Y), forall t in bb(R)^d
$
#h(1.5em) or in a more detailed way:
$
  X stretch(=)^(d) Y biimplies forall t in bb(R)^d, forall s in bb(R), P(ip(t, X)<=s) = P(ip(t, Y)<=s)
$

2. Cramer–Wold device:\
  Let $X_n, X in bb(R)^d$ to be random vectors, then:
$
  X_n stretch(arrow)^(d) X biimplies forall t in bb(R)^d, space.quad ip(t, X_n) stretch(arrow)^(d) ip(t, X)
$
To better illustrate the theorem, for any $t eq.not 0$, scalar $s in bb(R)$, define a hyperplane $H(t, s)$ as:
$
  H(t, s) = {x in bb(R)^d | ip(t, x) = s}
$
- in 2D, $H(t, s)$ is a line
- in 3D, $H(t, s)$ is a plane
- in $d$-D, $H(t, s)$ is a $(d-1)$-dimension hyperplane
Where $t$ is the normal vector of the hyperplane $H(t, s)$, which indicates the direction of the hyperplane; $s$ is the distance from the origin to the hyperplane.

$t$ is not the base vector the of space, but rather all possible directions in the space.

Amount of probability density that hyperplane covers given $s$ is given by the CDF $F_X (s)$:
$
  F_t (s) = P(X in {x: ip(t, x) <= s})
$
