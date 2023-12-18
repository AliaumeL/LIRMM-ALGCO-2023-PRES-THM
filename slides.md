---
lang: en-GB
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

# Preservation Theorems

## What, why, and where?

### Existential Sentences

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

- database completions
- chase termination

### In the finite?

TODO: list of positive and negative results.


### What are the tools?

- gaifman graph
- locality
- combinatorics of neighbourhoods

# The results

## Localisations

### Main theorem

**Theorem**
For every *hereditary* class $\mathcal{C}$ of finite structures
that is closed under disjoint unions, the following are equivalent

1. The Łoś–Tarski Theorem relativises to $\mathcal{C}$.
2. The Łoś–Tarski Theorem relativises to all **localisations** of $\mathcal{C}$.

- strictly generalises previous results
- is now an equivalence
- yields new classes of structures

### What is a neighbourhood?

### What is a localisation?

### How do we use such a theorem?

## Local normal form

### Positive Locality

**Theorem** $\varphi$ has a positive Gaifman Normal form, if and only if it is
equivalent to an existential-local sentence.

# The proofs

## Positive Locality and Neighbourhroods

### What is a neighbourhood?

### Local formulas

### Local sentences?

### Basic local sentences

### Existential local sentences

## Combinatorics of Neighbourhroods

- finding witnesses
- locality and presrevation 
- 


# Concluding remarks
## and future works

### Outlook

- we have a characterisation, for one theorem, what about others?
  (understanding $\oplus_X$ for homomorphisms!)
- limitations of locality
- we actually have more than the theorem, it is in general *effective*,
  can this be used in algorithms?
- what would it mean to decide such a property? On bounded
  clique-width classes? On bounded linear clique width classes?
