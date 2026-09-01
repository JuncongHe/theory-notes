#import "../../prelude.typ": *

#hd3("Stochastic Differential Equations") #index(["SDE"])

#hd4("Euler-Maruyama Method")

For a given ODE:
$
  (d x)/(d t) = f(x,t)
$
Applay Euler method to obtain the increment of small time interval $Delta t$:
$
  x_(n+1) = x_n + f(x_n, t_n) Delta t, space.quad t_n = n Delta t
$
In stochastic process, consider every step in ODE may introduce some randomness, that a number of incident may take place, therefore, let:
- the number of incident in step $n$ be random variable $N_n tilde "Poisson"(lambda Delta t)$
- the increment of each incident is $A_(n,k)$, which is i.i.d. and:
$
  bb(E)[A_(n,k)] = m, space.quad "Var"(A_(n,k)) = s^2
$
Therefore, the increment is:
$
  Delta x_n^"noise" = sum_(k=1)^(N_n) A_(n,k)
$
with:
$
  bb(E)[Delta x_n^"noise"] = m lambda Delta t\
  "Var"(Delta x_n^"noise") = lambda Delta t (m + s^2) eq.triple sigma^2 Delta t
$
According to central limit theorem:
$
  Delta x_n^"noise" = m lambda Delta t + sigma sqrt(Delta t) xi_n, space.quad xi_n tilde cal(N)(0, 1)
$
Therefore, the stochastic discrete dynamic system is:
$
  x_(n+1) = x_n + tilde(f)(x_n, t_n) Delta t + sigma(x_n, t_n) sqrt(Delta t) xi_n
$
where $tilde(f) = f + m lambda$.

#hd4("Diffusion Limit to Brownian Motion")

Let i.i.d. random variables ${xi_k}_(k>=1)$ that
$
  bb(E)[xi_k] = 0, space.quad "Var"(xi_k) = 1
$
let small time interval $Delta t$ and discrete time point
$
  t_n = n Delta t, space.quad n = 0, 1, 2, dots
$
The random walk at $t_n$ is:
$
  W^(Delta t)(t_n) = sum_(k=1)^n sqrt(Delta t) xi_k
$
If $t = n Delta t$ (if $t$ is not integer multiple of $Delta t$, take the nearest integer and will be same if $Delta t$ is small enough), then:
$
  W^(Delta t)(t) &= sqrt(Delta t) sum_(k=1)^(n) xi_k \
  &= sqrt(t) 1/sqrt(n)sum_(k=1)^(n) xi_k stretch(arrow)^"d" sqrt(t) dot cal(N)(0,1) = cal(N)(0,t)
$
Consider joint distribution of a finite amount of time point $(t_1, dots, t_m)$, assume $0<=t_1<dots<t_m$, and $t_i = n_i Delta t$, then the random walk of every time point can be written as:
$
  W^(Delta t) = mat(W^(Delta t)(t_1), dots, W^(Delta t)(t_m); delim: "[")
$
where
$
  W^(Delta t)(t_i) = sqrt(Delta t) sum_(k=1)^(n_i) xi_k
$
According to Cramér–Wold theorem, we can prove that $W^(Delta t)$ converges to a multivariate Gaussian distribution as $Delta t arrow 0$:

For any $a in bb(R)^m$, consider the linear combination
$
  S_(Delta t) &= sum_(i=1)^m a_i W^(Delta t)(t_i) \
  &= sqrt(Delta t) sum_(i=1)^m a_i sum_(k=1)^(n_i) xi_k \
  &= sqrt(Delta t) sum_(k=1)^(n_m) b_k xi_k,
$
where
$
  b_k = sum_(i=1)^m a_i indicator_({k <= n_i}), space.quad n_m = t_m / (Delta t).
$
Then $bb(E)[S_(Delta t)] = 0$ and
$
  "Var"(S_(Delta t)) &= bb(E)[S_(Delta t)^2] \
  &= bb(E)[Delta t sum_(k=1)^(n_m) sum_(l=1)^(n_m) b_k b_l xi_k xi_l]
$
By independence of $xi_k$:
- when $k eq.not l$, $bb(E)[xi_k xi_l] = bb(E)[xi_k] bb(E)[xi_l] = 0$
- when $k = l$, $bb(E)[xi_k xi_k] = bb(E)[xi_k^2] = "Var"(xi_k) + (bb(E)[xi_k])^2 = 1$
Therefore:
$
  "Var"(S_(Delta t)) &= Delta t sum_(k=1)^(n_m) b_k^2 \
  &= sum_(i=1)^m sum_(j=1)^m a_i a_j min(t_i, t_j) \
$

By CLT (or Lindeberg--Feller for this triangular array),
$
  S_(Delta t) stretch(arrow)^(d) cal(N)(0, a^top Sigma a), space.quad Sigma_(i j) = min(t_i, t_j).
