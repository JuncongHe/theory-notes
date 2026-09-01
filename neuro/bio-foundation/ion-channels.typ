#import "../../prelude.typ": *

#hd3("Ion Channels")

#hd4("Key Features")

1. *Ions through channels can be quantified as current*:
  $
    I = g_"eff" (V_m - E_"ion")
  $
  Ions' permeation through channels is induced by:
    1. The chemical driving force due to the ion concentration gradient.
    2. The electrical driving force due to the membrane potential (the charge separation across the membrane).
  The current $I$ is defined by net charge $Q$ flowing through a line or intersection in a unit of time:
  $
    I = (d Q)/(d t)
  $
  For the ions:
  $
    Q = N dot q = N dot z e
  $
  where $N$ is the number of ions through the channel, $z$ is the valence of an ion (number of charges). To illustrate $N$ and relate to time, we can decompose $N$ as:
  $
    N = J_N dot A dot Delta t
  $
  where $J_N$ is the number of ions through the channel per unit area per unit time, and $A$ is the area of the channel. Therefore, the current is:
  $
    I = z e dot J_N dot A = z F J A
  $
  where $F$ is the Faraday constant ($F = N_A e$), $N_A$ is the Avogadro constant. $J$ can be expressed using Nernest-Planck equation#index("Nernest-Planck Equation") as (be aware that this is a stationary state equation as discussed below):
  $
    J(x) = -D (partial c(x))/(partial x) - D (z F)/(R T) c(x) (partial phi.alt(x))/(partial x)
  $
  where $D$ is the diffusion constant, $c(x)$ is the concentration of the ion at position $x$, $phi.alt(x)$ is the potential at position $x$. This equation describes how ion concentration and potential gradient drive the ion flux through the channel.

  To solve currents $I$ from $J(x)$, let's model the channel as 1-d with $x=0$ at inside and $x=L$ at outside. The concentration is $c(0)=c_"in", c(L)=c_"out"$, and the membrane potential is $V_m = phi.alt(L) - phi.alt(0)$.

  Also, we need to introduce two assumptions:
  1. We're at stationary state, thus:
  $
    J(x) = J = "Const."
  $
  This is because:

  a). Nernst–Planck is a time and length dependent equation, without assuming stationary state, we cannot form an analytical solution.
  $
    (partial c(x, t))/(partial t) + (partial J(x, t))/(partial x) = 0, J(x, t) = -D (partial c(x, t))/(partial x) - D (z F)/(R T) c(x, t) (partial phi.alt(x, t))/(partial x)
  $
  b). Stationary state means stationary flux, which corresponds to stationary current we inject.\
  c). Ions diffuse in $n s$-$mu s$ level, so we can assume concentration is constant within the channel.

  2. Electrical field is constant within the membrane.
  $
    (d phi.alt(x))/(d x) = "Const." = -E
  $
  Assumption 2 works because, consider Poisson's equation:
  $
    partial^2 phi.alt(x)/(partial x^2) = -rho(x)/epsilon
  $
  where $epsilon$ is the dielectric constant, $rho(x)$ is the charge density at position $x$.

  If we assume that no net charge is inside the membrane ($rho(x) = 0$) and the dielectric constant is approximately uniform ($epsilon = "Const."$, considering the medium hospholipid bilayer homogeneous), then from Poisson's equation we get $phi.alt''(x) = 0$.

  To generate an analytical solution, let:
  $
    u eq.triple (z F)/(R T)
  $
  then we can turn ODE to:
  $
    - (J(x))/D = - e^(-u phi.alt(x)) (d)/(d x) (c e^(u phi.alt(x)))
  $
  Integrating both sides with respect to $x$ from $0$ to $L$, we get Goldman-Hodgkin-Katz flux equation#index("Goldman-Hodgkin-Katz Flux Equation"):
  $
    J = D/L (z F V_m)/(R T) (c_"in" - c_"out" e^(-z F V_m \/ R T))/(1-e^(-z F V_m \/ R T))
  $
  put back $J$ to the current equation, we get Goldman-Hodgkin-Katz current equation#index("Goldman-Hodgkin-Katz Current Equation"):
  $
    I(V_m) = P (z^2 F^2)/(R T) V_m (c_"in" - c_"out" e^(-z F V_m \/ R T))/(1-e^(-z F V_m \/ R T))
  $
  where $P equiv D A\/L $ is the permeability of the channel.

  In computational neuroscience, we mainly focus on how current changes with membrane potential around the resting potential. Thus, we can approximate using the Taylor expansion around $V = E_"ion"$, which is also $I = 0$:
  $
    I(V_m) approx I(E_"ion") + lr((d I)/(d V) |)_(V_m = E_"ion") (V_m - E_"ion") + 1/2 lr((d^2 I)/(d V_m^2) |)_(V_m = E_"ion") (V_m - E_"ion")^2 + dots
  $
  In case where we only care about $V_m$ around $E_"ion"$, we can only keep the first order term:
  $
    I(V) approx lr((d I)/(d V) |)_(V = E_"ion") (V - E_"ion")
  $
  regard the factor as an effective conductance:
  $
    I = g_"eff" (V_m - E_"ion"), space.quad g_"eff" = lr((d I)/(d V) |)_(V = E_"ion")
  $

