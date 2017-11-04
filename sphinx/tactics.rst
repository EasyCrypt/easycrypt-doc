.. -*- rst -*-

.. include:: prelude.rhst

.. _chap:tactics:

Tactics
====================================================================

Proofs in |EasyCrypt| are carried out using *tactics*, logical
rules embodying general reasoning principles, which transform the
current lemma (or *goal*) into zero or more
*subgoals* |---| sufficient conditions for the lemma/goal to
hold. Simple ambient logic goals may be automatically proved using SMT
solvers.

In this chapter, we introduce |EasyCrypt|'s proof engine, before
describing the tactics for |EasyCrypt|'s four logics: ambient, |prhl|,
|phl| and |hl|.

Proof Engine
--------------------------------------------------------------------

|EasyCrypt|'s proof engine works with goal lists, where a *goal* has
two parts:


- A *context* consisting of a

  * a set of type variables, and

  * an *ordered* set of *assumptions*, consisting of
    identifiers with their types, memories, module names with their
    module types and restrictions, local definitions, and
    *hypotheses*, i.e., formulas. An identifier's type may
    involve the type variables, the local definitions and formulas may
    involve the type variables, identifiers, memories and module
    names.

- A *conclusion*, consisting of a single formula, with
  the same constraints as the assumption formulas.

Informally, to prove a goal, one must show the conclusion to be true,
given the truth of the hypotheses, for all valid instantiations of the
assumption identifiers, memories and module names.

For example,

.. literalinclude:: examples/parts/tactics-examp0-2.1.ec

is a goal.  And, in the context of the declarations

.. literalinclude:: examples/parts/tactics-examp2-2.0.ec
   :lines: 3-11

this is a goal:

.. literalinclude:: examples/parts/tactics-examp2-2.0.ec

The conclusion of this goal is just a nonlinear rendering of the formula

.. code-block:: easycrypt

   phoare [G(X).g : G.x = n ==> G.x = n] = 1%r.

|EasyCrypt|'s pretty printer renders |prhl|, |phl| and |hl| judgements
in such a nonlinear style when the judgements appear as (as opposed to
in) the conclusions of goals.

Internally, |EasyCrypt|'s proof engine also works with |prhl|, |phl|
and |hl| judgments involving lists of statements rather than procedure
names, which we'll call *statement judgements*, below. For example,
given this declaration

..  literalinclude:: examples/tactics-examp1.ec
    :lines: 3-9

this is a |phl| statement judgement:

.. literalinclude:: examples/parts/tactics-examp1-3.0.ec

post-conditions of a statement judgement may refer to the parameters
and local variables of the *procedure context* of the conclusion |---|
``M.f`` in the preceding example. They may also refer to the memories
``&1`` and ``&2`` in the case of |prhl| statement judgements.  When a
statement judgement appears anywhere other than as the conclusion of a
goal, the pretty printer renders it in abbreviated linear syntax.
E.g., the preceding goal is rendered as

.. code-block:: easycrypt

   hoare[if (x %% 3 = 1) {...} : x %% 3 = n ==> x %% 3 = n %% 2 + 1]

Statement judgements can't be directly input by the user.

We use the term *program* to refer to *either* a procedure appearing
in a |prhl|, |phl| or |hl| judgement, *or* a statement list appearing
in a |prhl|, |phl| or |hl| statement judgement. In the case of |prhl|
(statement) judgements, we speak of the *left* and *right* programs,
also using *program 1* for the left program, and *program 2* for the
right one. We will only speak of a program's *length* when it's a
statement list we are referring to. By the *empty* program, we mean
the statement list with no statements.

When the proof of a lemma is begun, the proof engine starts out with a
single goal, consisting of the lemma's statement. E.g., the lemma

.. literalinclude:: examples/tactics-examp0.ec
   :lines: 1-3

gives rise to the goal

.. literalinclude:: examples/parts/tactics-examp0-1.0.ec

For parameterized lemmas, the goal includes the lemma's parameters
as assumptions. E.g.,

