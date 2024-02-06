---
lang: en-GB
slide-level: 3
title: LIRMM AlgCo Seminar
author: Aliaume LOPEZ
date: today
header-includes: |
  <script>
    function connect() {
      const ws = new WebSocket("ws://localhost:56789");
      ws.onopen = () => setTimeout(() => ws.send("keepalive"), 30000);
      ws.onclose = () => setTimeout(connect, 1000);
      ws.onmessage = () => location.reload();
    }
    connect();
  </script>
abstract: |

    Preservation theorems are classical results from Model Theory, stating that
    syntactic fragments of first-order logic (existential sentences,
    existential positive sentences, etc) are characterised by semantic
    properties (sentences preserved under extensions, preserved under injective
    homomorphisms, etc). The status of these results in finite model theory
    (that is, restricting the statement to classes of finite structures) is non
    trivial. Indeed, the classical proofs of these results rely on the compactness
    theorem of first-order logic, which is known to fail in the finite.
    Furthermore, on restricted classes of structures, semantic
    characterisations become weaker (for instance, it is easier to be preserved
    under extensions when fewer structures belong to the class), and syntactic
    equivalences become weaker too (more sentences are equivalent when tested
    over fewer models).

    Understanding over which classes of finite structures presrevation theorems
    relativise usually involves tools from finite model theory (locality of
    first order logic), requires combinatorial results (mainly about the
    spatial distribution of types of neighbourhoods in finite structures), and
    even features some monadic second order logic. While preservation theorems
    are interesting in themselves (because they have connections with
    well-quasi-orders, and characterise termination of some database algorithms
    such as the Chase), their study also provides deep insight into which
    classes of structures are "well-behaved" with respect to first-order logic.

    In this talk, we will focus on one particular preservation theorem, the
    Łoś–Tarski
    Theorem, and prove that this theorem relativises to a class
    $\mathcal{C}$ of finite structures if and only if it relativises *locally*
    to the class $\mathcal{C}$, which will illustrate the aforementioned
    techniques.

    This talk is based on the results published at LICS 2022 in the paper "When
    Locality Meets Preservation".

---


TODO:

- Images are not done yet
- preservation under extensions <-> Los Tarski
- add colours


# Preservation Theorems

## What, why, and where?

### Existential Sentences

