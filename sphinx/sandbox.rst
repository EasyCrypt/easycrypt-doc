.. include:: prelude.rhst

Sandbox
====================================================================

$\overline{\alpha}_i = \sum_{j < i} \alpha_j$

.. code-block:: easycrypt

    module M = {
      proc f() = {
      }
    }.

    lemma L : false.
    proof. try admit; first case; by move. qed.

~admit~ and ~by~ and ~case~.

.. tactic:: case

   coucou
