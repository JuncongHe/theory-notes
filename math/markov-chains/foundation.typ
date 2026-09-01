#import "../../prelude.typ": *

#hd3("CTMC Foundation") #index("CTMC Foundation")

#hd4("Definition")

Suppose a continuous-time Markov chain (CTMC) with $n$ states and process ${X_t}_(t>=0)$, the probability of transition from state $i$ to state $j$ at time $t$ is defined as:
$
  p_(i j)(t) = P(X_t = j|X_0 = i)
$
thus transition probability matrix $P(t)$ is defined as:
$
  P(t) = mat(p_(i j)(t); delim: "[")_(i,j)
$

For CTMC, we care transition in short time interval $Delta t$, therefore, for $i eq.not j$, we define transition rate#index("Transition Rate") as:
$
  q_(i j) = lim_(Delta t arrow 0^+) (P(X_(t+Delta t) = j|X_t = i))/(Delta t) = lim_(Delta t arrow 0^+) (p_(i j)(Delta t))/(Delta t)
$
Given the nature of limitation, the probability can be rewritten as:
$
  p_(i j)(Delta t) = cases(
    q_(i j) Delta t + o(Delta t) comma & i eq.not j,
    1 + q_(i i) Delta t + o(Delta t) comma & i = j,
  )
$
therefore, the generator matrix $Q$ is defined as:
$
  Q_(i j) = cases(
    q_(i j) comma & i eq.not j,
    -sum_(l eq.not j) q_(l j) comma & i = j,
  )
$
A key feature of $Q$ is that the sum of each column is 0:
$
  sum_(i=1)^n Q_(i j) = 0, space.quad forall j
$

#hd4("Kolmogorove Equation") #index("Kolmogorove Equation")

$
  P(X_(t+s)=j|X_0=i) &= sum_k P(X_(t+s)=j,X_t=k|X_0=i)\
  &= sum_k P(X_(t+s)=j|X_t=k,X_0=i) P(X_t=k|X_0=i)\
  &= sum_k P(X_(t+s)=j|X_t=k) P(X_t=k|X_0=i)\
  p_(i j)(t+s) &= sum_k p_(k j)(s) p_(i k)(t)\
$
or in matrix form:
$
  P(t+s) = P(s) P(t)
$

Specially, consider $s$ to be short time interval $Delta t$, we have:
$
  p_(i j)(t+Delta t) = sum_k p_(k j)(Delta t) p_(i k)(t)
$

Subtract $p_(i j)(t)$ from both sides and divide by $Delta t$ to form a differential equation:
$
  (p_(i j)(t+Delta t) - p_(i j)(t))/(Delta t) = ( - p_(i j)(t)+sum_k p_(k j)(Delta t) p_(i k)(t))/(Delta t)
$
notice that term $p_(i j)(t)$ lacks of $k$, introduce Kronecker delta $delta_(k j)$ to fix this:
$
  p_(i j)(Delta t) = sum_k p_(i k)(Delta t) delta_(k j), space.quad delta_(k j) = cases(
    1 comma & k = j,
    0 comma & k eq.not j,
  )
$
therefore, we can write Kolmogorove forward equation#index("Kolmogorove Forward Equation") as:
$
  (p_(i j)(t+Delta t) - p_(i j)(t))/(Delta t) &= (sum_k (p_(i k)(Delta t) -delta_(k j))p_(i k)(t))/(Delta t)\
  d/(d t) p_(i j)(t) &= sum_k p_(i k)(t) (q_(k j) Delta t + o(Delta t))/(Delta t)\
  d/(d t) p_(i j)(t) &= sum_k p_(i k)(t) q_(k j)\
$
or in matrix form:
$
  d/(d t) P(t) = P(t), space.quad P(0) = I
$

#hd4("Exponential Solution") #index("Exponential Solution")
Given the Kolmogorove forward equation, we can derive an analytical solution:
$
  bold(p)(t) = e^(Q t) bold(p)(0), space.quad e^(Q t) = sum_(m=0)^infinity ((Q t)^m)/(m!)
$
If $Q$ is diagonalizable, we can write $Q$ as:
$
  Q = V Lambda V^(-1), space.quad Lambda = "diag"(lambda_1, lambda_2, dots, lambda_n)
$
where $V = mat(bold(v)_1, bold(v)_2, dots, bold(v)_n, delim: "[") in RR^(n times n)$ is the matrix of eigenvectors of $Q$:
$
  Q bold(v)_j = lambda_j bold(v)_j
$
Thus the analytical solution can be written as:

#showybox(title: "Mode")[
  Mode#index("Mode") is the basic states that a linear system can be decomposed into.

  Consider a dynamic system $bold(p)' = K bold(p)$, a form of solution is:
  $
    bold(p) = sum_k c_k phi.alt_k (t)
  $
]

#hd4("Generator and Relaxation Time")

An irreducible, stationary state available CTMC has a few important features on its generator matrix $Q$:
1. Always has an eigenvalue of 0, corresponding to the stationary state.
2. Other eigenvalues all satisfy:
$
  Re(lambda_i) < 0, space.quad i = 2, dots, n
$
3. In general case, all eigenvalues are real and nonpositive:
$
  0=lambda_1 > lambda_2 >= dots >= lambda_n
$
Therefore, the solution can be written as:
$
  bold(p)(t) = c_1 bold(v)_1 + sum_(i=2)^n c_i bold(v)_i e^(lambda_i t)
$
where the first term is the stationary mode, and the second term indicates the relaxation mode. This can also be written as Eigenmode expansion#index("Eigenmode Expansion"):
$
  bold(p)(t) = bold(p)^* + sum_(i=2)^n c_i bold(v)_i e^(lambda_i t)
$
where $bold(p)^*$ is the stationary probability distribution, considering:
$
  lim_(t arrow infinity) c_i bold(v)_i e^(lambda_i t) = 0, space.quad lim_(t arrow infinity) bold(p)(t) = bold(p)^*
$

Consider the initial state $bold(p)(0)$:
$
  bold(p)(0) = c_1 bold(v)_1 + sum_(i=2)^n c_i bold(v)_i
$
Therefore, evolution of the system can be seen as applying a factor to every eigenmode:
$
  p(t) = p(0) e^(K t) = p(0) e^(lambda_i t)
$
Given $lambda_i<0$, these terms are decaying over time, therefore we can model with a time factor:
$
  e^(lambda_i t) = e^(-t\/tau_i), space.quad tau_i = -1\/lambda_i>0
$
where small $tau_i$ indicates fast relaxation, and large $tau_i$ indicates slow relaxation, deciding the memory time of the system (i.e. how long the initial conditions affect the distribution or correlations).