\newcommand{\Nat}{\mathbb{N}}
\newcommand{\FO}{\mathsf{FO}}
\newcommand{\MSO}{\mathsf{MSO}}
\newcommand{\Neighb}[3]{\mathcal{N}_{#1}(#2, #3)}
\newcommand{\Loc}[3]{\mathsf{Loc}(#1,#2, #3)}
\newcommand{\setof}[2]{\{ #1 \mid #2 \}}

$$
\varphi := \varphi \wedge \varphi
        \mid \varphi \vee \varphi
        \mid \neg R(\vec{x})
        \mid R(\vec{x})
        \mid \exists x. \varphi
$$

- not all sentences are equivalent to an existential sentence:
$\forall x. B(x)$.
- existential sentences are "preserved under extensions"


### Extensions

$A \subseteq_i B$ when there exists a strong injective homomorphism
$h \colon A \to B$.

- Cycles: $C_n \subseteq_i C_m$ iff $n = m$ 
- Paths: $P_n \subseteq_i P_m$ iff $n \leq m$ 
- Cliques: $K_n \subseteq_i K_m$ iff $n \leq m$ 

### Preservation under Extensions

$\varphi(\vec{x})$ is preserved under extensions
when, for every strong injective homomorphism $h \colon A \to B$,
if $A, \nu \models \varphi(\vec{x})$ then
$B, h \circ \nu \models \varphi(\vec{x})$.

- that is, adding "new elements" does not change the truth value.

### Existential sentences are preserved under extensions

$$
\varphi = \exists \vec{x}. \underbrace{\bigwedge \bigvee \pm R(\vec{x})}_{Q}
$$

If $A \models \varphi$, and $h \colon A \to B$ is a strong injective
homomorphism.

1. Then, there exists a valuation $\nu \colon \vec{x} \to A$, such that $A, \nu \models Q$
2. By definition of "strong injective", it means that $B, h \circ \nu \models
   Q$
3. We conclude that $B \models \exists \vec{x}. Q$, i.e., that $B \models
   \varphi$.

### Quick drawing conventions

![My image](./images/orderings.svg)

### A finite model viewpoint

We actually have proven a stronger statement

> Existential sentences have finitely many $\subseteq_i$ minimal models

Conversely, sentences with finitely many $\subseteq_i$-minimal models
are equivalent to existential sentences!

$$
    \varphi \equiv \bigvee_{A \text{ minimal}} \Delta_A
$$

- Note, reminiscent of Well-quasi-orderings?


### The Łoś–Tarski Theorem

**Theorem [@TARSKI57;@LOS55].**
For every first order sentence $\varphi$,
the following are equivalent:

1. $\varphi$ is preserved under extensions
2. $\varphi$ is equivalent to an existential sentence
3. $\varphi$ is the $\subseteq_i$-upwards closure of finitely
   many *finite* models


Note that the only difficult implication of the theorem
is (1) implies (2/3).

### Theoretical implications?

If we consider the following variant of the 
Łoś–Tarski Theorem:

**Homomorphism Preservation Theorem.**
Let $\varphi$ be a first order sentence. The following are equivalent:

1. $\varphi$ is presreved under homomorphisms
2. $\varphi$ is equivalent to a positive existential sentence (union of
   conjunctive queries)



**[@LIBK11, Proposition 1].**
Naïve evaluation of a query $q$
computes its *certain answers*
if and only if $q$ is a union of conjunctive query.




**[@DENJ08, Theorem 17].**
The *core chase* terminates on an initial database $I$
and constraints $\Sigma$ if and only if
$\mathop{\uparrow}(\Sigma \cap I)$
is first-order definable.

### In the finite?

**Warning:** The above results are not immediately applicable
to finite models.



----------------------                                             --------------------
Class of Structures                                                Relativisation
----------------------                                             --------------------
All finite structures                                              NO [@TAIT59]

$\emptyset$                                                        YES

Bounded tree-depth                                                 YES [@wqo:DING92]

Cycles                                                             NO

Paths                                                              YES

Cliques                                                            YES

Bounded degree, hereditary, and closed under disjoint unions       YES [@ADG08]

Planar Graphs                                                      NO [@ADG08]
----------------------                                             --------------------


### What are the tools?

#### The proof scheme.

Given a sentence $\varphi$ preserved under extensions over a class
$\mathcal{C}$, do the following:

1. Rewrite $\varphi$ as a Boolean combination of "basic local sentences"
   [@GAIF82]
2. Assume by contradiction that $\varphi$ has arbitrarily large
   $\subseteq_i$-minimal models
3. In large enough minimal models, neighbourhoods "repeat" a lot, and
   can be "contracted"
4. Obtain a contradiction because $\varphi$ cannot observe the contraction

### The best "generic" result  prior to this work

**Theorem [@ADG08].** Let $\mathcal{C}$ be a hereditary class of finite
structures closed under disjoint unions. If $\mathcal{C}$ has *bounded degree*,
then the  Łoś–Tarski Theorem relativises to $\mathcal{C}$.



**Remark.** Hereditary means that existential sentences are precisely
those with finitely many minimal models. 

# The results

## Localisations

### Main theorem

**Theorem.**
For every *hereditary* class $\mathcal{C}$ of finite structures
that is closed under disjoint unions, the following are equivalent

1. The Łoś–Tarski Theorem relativises to $\mathcal{C}$.
2. The Łoś–Tarski Theorem relativises to all **localisations** of $\mathcal{C}$.




**Remarks.**

- Strictly generalises [@ADG08]
- Is now an equivalence
- Yields new classes of structures

### What is a neighbourhood?

$\Neighb{A}{\vec{a}}{r}$

### Example of neighbourhoods

### What is a localisation?

$\Loc{\mathcal{C}}{k}{r} := \setof{\Neighb{A}{\vec{a}}{r}}{ \vec{a} \in A^k}$

**Remark.** $\mathcal{C} = \bigcup_{k,r} \Loc{\mathcal{C}}{k}{r}$

### Example of localisations

- Bounded degree iff localisations are finite
- Cycles -> localisation contains finitely many cycles!
- Cliques -> localitasions are the whole class at every step

### How do we use such a theorem?

COPY FIGURE ABOUT NEW CLASSES

# The proofs

## Positive Locality and Neighbourhroods

### Local formulas

A formula is local if its truth value only depends on the local
neighbourhood of the free variables.

### Local sentences?

Does not make sense to consider local sentences (either true or false)

### Basic local sentences

Gaifman defined basic local sentences as follows:

### Existential local sentences

Another way to define local sentences is to consider existential
quantification of local formulas.

**Remark.** $0$-local is existential, $\infty$-local is arbitrary formulas.


### Positive Locality

**Theorem [@GAIF82].** 
Every sentence $\varphi$ is equivalent to a Boolean combination of
basic local sentences.

**Theorem.**
For every sentence $\varphi$, the following are equivalent:

1. $\varphi$ is equivalent to a **positive** Boolean combination of basic
   local sentences.
2. $\varphi$ is equivalent to an existential local sentence.

## Combinatorics of Neighbourhroods

### Easier Theorem

**Theorem.**
Let $\mathcal{C}$
be a hereditary class of finite structures, 
the following properties are equivalent:

1. $\Loc{\mathcal{C}}{k}{r}$ satisfies preservation under extensions for
   all $r,k \geq 0$.
2. Existential local sentences $\varphi$ that are
   preserved under extensions over $\mathcal{C}$
   are equivalent to existential sentences.

**Idea for $(1) \implies (2)$.** Let $\varphi := \exists x_1, \dots x_k.
\psi(\vec{x})$ where $\psi$ is $r$-local. Apply preservation under extensions
over $\Loc{\mathcal{C}}{k}{r}$, and obtain a bound on the size of the minimal
models of $\varphi$.

**Idea for $(2) \implies (1)$.** Transform $\varphi$ into $\psi :=
\exists x_1, \dots, x_k. \varphi_{| \Neighb{}{\vec{x}}{r}}$ which is
existential local, and preserved under extensions.

## The core combinatorial argument

### Bounding models

**Theorem.** Let $\mathcal{C}$ be a hereditary class of finite structures
closed under disjoint unions, and $\varphi$ be a sentence preserved under
$\subseteq_i$ over $\mathcal{C}$. There exists $K,R$ such that minimal models
of $\varphi$ belongs to $\Loc{\mathcal{C}}{K}{R}$.

**Corollary.** Sentences preserved under extensions are
*existential local* without loss of generality.

**Proof Scheme.** Transform a Gaifman normal form 
into a **positive** Gaifman normal form... with $\MSO$ formulas.

### From Gaifman to positive Gaifman

#### First attempt

Let 
$\varphi := \bigvee_i \bigwedge_k \theta_{i,k}^+ \wedge \bigwedge_k \neg \theta_{i,k}^-$ be preserved under extensions.
Take only the positive part of the Gaifman normal form, i.e.,
$\psi := \bigvee_i \bigwedge_k \theta_{i,k}^+$.

**Hope.** If $A \models \varphi$ is a minimal model of $\varphi$, then the
restriction of $A$ to the local neighbourhood around *positive* witnesses
satisfies $\varphi$, hence $A \in \Loc{\mathcal{C}}{K}{R}$.

#### Problem

The neighbourhoods in $\Neighb{A}{\vec{a}}{R}$ are 
obtained as *intersections* of neighbourhoods in $A$!

#### Solution

Encode the intersections using monadic second order formulas:
$\exists X. \psi_{|X}$.

### From Gaifman to positive Gaifman

#### Spatial Repartition of Neighbourhrood Types

Let $r,q,k \geq 0$. There exist bounds $K_m \geq k$ and $R_m \geq r$,
such that for all $A$, there exists $r \leq R \leq R_m$,
subsets $C_A$ and $G_A$ of $A$
such that:

1. Both $C_A$ and $G_A$ have size at most $K_m$,
2. The sets $C_A$ and $G_A$ are not intersecting at radius $R$, i.e., 
    $\Neighb{A}{C_A}{R} \cap \Neighb{A}{G_A}{R} = \emptyset$,
3. Elements in $G_A$ are at pairwise distance greater than $R$,
4. For every $a \in A$, one of the following holds
    a. The $\MSO$ $(q,r)$-local type of $a$ is realised
       by some point $b$ such that 
       with $\Neighb{A}{b}{r} \subseteq  \Neighb{A}{C_A}{R}$,
    b. There are at least $k$ elements $b \in G_A$
       with the same $\MSO$ $(q,r)$-local type.


### Proof Scheme

1. Enumerate pairs $C_A$, $G_A$ with parameters 
   $(2kl, 2r, q+1)$,
   that guarantee the satisfaction of $\varphi$
   as an existential $\MSO$ local sentence.
2. Write the disjunction of these,
   which remains an existential $\MSO$ local sentence.

#### Correctness?

If $A \models \varphi = \bigvee \bigwedge \pm \theta_i$ is
$\subseteq_i$-minimal, $\theta_i$ has parameters $(k,r,q)$,
and $\varphi$ is preserved under extensions.

1. Find $C_A$, $G_A$, $R$, $K$ by applying our lemma
   with parameters $(2kl, 2r, q + 1)$.
2. Prove that $B := \Neighb{A}{C_A \cup G_A}{R}$ satisfies $\varphi$.

### Proof Scheme

**Idea.**

- If $A \models \theta_i$, there are $k$ $r$-independent witnesses of some
  $(r,q)$-local type in $A$. Either they are all included in
  $\Neighb{A}{C_A}{R}$, in which case $B \models \theta_i$,
  or at least one *is not included*, hence is frequent, and
  can be found in $\Neighb{A}{G_A}{R}$ repeated at least $k$ times.

- Conversely, if $B \models \theta_i$,
  either the witnesses are found in $\Neighb{A}{C_A}{R}$, in which
  case $A \models \theta_i$. Otherwise, there is at least one
  witness with a neighbourhood that is not included,
  which means that $\exists X. \psi_{|X}(x)$ is satisfied
  for this witness, and we find at least $k$ other witnesses
  of this type in $G_A$.
  This means that an induced substructure of $B$ satisfies $\theta_i$.

- This can be corrected to show that a suitable induced substructure of $B$
  satisfies the same $\theta_i$ as $A$. Hence, an induced substructure of $B$
  satisfies $\varphi$, hence $B \models \varphi$.

# Concluding remarks

## and future works

### What was obtained

- A local-to-global characterisation of preservation under extensions
- New classes of finite structures for which the Łoś–Tarski Theorem
  relativises.
- A characterisation of existential local sentences
  as those enjoying a positive Gaifman normal form.
- A technical lemma about the "spatial" repartition of local types
  in a given structure.

### What’s next?

- Understand the Homomorphism Preservation Theorem,
  replacing $\uplus$ with $\oplus_X$...
- Locality is limited (Cliques vs Independent sets...), can we use
  other notions (flipper games?) to understand the behaviour
  of $\FO$ on dense classes?
- What about effectiveness?
- Towards decidability of these properties?
  (over classes of bounded linear clique width)