2. *Current through ion channels can be recorded by patch clamp recording*

  - patch clamp is used to record the current or the voltage across the cell membrane (fix either the potential or the current, and measure the other one)
  - amplifier is used to inject / remove the current if voltage is different from command voltage; thus membrane potential is clamped to the command voltage (for voltage clamp)
  #align(center)[
    #image("../../assets/neuro/patch-clamp.png", width: 70%)
  ]
  Let membrane potential $V_m = V_"inside" - V_"outside"$, assume current $I>0$ if injecting current into the cell. Therefore, patch clamp recording can be expressed using Kirchhoff's Current Law as:
  $
    C_m (d V_m)/(d t) = - sum_i g_(i)(t) [V_m - E_i]+I_"inj" (t)
  $
  where:
  - $C_m$ is the membrane capacitance formed by the cell membrane
  - $g_i(t)$ is the conductance of the $i$-th ion channel ($R_i = 1\/g_i$)
  - $E_i$ is the resting potential of the $i$-th ion channel, calculated by the Nernst equation
  For current clamp, we vary the current $I_"inj" (t)$ and measure/solve the voltage $V_m (t)$. \
  For voltage clamp, we vary the command voltage $V_"cmd" (t)$ and the amplifier will then vary the current $I_"inj" (t)$ to keep the voltage $V_m (t)$ the same as the command voltage, then we can use $I_"inj" (t)$ to measure/solve the conductance $g_i (t)$:
  $
    V_m (t) = V_"cmd" (t), (d V_m)/(d t) = 0 implies I_"inj" (t) = sum_i g_i (t) [V_"cmd" - E_i]
  $

3. *The Flux of Ions Through a Channel Differs From Diffusion in Free Solution*

  - Ions are transported through the channel by first binding to the ion channels, and later dissociating from them.
  - Ion channels may have multiple binding sites.
  - The process is similar to enzymes, where Michaelis-Menten equation describes the rate of the reaction.
  - The opening and closing of a channel is regard as stochastic process (gating)

  This is basically phisical foundation for modeling ion channels.

