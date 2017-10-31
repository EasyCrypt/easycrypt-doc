EasyCrypt Reference Manual
==========================

.. toctree::
   :maxdepth: 2
   :caption: Contents:

.. highlight:: easycrypt

.. role:: easycrypt(code)
   :language: easycrypt
   :class: highlight

$\overline{\alpha}_i = \sum_{j < i} \alpha_j$

.. code-block:: easycrypt

    module M = {
      proc f() = {
      }
    }.

    lemma L : false.
    proof. try admit; first case; by move. qed.

~admit~ and ~by~ and ~case~.


Indices and tables
==================

* :ref:`genindex`
* :ref:`search`
