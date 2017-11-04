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

.. FIXME

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