4. *The Opening and Closing of a Channel Involve Conformational Changes*

  - Protein structure of ion channels is dynamic, with different conformational states (e.g. closed, open, inactivated, etc.).
  - Each conformational state has a conductance $g_i$.
  - The transition between different conformational states has a rate that depends on membrane potential, ion concentration, temperature, etc.

    However, in practice, we often simplify the dependency on membrane potential only due to severl reseaons:

    1. Under experiment settings, we often fix the ion concentration and temperature, etc.
    2. Concentration dependency is mainly reflected in $E_"ion"$ through Nernst equation. Only in some special channels (e.g. $"Ca"^(2+)$-activated K channel, ligand-gated channel) that we explicitly model the concentration:
    $
      x_infinity = x_infinity (V, ["Ca"^(2+)]), tau_x = tau_x (V, ["Ca"^(2+)])
    $
    3. Usually we use Q10 tempreture to simplify the dependency on temperature:
      $
        alpha_T = phi.alt(T) alpha_(T_0) (V), beta_T = phi.alt(T) beta_(T_0) (V)
      $
      #showybox(title: "Q10 tempreture")[
        Q10 tempreture#index("Q10 Temperature") illustrates how rate changes when temperature increases by 10 degrees:
        $
          Q_(10) = "rate"(T+10)/"rate"(T)
        $
        To calculate how rate changes when tempreture increases from $T_0$ to any temperature $T$, we need to introduce a factor $phi.alt_(Q_(10))(T)$ (assume $Q_10$ is constant):
        $
          "rate"(T_0+10 n) = Q_(10)^n \
          phi.alt_(T) = Q_(10)^((T-T_0)\/10)
        $
        Actually, Q10 tempreture is an approximation of Arrhenius equation#index("Arrhenius Equation"):
        $
          K(T) = A e^(-E_"a"\/(R T))
        $
        where $K(T)$ is the rate at temperature $T$, and $T$ has units of Kelvin. Thus, at any given tempreture, the factor is:
        $
          phi.alt(T) =(K(T))/(K(T_0))=exp[-(E_a)/R (1/T - 1/T_0)]
        $
        Approximate $1\/T$ at $T_0$ (consider small change under biological conditions):
        $
          1/T approx 1/T_0 - (T-T_0)/T_0^2
        $
        Thus:
        $
          phi.alt_("Arr")(T) approx exp[(E_a)/(R T_0^2)(T-T_0)]
        $
        This gives us exact approximation of rate changes, then we can get Q10:
        $
          Q_10 = exp[(E_a 10)/(R T_0^2)]
        $
      ]

  - The transition of conformational states can be regarded as a Markov process:

    Consider a simple model:
    $
      C limits(stretch(harpoons.rtlb))^(k_(c o)(V))_(k_(o c)(V)) O
    $
    where $C$ is the closed state, $O$ is the open state, $k_(c o)(V)$ is the rate of transition from closed to open, and $k_(o c)(V)$ is the rate of transition from open to closed.

    Let $P_o (t)$ be the probability of the channel being in the open state at time $t$. Then we can write the following differential equation:
    $
      (d P_o (t))/(d t) = k_(c o)(V) (1-p_o (t)) - k_(o c)(V) P_o (t)
    $
    In general, the ODE can be written as:
    $
      (d p)/(d t) = alpha(V) (1-p) - beta(V) p
    $
    We can derive an exponential relaxation solution, consider using eigenmode expansion:
    $
      bold(p)' = K bold(p), space.quad K = mat(-alpha(V), beta(V); alpha(V), -beta(V); delim: "["), bold(p) = mat(1-P_o (t); P_o (t); delim: "[")
    $
    solve:
    $
      det(K - lambda I) = 0 implies lambda_1 = 0, lambda_2 = -(alpha(V) + beta(V))
    $
    according to eigenmode expansion:
    $
      bold(p) = bold(p)^* +c_2 bold(v)_2 e^(lambda_2 t)
    $
    To solve $p_infinity$ is same as solving:
    $
      K bold(p) = 0 implies P_o (t) = p_infinity = alpha(V)/(alpha(V) + beta(V))
    $
    To solve $bold(v)_2$, solve:
    $
      (K - lambda_2 I) bold(v)_2 = 0 implies bold(v)_2 = mat(1,-1; delim: "[")^top
    $
    Thus, rewrite:
    $
      bold(p) = bold(p)^* +c_2 bold(v)_2 e^(-t/(alpha + beta)) = mat(beta/(alpha+beta) + c_2 e^(-t/(alpha + beta)); alpha/(alpha+beta) - c_2 e^(-t/(alpha + beta)); delim: "[")
    $
    Solve $c_2$ by initial condition:
    $
      bold(p) = bold(p)^* +c_2 bold(v)_2 implies c_2 = p_infinity - p_0
    $
    Therefore, the exponential relaxation solution is#index("Exponential Relaxation Solution"):
    $
      P_o (t) = p_infinity + (p_0 - p_infinity) e^(-t tau_p)
    $
    where $p_0$ is
    $
      p_infinity = alpha(V)/(alpha(V) + beta(V)), space.quad tau_p = 1/(alpha(V) + beta(V))
    $
    *Special Case: under large number of channles*

    Let $x(t)$ be the proportion of channels in the open state at time $t$. According to the law of large numbers:
    $
      x(t) = lim_(N arrow infinity) P_o (t)
    $
    therefore:
    $
      x(t) = x_infinity + (x_0 - x_infinity) e^(-t tau_x)
    $
  - When the transition of conformation is regarded as stochastic process, the randomness will introduce channel noise#index("Channel Noise") to the system.

    Consider a simple model with $N$ independent channels:
    $
      C limits(stretch(harpoons.rtlb))^(alpha(V))_(beta(V)) O
    $
    let:
    - $n_o(t)$ be the number of open channels at time $t$
    - $n_c(t) = N - n_o(t)$ be the number of closed channels at time $t$
    Therefore, at time $t$, for each closed channel, the probability of opening is $alpha(V) Delta t + o(Delta t)$. Let the random number of transition be:
    $
      Y_j = cases(
        1 comma & "if channel "j" transits from C"arrow"O",
        0 comma & "otherwise"
      )
    $
    therefore $Y_j tilde "Bernoulli"(alpha(V) Delta t)$, and the number of channels that transits from C to O is:
    $
      Delta n_(c arrow o) = sum_(j=1)^(n_c) Y_j tilde "Binomial"(n_c, alpha(V)Delta t)
    $
    Thus the expectation and variance are:
    $
      bb(E)[Delta n_(c arrow o)] &= n_c alpha(V) Delta t\
      "Var"(Delta n_(c arrow o)) &= n_c alpha(V) Delta t (1-alpha(V) Delta t)
    $
    Because $Delta t$ is small, therefore
    $
      "Var"(Delta n_(c arrow o)) approx n_c alpha(V) Delta t
    $
    Net change of open channels is:
    $
      Delta n_o = Delta n_(c arrow o) - Delta n_(o arrow c)
    $
    Therefore, the expectation and variance are:
    $
      bb(E)[Delta n_o] &= [alpha(V) (N-n_o)-beta(V) n_o] Delta t\
      "Var"(Delta n_o) &= [alpha(V) (N-n_o)+beta(V) n_o] Delta t
    $
    Apply continuous form of SDE, we get:
    $
      d n_o = [alpha(V) (N-n_o)-beta(V) n_o] d t + sqrt(alpha(V) (N-n_o)+beta(V) n_o) d W_t
    $
    Consider to replace number of open channels with proportion of open channels $x(t) = n_o(t)\/N$. The first term (drift) becomes:
    $
      alpha(V) (1-x) - beta(V) x
    $
    The second term (diffusion) becomes:
    $
      sqrt((alpha(V) (1-x)+beta(V) x)/N)
    $
    Thus we get Itô SDE:
    $
      d x = [alpha(V) (1-x)-beta(V) x] d t + sqrt((alpha(V) (1-x)+beta(V) x)/N) d W_t
    $
    When $N arrow infinity$, the SDE falls back to ODE

#pagebreak()