$
By Cramér--Wold device,
$
  (W^(Delta t)(t_1), dots, W^(Delta t)(t_m)) stretch(arrow)^(d) cal(N)(0, Sigma), space.quad Sigma_(i j) = min(t_i, t_j).
$
This is exactly the finite-dimensional distributions of a centered Gaussian process ${W_t}_(t>=0)$ with covariance
$
  bb(E)[W_s W_t] = min(s, t).
$
Next we use Kolmogorov continuity theorem to obtain a (a.s.) continuous modification; this is Brownian motion (a.k.a. Wiener process).

#hd4("Kolmogorov Continuity Theorem → Brownian Motion") #index(["Kolmogorov continuity theorem", "Brownian motion", "Wiener process"])

Intuition: if we can control a high-order moment of the increments,
$
  bb(E)[abs(W_t - W_s)^p] <= C abs(t-s)^(1+beta),
$
then Kolmogorov's theorem guarantees the existence of an (a.s.) continuous (indeed Hölder-continuous) modification. For Gaussian increments the moments are explicit, so the limiting Gaussian process can be upgraded to have (a.s.) continuous sample paths; this is Brownian motion.

#showybox(title: "Kolmogorov continuity theorem (one-dimensional index)", breakable: true)[
  Let ${X_t}_(t in [0, T])$ be a stochastic process. If there exist $alpha > 0$, $beta > 0$ and $C < infinity$ such that for all $s, t in [0, T]$,
  $
    bb(E)[abs(X_t - X_s)^alpha] <= C abs(t - s)^(1 + beta),
  $
  then $X$ admits a modification $tilde(X)$ whose sample paths are (a.s.) Hölder continuous of any order $gamma < beta/alpha$. In particular, $tilde(X)$ is (a.s.) continuous.

  This theorem states that: for a given stochastic process, if the time increment $X_t - X_s$ is small enough under some moment condition, and speed of the increment is slower than the time increment $abs(t-s)$; then we can regard the sample path of the process to be continuous.
]

For the centered Gaussian process with covariance $bb(E)[W_s W_t]=min(s,t)$, we have stationary increments and
$
  W_t - W_s tilde cal(N)(0, t - s) space.quad (t >= s).
$
For any $p > 0$, letting $Z tilde cal(N)(0,1)$ and $c_p = bb(E)[abs(Z)^p]$, we get
$
  bb(E)[abs(W_t - W_s)^p] = c_p abs(t - s)^(p/2).
$
Choose $p > 2$, then $p/2 > 1$ and Kolmogorov theorem applies with $alpha = p$ and $beta = p/2 - 1$, hence there exists a modification $B$ such that:
- $B$ is (a.s.) continuous on any compact interval $[0, T]$
- $B_0 = 0$ (a.s.) and the finite-dimensional distributions of $B$ are still Gaussian with covariance $min(s,t)$

Such a process $B = {B_t}_(t>=0)$ is the *standard Brownian motion*#index(["standard Brownian motion"]) (or *Wiener process*): it is a centered Gaussian process with
$
  bb(E)[B_s B_t] = min(s, t),
$
and has (a.s.) continuous sample paths.

#hd4("Donsker Invariance Principle (Functional CLT)") #index(["Donsker invariance principle", "functional CLT"])

To view the random walk as a random element in a function space, define the continuous-time interpolation (for $t in [0, T]$)
$
  W_(Delta t)(t) eq.triple W^(Delta t)(t_n) + ((t - t_n)/(Delta t)) (W^(Delta t)(t_(n+1)) - W^(Delta t)(t_n)),
$
where $t_n = n Delta t$ and $n = floor(t/(Delta t))$. Then $W_(Delta t)(dot) in C([0, T])$ almost surely.

Hence $W_(Delta t)(dot)$ is a random element taking values in the function space $C([0,T])$. Donsker's invariance principle (the functional CLT) asserts its weak convergence in this space to the Wiener process.

The *Donsker invariance principle* states that if $xi_k$ are i.i.d. with $bb(E)[xi_k]=0$ and $"Var"(xi_k)=1$ (and e.g. $bb(E)[abs(xi_1)^(2+epsilon)] < infinity$ for some $epsilon>0$ to ensure tightness under the uniform topology), then as $Delta t arrow 0$,
$
  W_(Delta t)(dot) stretch(arrow)^(d) B_(dot) space.quad "in" space.quad C([0, T]),
$
where $B_(dot)$ is the Wiener process constructed above.

Therefore, SDE is given by:
$
  d X_t = f(X_t, t) d t + sigma(X_t, t) d B_t
$
where
$
  tilde(f)(X_t, t) = f(X_t, t) + bb(E)[Delta x_n^"noise"]\/Delta t\
  sigma(X_t, t) = sqrt("Var"(Delta x_n^"noise")\/ Delta t)
$