.. code-block:: easycrypt

   lemma PairEq ['a 'b] (x x' : 'a) (y y' : 'b) :
      x = x' => y = y' => (x, y) = (x', y').

gives rise to

.. literalinclude:: examples/parts/tactics-examp0-2.0.ec

|EasyCrypt|'s tactics, when applicable, reduce the first goal to zero
or more subgoals.  E.g., if the first goal is

.. literalinclude:: examples/parts/tactics-examp1-3.0.ec

then applying the ``if`` tactic (handle a conditional) reduces
(replaces) this goal with the two goals

.. literalinclude:: examples/parts/tactics-examp1-3.1.ec

and

.. literalinclude:: examples/parts/tactics-examp1-3.2.ec

(leaving the remaining goals, if any, unchanged).  If the first goal
is

.. literalinclude:: examples/parts/tactics-examp1-6.0.ec

then applying the ``smt`` tactic (try to solve the goal using SMT
provers) solves the goal, i.e., replaces it with no subgoals.
Applying a tactic may fail; in this case an error message is issued
and the list of goals is left unchanged.

A lemma's proof may be saved, using the step ``qed``, when the list of
goals becomes empty. And this must be done before anything else may be
done.

**Remark.** In the descriptions of |EasyCrypt|'s tactics given in the
following two sections, unless otherwise specified, you should assume
that the subgoals to which a tactic reduces a goal have the same
contexts as that original goal.

.. .................................................................
.. _sec:ambientlogic:

Ambient logic
--------------------------------------------------------------------

In this section, we describe the proof terms, tactics and tacticals of
|EasyCrypt|'s ambient logic.

.. _subsec:proofterms:

Proof Terms
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Formulas introduce identifier and formula assumptions using universal
quantifiers and implications. For example, the formula

.. code-block:: easycrypt

   forall (x y : bool), x = y => forall (z : bool), y = z => x = z.

introduces the assumptions

.. code-block:: easycrypt

   x     : bool
   y     : bool
   eq_xy : x = y
   z     : bool
   eq_yz : y = z

(where the names of the two formulas were chosen to be meaningful),
and has ``x = z`` as its conclusion. We refer to the first assumption
of a formula as the formula's *top assumption*. E.g., the top
assumption of the preceding formula is ``x : bool``.

|EasyCrypt| has *proof terms*, which partially describe how to prove a
formula.  Their syntax is described in Figure~\ref{fig:proofterms},
where $X$ ranges over lemma (or formula assumption) names.

.. FIXME
.. \begin{figure}
..   \begin{center}
..   \begin{tabular}{rcl>{\bf}l}
..     $p$ & ::=
..       & {``_``} & proof hole \\
..      && {``($X$, $\;q_1$, $\;\ldots$, $\;q_n$)``} & lemma application \\[.2cm]
..     $q$ & ::=
..       & {$e$} & expression \\
..       && {$p$} & proof term \\
..   \end{tabular}
..   \end{center}
..   \caption{\label{fig:proofterms}Proof Terms}
.. \end{figure}

A proof term for a lemma (or formula assumption) $X$ has components
corresponding to the assumptions introduced by $X$.  A component
corresponding to a variable consists of an expression of the
variable's type. The proof term is explaining how the instantiation of
the lemma's conclusion with these expressions may be proved.  A
formula component consists of a proof term explaining how the
instantiation of the formula may be proved.  Proof holes will get
turned into subgoals when a proof term is used in backward reasoning,
e.g., by the :tactic:`apply` tactic.

Consider, e.g., the following declarations and axioms

.. code-block:: easycrypt

   pred P : int.
   pred Q : int.
   pred R : int.
   axiom P (x : int) : P x.
   axiom Q (x : int) : P x => Q x.
   axiom R (x : int) : P(x + 1) => Q x => R x.

Then, given that ``x : int`` is an assumption,

.. code-block:: easycrypt

   (R x (P(x + 1)) (Q x (P x)))

