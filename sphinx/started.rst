.. -*- rst -*-

.. include:: prelude.rhst

.. _chap:started:

Getting Started
====================================================================

Introduction
--------------------------------------------------------------------

|EasyCrypt| :cite:`barthe-easycrypt-intro-2014,barthe-crypto-2011` is
a framework for interactively finding, constructing, and
machine-checking security proofs of cryptographic constructions and
protocols using the code-based sequence of games approach
:cite:`bellare-rogaway-code-based-2004,bellare-rogaway-triple-enc-2006,shoup-seq-games-2004`.
In |EasyCrypt|, cryptographic games and algorithms are modeled as
*modules*, which consist of procedures written in a simple
user-extensible imperative language featuring while loops and random
sampling operations. Adversaries are modeled by *abstract* modules
|---| modules whose code is not known and can be quantified
over. Modules may be parameterized by abstract modules.

|EasyCrypt| has four logics:

#. a probabilistic, relational Hoare logic (|prhl|), relating pairs of
   procedures;

#. a probabilistic Hoare logic (|phl|) allowing one to carry out proofs
   about the probability of a procedure’s execution resulting in a
   postcondition holding;

#. an ordinary (possibilistic) Hoare logic (|hl|); and

#. an ambient higher-order logic for proving general mathematical facts
   and connecting judgments in the other logics.

Once lemmas are expressed, proofs are carried out using *tactics*,
logical rules embodying general reasoning principles, and which
transform the current lemma (or *goal*) into zero or more *subgoals*
|---| sufficient conditions for the original lemma to hold. Simple
ambient logic goals may be automatically proved using SMT
solvers. Proofs may be structured as sequences of lemmas, and
|EasyCrypt|’s *theories* may be used to group together related types,
predicates, operators, modules, axioms and lemmas. Theory parameters
that may be left abstract when proving its lemmas |---| types,
operators and predicates may be instantiated via a *cloning* process,
allowing the development of generic proofs that can later be
instantiated with concrete parameters.

Installing |EasyCrypt|
--------------------------------------------------------------------

|EasyCrypt| may be found on GitHub.

   https://github.com/EasyCrypt/easycrypt

Detailed building instructions for |EasyCrypt| and its dependencies and
supporting tools can be found in the project’s `README
file <https://github.com/EasyCrypt/easycrypt/blob/1.0/README.md>`__.

Running |EasyCrypt|
--------------------------------------------------------------------

|EasyCrypt| scripts resides in files with the ``.ec`` suffix. (As we
will see in :ref:`chap:structuring`, |EasyCrypt| also has *abstract*
theories, which must be cloned before being used. Such theories reside
in files with the ``.eca`` suffix.)

To run |EasyCrypt| in *batch* mode, simply invoke it from the shell,
giving it an |EasyCrypt| script |---| with suffix ``.ec`` as argument:

::

    easycrypt ${file}.ec

|EasyCrypt| will display its progress as it checks the
file. Information about |EasyCrypt|’s command-line arguments can be
found in :ref:`chap:advanced`.

When developing |EasyCrypt| scripts, though, |EasyCrypt| can be run
*interactively*, as a subprocess of the Emacs text editor. One’s
interaction with |EasyCrypt| is mediated by Proof General, a generic
Emacs front-end for proof assistants. Upon visiting an |EasyCrypt|
file, the “Proof-General” tab of the Emacs menu may be used execute
the file, step-by-step, as well as to undo steps, etc. Information
about the “EasyCrypt” menu tab may be found in :ref:`chap:advanced`.

A sample |EasyCrypt| script is shown in :numref:`list:startedexamp`.

.. Make this a macro
.. container:: toggle

    .. container:: header

       **Show/Hide Code**

    .. literalinclude:: examples/started-examp-1.ec
       :caption: Sample |EasyCrypt| Script
       :name: list:startedexamp

As can be inferred from the example, comments begin and end with
``(*`` and ``*)``, respectively; they may be nested. Each sentence of an
|EasyCrypt| script is terminated with a dot (period, full stop). Much
can be learned by experimenting with this script, and in particular by
executing it step-by-step in Emacs.

More Information
--------------------------------------------------------------------

More information about |EasyCrypt| |---| and about the |EasyCrypt|
Team and its work |---| may be found at
https://www.easycrypt.info. The |EasyCrypt| Club mailing list features
discussion about |EasyCrypt| usage:

    https://lists.gforge.inria.fr/mailman/listinfo/easycrypt-club

Support requests should be sent to this list, as answers to questions
will be of use to other members of the |EasyCrypt| community.

Bug Reporting
--------------------------------------------------------------------

|EasyCrypt| bugs should be reported using the Tracker:

    https://www.easycrypt.info/trac/report

You can log into the Tracker to create tickets or comment on existing
ones using any GitHub account.

About this Documentation
--------------------------------------------------------------------

The source for this document, along with the macros and language
definitions used, are available from its `GitHub
repository <https://github.com/EasyCrypt/easycrypt-doc>`__. Feel free to
use the language definitions to typeset your |EasyCrypt|-related
documents, and to contribute improvements to the macros if you have any.

This document is intended as a reference manual for the |EasyCrypt|
tool, and not as a tutorial on how to build a cryptographic proof, or
how to conduct interactive proofs. We provide some detailed examples
in :ref:`chap:examples`, but they may still seem obscure even with a
good understanding of cryptographic theory. We recommend
experimenting.