is a proof term proving the conclusion ``R x``. And

.. code-block:: easycrypt

   (R x _ (Q x _))

is a proof term that turns proofs of ``P(x + 1)`` and ``P x`` into
proofs of ``R x``. When used in backward reasoning, it will reduce a
goal with conclusion ``R x`` to subgoals with conclusions ``P(x + 1)``
and ``P x``.

Some of a proof term's expressions may be replaced by ``_``, asking
|EasyCrypt| to infer them from the context.  Going even further, one
may abbreviate a one-level proof term all of whose components are
``_`` to just its lemma name. For example, we can write ``R`` for
``(R _ _ _)``.  When used in backward reasoning, it will reduce a goal
with conclusion ``R x`` to subgoals with conclusions ``P(x + 1)`` and
``Q x``.

.. _subsec:occsels:

Occurrence Selectors and Rewriting Directions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Some ambient logic tactics use *occurrence selectors* to restrict
their operation to certain occurrences of a term or formula in a
goal's conclusion or formula assumption. The syntax is ``{i_1, ...,
i_n}`` , specifying that only occurrences ``i_1`` throught ``i_n`` of
the term/formula in a depth-first, left-to-right traversal of the
goal's conclusion or formula assumption should be operated
on. Specifying ``{- i_1, ..., i_n}`` restricts attention to all
occurrences *not* in the following list. They may also be empty,
meaning that all applicable occurrences should be operated on.

Some ambient logic tactics use *rewriting directions* which may either
be empty (meaning rewriting from left to right), or ``-``, meaning
rewriting from right to left.

.. _subsec:introgen:

Introduction and Generalization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Introduction.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

One moves the assumptions of a goal's conclusion into the goal's
context using the introduction tactical.  This tactical uses
introduction patterns, which are defined in Figure~\ref{fig:intropat}.

.. FIXME
.. \begin{figure}
..   \begin{center}
..   \begin{tabular}{rcl>{\bf}l}
..     $\iota$ & ::=
..       & {$b$} & name \\
..       && {``_``} & no name \\
..       && {``+``} & auto revert \\
..       && {``?``} & find name \\
..       && {$\mathit{occ}\;$``->``} & rewrite using assumption \\
..       && {$\mathit{occ}\;$``<-``} & rewrite in reverse using assumption \\
..       && {``->>``} & substitute using assumption \\
..       && {``<<-``} & substitute in reverse using assumption \\
..       && {``/$p$``} & replace assumption by applying proof term \\
..       && {``\{$a_1\cdots a_n$\``}} & clear introduced assumptions \\
..       && {``/=``} & simplify \\
..       && {``//``} & trivial \\
..       && {``//=``} & simplify then trivial \\
..       && {``$\mathit{dir``\;\mathit{occ}\;$@/$\mathit{op}$}} & unfold definition of operator \\
..       && {``[$\iota_{11``\cdots\iota_{1{m_1}}$ | $\;\cdots$ | $\;\iota_{r1}\cdots\iota_{r{m_r}}$]}} & case pattern \\[.2cm]
..     $\mathit{b}$ & ::=
..       & {$x$} & identifier \\
..       && {$M$} & module name \\
..       && {``&$m$``} & memory name \\
..   \end{tabular}
..   \end{center}
..   \caption{\label{fig:intropat} Introduction Patterns}
.. \end{figure}

In this definition, ``?occ`` ranges over occurrence selectors, and
``dir`` ranges over directions---see Section :ref:`subsec:occsels`).

If a list ``i_1, ..., i_n`` of introduction patterns consists entirely
of ``//`` (apply the :tactic:`trivial` tactic), ``/=`` (apply the
:tactic:`simplify` tactic) and ``//=`` (apply the ``simplify`` and
then ``trivial``), then *applying* ``i_1, ..., i_n`` *to* a list of
goals ``G_1``, ..., ``G_m`` is done by applying the tactics
corresponding to the ``i_k`` in order to each ``G_l``, causing some of
the goals to be solved and thus disappear and some of the goals to be
simplified.

.. tactic:: introduction
   :display: tactic => i1 ... in

   Runs the tactic ``tactic`` and apply the introduction patterns
   ``i1`` to ``in``:

   - Suppose $k$ is such that all of $\iota_1,\ldots,\iota_{k-1}$ are
     ``//``, ``/=`` and ``//=``, and either $k>n$ or $\iota_k$ is not
     ``//``, ``/=`` or ``//=``.

   - Let $G'_1,\ldots,G'_{l'}$ be the goals resulting from applying
     $\iota_1,\ldots,\iota_{k-1}$ to $G_1,\ldots,G_l$.

   - If $l'=0$, the tactical produces no subgoals.

   - Otherwise, if $k>n$, the tactical's result is
     $G'_1,\ldots,G'_{l'}$.

   - Otherwise, if $\iota_k$ is not a case pattern, each subgoal
     $G'_i$ is matched against $\iota_k,\ldots,\iota_n$ by the
     procedure described below, with the resulting subgoals being
     collected into a list of goals (maintaining order viz a viz the
     indices $i$) as the tactical's result.

   - Otherwise, $\iota_k$ is a case pattern
         ``[$\iota_{11``\cdots\iota_{1{m_1}}$ | $\;\cdots$ |
         $\;\iota_{r1}\cdots\iota_{r{m_r}}$]}.

   - If $\tau$ is not equivalent to :tactic:`idtac`, the tactic fails
     unless $r = l'$, in which case each $G'_i$ is matched against 

     .. math::
        \iota_{i1}\cdots\iota_{i{m_i}}\iota_{k+1}\cdots \iota_n

     by the procedure described below, with the resulting subgoals
     being collected into the tactical's result.

   - Otherwise, $\tau$ is equivalent to :tactic:`idtac` (and so
     $l'=1$). In this case $G'_1$ is matched against
     $\iota_k,\ldots,\iota_n$ by the procedure described below, with
     the resulting subgoals being collected into a list of goals as
     the tactical's result.

   To match a goal $G$ against a list of introduction patterns
   $\iota_1,\ldots,\iota_n$, the introduction patterns are processed
   from left-to-right, as follows:

   - ($b$)\quad The top assumption (universally quantified identifier,
     module name or memory; or left side of implication) is consumed,
     and introduced with this name. Fails if the top assumption has
     neither of these forms.

   - (``$b\,$!``)\quad Same as the preceding case, except that $b$ is
     used as the base of the introduced name, extending the base to
     avoid naming conflicts.

   - (``_``)\quad Same as the preceding case, except the assumption is
     introduced with an anonymous name (which can't be uttered by the
     user).

   - (``+``)\quad Same as the preceding case, except that after a
     branch of the procedure completes, yielding a goal, the
     assumption will be reverted, i.e., un-introduced (using a
     universal quantifier or implication as appropriate).

   - (``?``)\quad Same as the preceding case, except |EasyCrypt|
     chooses the name by which the assumption is introduced (using
     universally quantified names as assumption bases).

   - (``?occ ->``)\quad Consume the top assumption, which
     must be an equality, and use it as a left-to-right rewriting rule
     in the remainder of the goal's conclusion, restricting rewriting
     to the specified occurrences of the equality's left side.

   - (``?occ <-``)\quad The same as the preceding case,
     except the rewriting is from right-to-left.

   - (``->>``)\quad The same as ``->``, except the consumed equality
     assuption is used to perform a left-to-right substitution in the
     entire goal, i.e., in its assumptions, as well as its conclusion.

   - (``<<-``)\quad The same as the preceding case, except the
     substitution is from right-to-left.

   - (``/$p$``)\quad Replace the top assumption by the result of
     applying the proof term $p$ to it using forward reasoning.

   - (``\{$a_1\cdots a_n$\``})\quad Doesn't affect the goal's
     conclusion, but clears the specified assumptions, i.e., removes
     them. Fails if one or more of the assumptions can't be cleared,
     because a remaining assumption depends upon it.

   - (``/=``)\quad Apply :tactic:`simplify` to goal's conclusion.

   - (``//``)\quad Apply :tactic:`trivial` to goal's conclusion; this
     may solve the goal, i.e., so that the procedure's current branch
     yields no goals.

   - (``/=``)\quad Apply :tactic:`simplify` and then :tactic:`trivial`
     to goal's conclusion; this may solve the goal, so that the
     procedure's current branch yields no goals.

   - ({``$\mathit{dir``\;\mathit{occ}\;$@/$\mathit{op}$}})\quad Unfold
     (fold, if the direction is ``-``) the definition of operator
     $\mathit{op}$ at the specified occurrences of the goal's
     conclusion. See the :tactic:`rewrite` tactic for the details.

   - (``[$\iota_{11``\cdots\iota_{1{m_1}}$ | $\;\cdots$ |
     $\;\iota_{r1}\cdots\iota_{r{m_r}}$]})\quad

     * If $r=0$, then the top assumption of the goal is destructed
       using the :tactic:`case` tactic, the resulting goals are
       matched against $\iota_2,\ldots,\iota_n$, and their subgoals
       are assembled into a list of goals.

     * Otherwise $r>0$. The goal's top assumption is destructed using
       the :tactic:`case` tactic, yielding subgoals $H_1,\ldots H_p$.
       If $p\neq r$, the procedure fails. Otherwise each subgoal $H_i$
       is matched against

       .. math::

          \iota_{i1}\cdots\iota_{i{m_i}}\iota_2\cdots \iota_n

       with the resulting goals being collected into a list as
       the procedure's result.

     The following examples use the tactic :tactic:`move`, which is
     equivalent to :tactic:`idtac`.  In its simplest form, the
     introduction tactical simply gives names to assumptions.  For
     example, if the current goal is

     .. literalinclude:: examples/parts/tactics/introduction/1-1.0.ec

     then running

     .. literalinclude:: examples/parts/tactics/introduction/1-1.ec

     produces

     .. literalinclude:: examples/parts/tactics/introduction/1-1.1.ec

     Alternatively, we can use the introduction pattern ``?`` to let
     |EasyCrypt| choose the assumption names, using ``H`` as a base
     for formula assumptions and starting from the identifier names
     given in universal quantifiers:

     .. literalinclude:: examples/parts/tactics/introduction/2-1.ec

     produces

     .. literalinclude:: examples/parts/tactics/introduction/2-1.1.ec

     To see how the ``->`` rewriting pattern works, suppose the
     current goal is

     .. literalinclude:: examples/parts/tactics/introduction/4-1.0.ec

     Then running

     .. literalinclude:: examples/parts/tactics/introduction/4-1.ec

     produces

     .. literalinclude:: examples/parts/tactics/introduction/4-1.1.ec

     Alternatively, one can introduce the assumption ``x = y``, and
     then use the ``->>`` substitution pattern: if the current goal is

     .. literalinclude:: examples/parts/tactics/introduction/8-1.0.ec

     then running

     .. literalinclude:: examples/parts/tactics/introduction/8-1.ec

     produces

     .. literalinclude:: examples/parts/tactics/introduction/8-1.1.ec

     To see how a view may be applied to a not-yet-introduced formula
     assumption, suppose the current goal is

     .. literalinclude:: examples/parts/tactics/introduction/5-1.0.ec

     Then running

     .. literalinclude:: examples/parts/tactics/introduction/5-1.ec

     produces

     .. literalinclude:: examples/parts/tactics/introduction/5-1.1.ec

     And then running

     .. literalinclude:: examples/parts/tactics/introduction/5-2.ec

     on this goal produces

     .. literalinclude:: examples/parts/tactics/introduction/5-2.1.ec

     Finally, let's see examples of how a disjunction assumption may
     be destructed, either using the ``case`` tactic followed by a
     case introduction pattern, or by making the case introduction
     pattern do the destruction.  For the first case, if the current
     goal is

     .. literalinclude:: examples/parts/tactics/introduction/6-1.0.ec

     then running

     .. literalinclude:: examples/parts/tactics/introduction/6-1.ec

     produces the two goals

     .. literalinclude:: examples/parts/tactics/introduction/6-1.1.ec

     and

     .. literalinclude:: examples/parts/tactics/introduction/6-1.2.ec

     And for the second case, if the current goal is

     .. literalinclude:: examples/parts/tactics/introduction/7-1.0.ec

     then running

     .. literalinclude:: examples/parts/tactics/introduction/7-1.ec

     produces the two goals

     .. literalinclude:: examples/parts/tactics/introduction/7-1.1.ec

     and

     .. literalinclude:: examples/parts/tactics/introduction/7-1.2.ec

     Note how we used the clear pattern to discard the assumption
     ``X``.

Generalization.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

The generalization tactical moves assumptions from the context into
the conclusion and generalizes subterms or formulas of the conclusion.

.. tactic:: generalization
   :display: tactic: pi_1 \cdots \pi_n

   Generalize the patterns ``pi_1`` ... ``pi_n``, starting from
   ``pi_n`` and going back, and then run tactic ``tactic``.  This
   tactical is only applicable to certain tactics: :tactic:`move`,
   :tactic:`case` (just the version that destructs the top assumption
   of a goal's conclusion) and :tactic:`elim`.}


   - When ``pi`` is an assumption from the context, it is moved back
     into the conclusion, using universal quantification or an
     implication, as appropriate. If one assumption depends on
     another, one can't generalize the later without also generalizing
     the former.

     For example, if the current goal is

     .. literalinclude:: examples/parts/tactics/generalize/2-1.0.ec

     then running

     .. literalinclude:: examples/parts/tactics/generalize/2-1.ec

     produces

     .. literalinclude:: examples/parts/tactics/generalize/2-1.1.ec

     In this example, one cannot generalize ``x`` without also
      generalizing ``eq_xy``.

   - ``pi`` may also be a subformula or subterm of the goal, or ``_``,
     which stands for the whole goal, possibly prefixed by an
     occurrence selector. This replaces the formula or subterm with a
     universally quantified identifier of the approprate type.

     For example, if the current goal is

     .. literalinclude:: examples/parts/tactics/generalize/1-1.0.ec

     then running

     .. literalinclude:: examples/parts/tactics/generalize/1-1.ec

     produces

     .. literalinclude:: examples/parts/tactics/generalize/1-1.1.ec

     Alternatively, running

     .. literalinclude:: examples/parts/tactics/generalize/3-1.ec

     produces

     .. literalinclude:: examples/parts/tactics/generalize/3-1.1.ec

Tactics
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. toctree::

    idtac <tactics/idtac>
    move <tactics/move>
    clear <tactics/clear>
    assumption <tactics/assumption>
    reflexivity <tactics/reflexivity>
    left <tactics/left>
    right <tactics/right>
    exists <tactics/exists>
    split <tactics/split>
    congr <tactics/congr>
    subst <tactics/subst>

    trivial <tactics/trivial>
    done <tactics/done>
    simplify <tactics/simplify>
    progress <tactics/progress>
    smt <tactics/smt>
    admit <tactics/admit>

    change <tactics/change>
    pose <tactics/pose>
    have <tactics/have>
    cut <tactics/cut>

    apply <tactics/apply>
    exact <tactics/exact>
    rewrite <tactics/rewrite>

    case <tactics/case>
    elim <tactics/elim>

    algebra <tactics/algebra>

.. _subsec:tacticals:

Tacticals
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Tactics can be combined together, composed and modified by
*tacticals*. We've already seen the introduction and generalization
tacticals, which turn a tactic $\tau$ and a list of patterns into
a composite tactic, which may then combined with other tactics.

.. tactic:: sequence
   :display: tactic_1; tactic_2

   Apply ``tactic_2`` to all the subgoals generated by ``tactic_1``.
   Sequencing associates to the left.
  
   For example, if the current goal is

   .. literalinclude:: examples/parts/tactics/sequence-tactical/1-1.0.ec

   then running

   .. literalinclude:: examples/parts/tactics/sequence-tactical/1-1.ec

   produces the goals

   .. literalinclude:: examples/parts/tactics/sequence-tactical/1-1.1.ec

.. tactic:: sequence with branching
   :display: tactic; [tactic_1 | ... | tactic_n]

   Run ``tactic``, which must generate exactly $n$ subgoals, ``G_1``
   to ``G_n``, and then, for all ``i``, apply ``tactic_i`` to ``G_i``.

   For example, if the current goal is

   .. literalinclude:: examples/parts/tactics/sequence-branching-tactical/1-1.0.ec

   then running

   .. literalinclude:: examples/parts/tactics/sequence-branching-tactical/1-1.ec

   solves the goal.

.. tactic:: failure recovery
   :name: tactic-try
   :display: try tactic

   Execute the tactic ``tactic`` if it succeeds; do nothing (leave the
   goal unchanged) if it fails.

   **Remark.** By default, |EasyCrypt| proofs are run in ``strict``
   mode. In this mode, ``smt`` failures cannot be caught using
   ``try``. This allows |EasyCrypt| to always build the proof tree
   correctly, even in weak check mode, where ``smt`` calls are assumed
   to succeed. Inside a strict proof, weak check mode can be turned on
   and off at will, allowing for the fast replay of proof sections
   during development. In any event, we recommend *never* using ``try
   smt``: a little thought is much more cost-effective than failing
   ``smt`` calls.

.. tactic:: tactic repetition
   :display: do! tactic

   Apply ``tactic`` to the current goal, then repeatedly apply it to
   all subgoals, stopping on a branch only when it fails. An error is
   produced it ``tactic`` does not apply to the current goal.

   For example, if the current goal is

   .. literalinclude:: examples/parts/tactics/do-tactical/1-1.0.ec

   then running

   .. literalinclude:: examples/parts/tactics/do-tactical/1-1.ec

   produces the goals

   .. literalinclude:: examples/parts/tactics/do-tactical/1-1.1.ec

   and

   .. literalinclude:: examples/parts/tactics/do-tactical/1-1.2.ec

   **Variants.**

   - ``do? tactic``: apply ``tactic`` 0 or more times, until it fails
   - ``do n tactic`` : apply ``tactic`` with depth exactly ``n``
   - ``do n? tactic`` : apply ``tactic`` with depth at most ``n``

.. tactic:: goal selection
   :display: tactic_1; first tactic_2

   Apply the tactic ``tactic_1``, then apply ``tactic_2`` on the first
   subgoal generated by ``tactic_1``, leaving the other goals
   unchanged.  An error is produced if no subgoals are generated by
   ``tactic_1``.

   **Variants.**

   - ``tactic_1; first n tactic_2``} : apply ``tactic_2`` on the
     first ``n`` subgoals generated by ``tactic_1``

   - ``tactic_1; last tactic_2`` : apply ``tactic_2`` on the last subgoal
     generated by ``tactic_1``

   - ``tactic_1; last n tactic_2`` : apply ``tactic_2`` on the last
     ``n`` subgoals generated by ``tactic_1``

   - ``tactic; first n last`` : reorder the subgoals generated by
     ``tactic``, moving the first ``n`` to the end

   - ``tactic; last n first`` : reorder the subgoals generated by
     ``tactic``, moving the last ``n`` to the beginning

   - ``tactic; last first`` : reorder the subgoals generated
     by ``tactic``, moving the last one to the beginning

   - ``tacti; first last`` : reorder the subgoals generated by
     ``tactic``, moving the first one to the end

   For example, if the current goal is

   .. literalinclude:: examples/parts/tactics/sequence-reordering-tactical/1-1.0.ec

   then running

   .. literalinclude:: examples/parts/tactics/sequence-reordering-tactical/1-1.ec

   produces the goals

   .. literalinclude:: examples/parts/tactics/sequence-reordering-tactical/1-1.1.ec

   and

   .. literalinclude:: examples/parts/tactics/sequence-reordering-tactical/1-1.2.ec

.. tactic:: closing goals
   :display: by tactic

   Apply the tactic ``tactic`` and try to close all the generated
   subgoals using :tactic:`trivial`. Fail if not all subgoals can be
   closed.

   **Remarks.** Inside the a lemma's proof, ``by []`` is equivalent to
   ``by trivial``.  But the form

   .. code-block:: easycrypt

      lemma ... by [].

   means

   .. code-block:: easycrypt

      lemma ... by (trivial; smt).

.. .................................................................
.. _sec:programlogics:

Program Logics
--------------------------------------------------------------------

In this section, we describe the tactics of |EasyCrypt|'s three program
logics: |prhl|, |phl| and |hl|.  There are five rough classes of program
logic tactics:

#. those that actually reason about the program in Hoare logic style;

#. those that correspond to semantics-preserving program
   transformations or compiler optimizations;

#. those that operate at the level of specifications, strenghtening,
   combining or splitting goals without modifying the program;

#. tactics that automate the application of other tactics;

#. advanced tactics for handling eager/lazy sampling and bounding the
   probability of failure.

We discuss these five classes in turn.

Some of the program reasoning tactics have two modes when used on
goals whose conclusions are |prhl| statement judgements.  Their
default mode is to operate on both programs at once. When a side is
specified (using ``tau{1}`` or ``tau{2}``), a one-sided variant is
used, with ``1`` referring to the left program, and ``2`` to the right
one.

.. _subsec:reasoningprograms:

Tactics for Reasoning about Programs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. toctree::

   proc <tactics/proc>
   skip <tactics/skip>
   seq <tactics/seq>
   sp <tactics/sp>
   wp <tactics/wp>
   rnd <tactics/rnd>
   if <tactics/if>
   while <tactics/while>
   call <tactics/call>

.. _subsec:transformingprograms:

Tactics for Transforming Programs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Unless otherwise specified, the tactics of this subsection only apply
to goals whose conclusions are |prhl|, |phl| or |hl| statement
judgements, reducing such a goal to a single subgoal in which only the
program(s) of those statement judgements have changed.

Many of these tactics take *code positions* consisting of a sequence
of positive numerals separated by dots.  E.g., ``2.1.3`` says to go to
the statement 2 of the program, then to substatement 1 of it, then to
sub-substatement 3 of it. We use the variable ``c`` to range over code
positions.

.. toctree::

   swap <tactics/swap>
   inline <tactics/inline>
   rcondt <tactics/rcondt>
   rcondf <tactics/rcondf>
   
   unroll <tactics/unroll>
   splitwhile <tactics/splitwhile>
   fission <tactics/fission>
   fusion <tactics/fusion>
   
   alias <tactics/alias>
   cfold <tactics/cfold>
   kill <tactics/kill>

Tactics for Reasoning about Specifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. toctree::

   symmetry <tactics/symmetry>
   transitivity <tactics/transitivity>
   conseq <tactics/conseq>
   case_pl <tactics/case_pl>
   byequiv <tactics/byequiv>
   byphoare <tactics/byphoare>
   bypr <tactics/bypr>
   exists_star <tactics/exists_star>
   elim_star <tactics/elim_star>
   hoare <tactics/hoare>
   phoare_split <tactics/phoare_split>

.. _subsec:automatedtactics:

Automated Tactics
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. toctree::

   exfalso <tactics/exfalso>
   auto <tactics/auto>
   sim <tactics/sim>

.. _subsec:advancedtactics:

Advanced Tactics
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. toctree::

   fel <tactics/fel>
   eager <tactics/eager>
