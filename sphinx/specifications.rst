.. -*- rst -*-

.. include:: prelude.rhst

.. _chap:specifications:

Specifications
====================================================================

In this chapter, we present |EasyCrypt|'s language for writing
cryptographic specifications.  We start by presenting its typed
expression language, go on to consider its module language for
expressing cryptographic games, and conclude by presenting its ambient
logic |---| which includes judgments of the |hl|, |phl| and |prhl|
logics.

|EasyCrypt| has a typed expression language based on the polymorphic
typed lambda calculus. Expressions are guaranteed to terminate,
although their values may be under-specified.  Its type system has:

- several pre-defined base types;
- product (tuple) and record types;
- user-defined abbreviations for types and parameterized types; and
- user-defined concrete datatypes (like lists and trees).

In its expression language:

- one may use operators imported from the |EasyCrypt| library, e.g.,
  for the pre-defined base types;
- user-defined operators may be defined, including by
  structural recursion on concrete datatypes.

For each type, there is a type of probability distributions over that
type.

|EasyCrypt|'s modules consist of typed global variables and procedures.
The body of a procedure consists of local variable declarations followed
by a sequence of statements:

- ordinary assignments;
- random assignments, assigning values chosen from distributions to
  variables;
- procedure calls, whose results are assigned to variables;
- conditional (if-then-else) statements;
- while loops; and
- return statements (which may only appear at the end of
  procedures).

A module's procedures modules may refer to the global variables of
previously declared modules. Modules may be parameterized by abstract
modules, which may be used to model adversaries; and modules
types---or interfaces---may be formalized, describing modules with at
least certain specified typed procedures.

|EasyCrypt| has four logics: a probabilistic, relational Hoare logic
(|prhl|), relating pairs of procedures; a probabilistic Hoare logic
(|phl|) allowing one to carry out proofs about the probability of a
procedure's execution resulting in a postcondition holding; an
ordinary (possibilistic) Hoare logic (|hl|); and an ambient
higher-order logic for proving general mathematical facts, as well as
for connecting judgments from the other logics

Proofs are carried out using tactics, which is the focus of
Chapter :ref:`chap:tactics`.  |EasyCrypt| also has ways (theories and
sections) of structuring specifications and proofs, which will be
described in Chapter :ref:`chap:structuring`. In
Chapter :ref:`chap:library`, we'll survey the |EasyCrypt| Library,
which consists of numerous theories, defining mathematical structures
(like groups, rings and fields), data structures (like finite sets and
maps), and cryptographic constructions (like random oracles and
different forms of encryption).

.. _sec:lexical:

Lexical Categories
--------------------------------------------------------------------

|EasyCrypt|'s language has a number of lexical categories:

:Keywords: |EasyCrypt| has the following *keywords*: ``admit``,
  ``algebra``, ``alias``, ``apply``, ``as``, ``assert``,
  ``assumption``, ``auto``, ``axiom``, ``axiomatized``, ``beta``,
  ``by``, ``byequiv``, ``byphoare``, ``bypr``, ``call``, ``case``,
  ``cfold``, ``change``, ``class``, ``clear``, ``clone``, ``congr``,
  ``conseq``, ``const``, ``cut``, ``declare``, ``delta``, ``do``,
  ``done``, ``eager``, ``elif``, ``elim``, ``else``, ``end``,
  ``equiv``, ``exact``, ``exfalso``, ``exists``, ``expect``,
  ``export``, ``fel``, ``fieldeq``, ``first``, ``fission``,
  ``forall``, ``fun``, ``fusion``, ``generalize``, ``glob``, ``goal``,
  ``have``, ``hint``, ``hoare``, ``hypothesis``, ``idtac``, ``if``,
  ``import``, ``in``, ``inline``, ``instance``, ``intros``, ``iota``,
  ``islossless``, ``kill``, ``last``, ``left``, ``lemma``, ``let``,
  ``local``, ``logic``, ``modpath``, ``module``, ``move``,
  ``nolocals``, ``nosmt``, ``of``, ``op``, ``phoare``, ``pose``,
  ``Pr``, ``pr_bounded``, ``pred``, ``print``, ``proc``, ``progress``,
  ``proof``, ``prover``, ``qed``, ``rcondf``, ``rcondt``, ``realize``,
  ``reflexivity``, ``require``, ``res``, ``return``, ``rewrite``,
  ``right``, ``ringeq``, ``rnd``, ``rwnormal``, ``search``,
  ``section``, ``seq``, ``sim``, ``simplify``, ``skip``, ``smt``,
  ``sp``, ``split``, ``splitwhile``, ``strict``, ``subst``, ``swap``,
  ``symmetry``, ``then``, ``theory``, ``timeout``, ``Top``,
  ``transitivity``, ``trivial``, ``try``, ``type``, ``unroll``,
  ``var``, ``while``, ``why3``, ``with``, ``wp`` and ``zeta``.

:Identifiers: An *identifier* is a sequence of letters, digits,
  underscores (``_``) and apostrophes (``'``) that begins with a
  letter or underscore, and isn't equal to an underscore or a keyword
  other than ``expect``, ``first``, ``last``, ``left``, ``right`` or
  ``strict``.

:Operator names: An *operator name* is an identifier, a binary
  operator name, a unary operator name, or a mixfix operator name.

:Binary operator names: A *binary operator name* is

  - a nonempty sequence of equal signs (\ec{=}), less than signs
    (\ec{<}), greater than signs (\ec{>}), forward slashes (\ec{/}),
    backward slashes (\ec{\\}), plus signs (\ec{+}), minus signs
    (\ec{-}), times signs (\ec{*}), vertical bars (\ec{\|}), colons
    (\ec{:}), ampersands (\ec{&}), up arrows (\ec{^}) and percent
    signs (\ec{%}); or

  - a backtick mark (\ec{`}), followed by a nonempty sequence of one
    of these characters, followed by a backtick mark; or

  - a backward slash followed by a nonempty sequence of letters,
    digits, underscores and apostrophes.

  A binary operator name is an *infix operator name* iff it is
  surrounded by backticks, or begins with a backslash, or:

  - it is neither ``<<`` nor ``>>``; and

  - it doesn't contain a colon, unless it is a sequence of colons of
    length at least two; and \item it doesn't contain ``=>``, except
    if it is ``=>``; and \item it doesn't contain ``|``, except if it
    is ``||``; and \item it doesn't contain ``/``, except if it is
    ``/``, ``/\\``, or a sequence of slashes of length at least 3.

  The precedence hierarchy for infix operators is (from lowest to highest):

  .. csv-table:: Operators Precedences
     :header: "Operator", "Associativity"
     :delim: ;

     "``=>``";                                                                  "right-associative"
     "``<=>``";                                                                 "|---|"
     "``||``, ``\\/``";                                                         "right-associative"
     "``=``, ``<>``";                                                           "|---|"
     "``<``, ``>``, ``<=``, ``>=``";                                            "left-associative"
     "``+``, ``-``";                                                            "left-associative"
     "``*``, any nonempty combination of ``/`` and ``\%`` (other than ``//``)"; "left-associative"
     "all other infix operators except sequences of colons";                    "left-associative"
     "sequences of colons of length at least two";                              "right-associative"

:Unary operator names: A *unary operator name* is a negation sign
  (``!``), a nonempty sequence of plus signs (``+``), a nonempty
  sequence of minus signs (``-``), or a backward slash followed by a
  nonempty sequence of letters, digits, underscores and apostrophes.
  A *prefix operator name* is any unary operator name not
  consisting of either two more plus signs or two or more minus signs.

:Mixfix operator names: A *mixfix operator name* is of the following
  sequences of characters: ``\`|_|``, ``[]``, ``_.[_]`` or
  ``_.[_<-_]``.  (We'll see below how they may be used in mixfix
  form.)

:Record projections: A *record projection* is an identifier.

:Constructor names: A *constructor name* is an identifier or a
  symbolic operator name.

:Type variables: A *type variable* consists of an apostrophe followed
  by a sequence of letters, digits, underscores and apostrophes that
  begins with a lowercase letter or underscore, and isn't equal to an
  underscore.

:Type or type operator names: A *type or type operator name* is an
  identifier.

:Variable names: A *variable* name is an identifier that doesn't begin
  with an uppercase letter.

:Procedure names: A *procedure* name is an identifier that doesn't
  begin with an uppercase letter.

:Module names: A *module name* is an identifier that begins with an
  uppercase letter.

:Module type names: A *module type name* is an identifier that begins
  with an uppercase letter.

:Memory identifiers: A *memory identifier* consists an ampersand
  followed by either a nonempty sequence of digits or an identifier
  whose initial character isn't an upper case letter.

Script Structure, Printing and Searching
--------------------------------------------------------------------

An |EasyCrypt| script consists of a sequence of *steps*, terminated by
dots (``.``). Steps may:

- declare types and type constructors;
- declare operators and predicates;
- declare modules or module types;
- state axioms or lemmas;
- apply tactics;
- require (make available) theories;
- print types, operators, predicates, modules, module types, axioms
  and lemmas;
- search for lemmas involving operators.

To print an entity, one may say:

.. code-block:: easycrypt

   print type t.
   print op f.
   print pred p.
   print module Foo.
   print module type FOO.
   print axiom foo.
   print lemma goo.

The entity kind may be omitted, in which case all entities with the
given name are printed. The commands ~print op~ and ~print pred~ may
be used interchangeably, and may be applied to record field
projections and datatype constructors, as well as to operators and
predicates |---| all of which share the same name space. The commands
~print axiom~ and ~print lemma~ are also interchangeable |---| axioms
and lemmas share the same name space.

To search for axioms and lemmas involving all of a list of operators,
one can say:

.. code-block:: easycrypt

   search f.
   search (+).
   search (+) (-).  (* axioms/lemmas involving both operators *)

(Note that infix operators must be parenthesized.) Declared/stated
entities may refer to previously declared/stated entities, but not to
themselves or later ones (with the exception of recursively declared
operators on datatypes, and to references to a module's own global
variables).

Expressions Language
--------------------------------------------------------------------

Type Expressions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

|EasyCrypt|'s *type expressions* are built from *type variables*,
*type constructors* (or *named types*) function types and tuple
(product) types. Type constructors include built-in types and
user-defined types, such as *record* types and *datatypes* (or
*variant types*). The syntax of type expressions is given in
:numref:`fig:tyexpr`, whereas the precedence and associativity of
type operators are given in :numref:`fig:typrec`.

It is worth noting that |EasyCrypt|'s types must be inhabited ---
i.e. nonempty.

.. math::
   :caption: |EasyCrypt|'s type expressions
   :name: fig:tyexpr

  \begin{array}{rcl>{\bf}l}
    $\tau, \sigma$ & ::=
      & {\ec{tyvar}} & type variable\\
     && {\ec{_}} & anonymous type variable\\
     && {\ec{(tau)}} & parenthesized type\\
     && {\ec{tau -> sigma}} & function type\\
     && {\ec{(tau__1 * ... * tau__n)}} & tuple type\\
     && {\ec{tyname}} & named type\\
     && {\ec{tau tyname}} & applied type constructor\\
     && {\ec{(tau__1, $\;\ldots$, tau__n) tyname}} & \emph{ibid.}\\
  \end{array}

.. math::
   :caption: Type operators precedence and associativity
   :name: fig:typrec

  \begin{tabular}{lll}
               & \textbf{Operator} & \textbf{Associativity}\\
     \hline
               & \emph{type constructor application} & ---\\
     {\ec{*}}  & tuple constructor & ---\\
     {\ec{->}} & function type & right\\[1em]
     
     \multicolumn{3}{@{}l}{\emph{constructions with higher precedences come first}}
  \end{tabular}

Built-in types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

|EasyCrypt| comes with built-in types for booleans (``bool``),
integers (``int``) and reals (``real``), along with the singleton type
``unit`` that is inhabited by the single element ``tt`` (or ``()``).

In addition, to every type $t$ is associated the type ``t distr`` of
*discrete sub-distribution*. A discrete sub-distribution over a type
$t$ is fully defined by its mass function, i.e. by a non-negative
function from $t$ to $\mathbb{R}$ s.t. $\sum_x f(x) \le 1$ ---
implying that $f$ has a discrete support. When the sum is equal to
$1$, we say that we have a *(full) distribution*.  Note that ``distr``
is not a proper type on its own, but a *type constructor*, i.e. a
function from types to types.  A proper type is obtained by *applying*
``distr`` to an actual type, as in ``int distr`` or ``bool
distr``. See the paragraph on type constructors for more information.

Function types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
The type expression ``t -> u`` denotes the type of *total functions*
mapping elements of type ``t`` to elements of type ``u``. Note that
``->`` associates to the right, so that ``int -> bool -> real`` and
``int -> (bool -> real)`` denotes the same type.

Tuple (product) types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

The type expression ``t_1 * ... * t_n`` denotes the type of $n$-tuples
whose elements are resp. of type ``t_i``. This includes the type of
pairs as well as the type of tuples of $3$ elements or more.  Note
that ``t_1 * (t_2 * t_3)``, ``(t_1 * t_2) * t_3`` and ``t_1 * t_2 *
t_3`` are all distinct types. The first two are pair types, whereas
the last one is the type of $3$-tuples.

Type variables
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Type variables represent unknown types or type parameters. For
example, the type ``'a * 'a`` is the type the of pair whose elements
are of unknown type ``'a``. Type variables may be used in type
declarations (Section :ref:`subsec:tydecl`) to define type constructors
or in operators/predicates declarations
(Section :ref:`subsec:expressions`) to define polymorphic
operators/predicates. The special type variable ``_`` (underscore)
represents a type variable whose name is not specified.

Type constructors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Type constructors are not type expressions per se, but functions from
types to types. As seen in the built-in section, ``distr`` is such a
type constructor: when applied to the type ``t``, it gives the type
``t distr`` of sub-distributions over ``t``. Note that the application
is in *postfix* form. One other common type constructors is the one
``list`` of polymorphic list, the type expression ``t list`` denoting
the type of lists whose elements are of type ``t``.

Type constructors may depend on several type arguments, i.e. may be of
arity strictly greater than $1$. In that case, the type application is
curried. For example, the type of finite map ``(t, u) map`` (whose
keys are of type ``t`` and values of type ``u``) is constructed from
the type constructor ``map`` of arity $2$.

By abuse of notations, named types (as ``bool`` or ``int``) can be seen
as type constructors with no arguments.

Datatypes and record types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

There are no expressions for describing datatypes and record
types. Indeed, those are always named and must be defined and named
before use. See Section :ref:`subsec:tydecl` for how to define variant
and record types.

.. _subsec:tydecl:

Type Declarations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Record types may be declared like this:

.. code-block:: easycrypt

   type t = { x : int; y : bool; }.
   type u = { y : real; yy : int; yyy : real; }.

Here ``t`` is the type of records with field projections ``x`` of type
``int``, and ``y`` of type ``bool``. The order of projections is
irrelevant.  Different record types can't use overlapping projections,
and record projections must be disjoint from operators (see
below). Records may have any non-zero number of fields; values of type
``u`` are record with three fields. We may also define record type
operators, as in:

.. code-block:: easycrypt

   type 'a t = { x : 'a; f : 'a -> 'a; }.
   type ('a, 'b) u = { f : 'a -> 'b; x : 'a; }.

Then, a value of type ``int t`` would have fields ``x`` and ``f`` of
types ``int`` and ``int -> int``, respectively; and a value of type
``(int, bool) u`` would have fields ``x`` and ``f`` with types ``int``
and ``int -> bool``, respectively.

Datatypes and datatype operators may be declared like this:

.. code-block:: easycrypt

   type enum = [ First | Second | Third ].

   type either_int_bool = [ First of int | Second of bool ].

   type ('a, 'b) either = [ First of 'a | Second of 'b ].

   type intlist = [
     | Nil
     | Cons of (int * intlist) ].

   type 'a list = [
     | Nil
     | Cons of 'a & 'a list ].

Here, ``First``, ``Second``, ``Third``, ``Nil`` and ``Cons`` are
constructors, and must be distinct from all operators, record
projections and other constructors.  The type ``enum`` is an
enumerated type with the three elements ``First``, ``Second`` and
``Third``. The elements of ``either_int_bool`` consist of ``First``
applied to an integer, or ``Second`` applied to a boolean, and the
datatype operator ``either`` is simply its generalization to arbitrary
types ``'a`` and ``'b``.  The type ``intlist`` is an inductive
datatype: its elements are ``Nil`` and the results of applying
``Cons`` to a pairs of the form ``(x, ys)``, where ``x`` is an integer
and ``ys`` is a previously constructed ``intlist``.  Note that a
vertical bar (``\|``] is permitted before the first constructor of a
datatype. Finally, the type ``list`` is the generalization of
``intlist`` to lists over an arbitrary type ``'a``, but with a
twist. The use of ``&`` means that ``Cons`` is *curried*: instead of
applying ``Cons`` to a pair ``(x, ys)``, one gives it ``x : 'a`` and
``ys : 'a list`` one at a time, as in ``Cons x ys``.  Unsurprisingly,
more than one occurrence of ``&`` is allowed in a constructor's
definition. E.g., here is the datatype for binary trees whose leaves
and internal nodes are labeled by integers:


.. code-block:: easycrypt

   tree = [
     | Leaf of int
     | Node of tree & int & tree
   ].

The constructor ``Node t1 x t2`` represents the tree constructed from
an integer ``x`` and the left/right trees ``t1`` and ``t2``.
|EasyCrypt| must be able to convince itself that a datatype is
nonempty, most commonly because it has at least one constructor taking
no arguments, or only arguments not involving the datatype.

Types and type operators that are simply abbreviations for
pre-existing types may be declared, as in:

.. code-block:: easycrypt

   type t = int * bool.
   type ('a, b) arr = 'a -> 'b.

Then, e.g., ``(int, bool) arr`` is the same type as ``int -> bool``.

Finally, abstract types and type operators may be declared, as in:

.. code-block:: easycrypt

   type t.
   type ('a, b) u.
   type t, ('a, b) u.

We'll see later how such types and type operators may be used.

.. _subsec:expressions:

Expressions and Operator Declarations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We'll now survey |EasyCrypt|'s typed expressions. Anonymous functions
are written

.. code-block:: easycrypt

   fun (x : t1) => e},  

where ``x`` is an identifier, ``t1`` is a type and ``e`` is an
expression |---| probably involving ``x``.  If ``e`` has type ``t2``
under the assumption that ``x`` has type ``t1``, then the anonymous
function will have type ``t1 -> t2``.  Function application is written
using juxtapositioning, so that if ``e1`` has type ``t1 -> t2``, and
``e2`` has type ``t1``, then ``e1 e2`` has type ``t2``. Function
application associates to the left, and anonymous functions extend as
far to the right as possible.  |EasyCrypt| infers the types of the
bound variables of anonymous function when it can. Nested anonymous
functions may be abbreviated by collecting all their bound variables
together. E.g., consider the expression

.. code-block:: easycrypt

   (fun (x : int) => fun (y : int) => fun (z : bool) => y) 0 1 false

which evaluates to ``1``. It may be abbreviated to

.. code-block:: easycrypt

   (fun (x y : int, z : bool) => y) 0 1 false

or

.. code-block:: easycrypt

   (fun (x : int) (y : int) (z : bool) => y) 0 1 false

or (letting |EasyCrypt| carry out type inference)

.. code-block:: easycrypt

   (fun x y z => y) 0 1 false

In the type inference, only the type of ``y`` is determined, but
that's acceptable.

|EasyCrypt| has let expressions

.. code-block:: easycrypt

   let x : t = e in e'}

which are equivalent to

.. code-block:: easycrypt

   (fun x : t => e') $e$

As with anonymous expressions, the types of their bound variables may
often be omitted, letting |EasyCrypt| infer them.

An operator may be declared by specifying its type and giving the
expression to be evaluated. E.g.,

.. code-block:: easycrypt

   op x : int = 3.
   op f : int -> bool -> int = fun (x : int) (y : bool) => x.
   op g : bool -> int = f 1.
   op y : int = g true.
   op z = f 1 true.

Here ``f`` is a curried function |---| it takes its arguments one at a
time. Hence ``y`` and ``z`` have the same value: ``1``.  As
illustrated by the declaration of ``z``, one may omit the operator's
type when it can be inferred from its expression.  The declaration of
``f`` may be abbreviated to

.. code-block:: easycrypt

   op f (x : int) (y : bool) = x.

or

.. code-block:: easycrypt

   op f (x : int, y : bool) = x.

*Polymorphic* operators may be declared, as in

.. code-block:: easycrypt

   op g ['a, 'b] : 'a -> 'b -> 'a = fun (x : 'a, y : 'b) => x.

or

.. code-block:: easycrypt

   op g ['a, 'b] (x : 'a, y : 'b) = x.

or

.. code-block:: easycrypt

   op g (x : 'a, y : 'b) = x.

Here ``g`` has all the types formed by substituting types for the
types variable ``'a`` and ``'b`` in ``'a -> 'b -> 'a``. This allows us
to use ``g`` at different types

.. code-block:: easycrypt

   op a = g true 0.
   op b = g 0 false.

making ``a`` and ``b`` evaluate to ``true`` and ``0``, respectively.

*Abstract* operators may be declared, i.e., ones whose values are
unspecified. E.g., we can declare

.. code-block:: easycrypt

   op x : int.
   op f : int -> int.
   op g ['a, 'b] : 'a -> 'b -> 'a.

Equivalently, ``f`` and ``g`` may be declared like this:

.. code-block:: easycrypt

   op f (x : int) : int.
   op g ['a, 'b] (x : 'a, y : 'b) : 'a.

One may declare multiple abstract operators of the same type:

.. code-block:: easycrypt

   op f, g : int -> int.
   op g, h ['a, 'b] : 'a -> 'b -> 'a.

We'll see later how abstract operators may be used.

Binary operators may be declared and used with infix notation (as long
as they are infix operators). One parenthesizes a binary operator when
declaring it and using it in non-infix form (i.e., as a value).  If
``io`` is an infix operator and ``e1``, ``e2`` are expressions, then
``e1 io e2`` is translated to ``(io) e1 e2``, whenever the latter
expression is well-typed. E.g., if we declare

.. code-block:: easycrypt

   op (--) ['a, 'b] (x : 'a) (y : 'b) = x.
   op x  : int = (--) 0 true.
   op x' : int = 0 -- true.
   op y  : bool = (--) true 0.
   op y' : bool = true -- 0.

then ``x`` and ``x'`` evaluate to ``0``, and ``y`` and ``y'`` evaluate
to ``true``.

Unary operators may be declared and used with prefix notation (as long
as they are prefix operators).  One (square) brackets a unary operator
when declaring it and using it in non-prefix form (i.e., as a value).
If ``po`` is a prefix operator and ``e`` is an expression, then ``po
e`` is translated to ``[io] e``, whenever the latter expression is
well-typed. E.g., if we declare

.. code-block:: easycrypt

   op x : int.
   op f : int -> int.
   op [!] : int -> int.
   op y : int = ! f x.
   op y' : int = [!](f x).

then ``y`` and ``y'`` both evaluate to the result of applying the
abstract operator ``!`` of type ``int -> int`` to the result of
applying the abstract operator ``f`` of type ``int -> int`` to the
abstract value ``x`` of type ``int``.  Function application has higher
precedence than prefix operators, which have higher precedence than
infix operators, prefix operators group to the right, and infix
operators have the associativities and relative precedences that were
detailed in Section :ref:`sec:lexical`.

The four mixfix operators may be declared and used as follows. They
are (double) quoted when being declared or used in non-mixfix form
(i.e., as values).

- ``[]`` is translated to ``"[]"``. E.g., in the context of the
  following code , ``x`` evaluates to ``3``.

  .. code-block:: easycrypt

     op "[]" : int = 3.
     op x : int = [].

- If ``e`` is an expression, then ``\`|e|`` is translated to
  ``"\`|_|" e``, as long as the latter expression is well-typed.
  E.g., if we declare

  .. code-block:: easycrypt

     op "`|_|" : int -> bool.
     op x : bool = "`|_|" 3.
     op y : bool = `|3|.

  then ``y`` will evaluate to the same value as ``x``.

- If ``e1`` and ``e2`` are expressions, then ``e1.[e2]`` is translated
  to ``"_.[_]" e1 e2``, whenever the latter expression is
  well-typed. E.g., if we declare

  .. code-block:: easycrypt

     op "_.[_]" : int -> int -> bool.
     op x : bool = "_.[_]" 3 4.
     op y : bool = 3.[4].

  then ``y`` will evaluate to the same value as ``x``.

- If ``e1``, ``e2`` and ``e3`` are expressions, ``e1.[e2 <- e3]`` is
  translated to ``"_.[_<-_]" e1 e2 e3``, whenever the latter
  expression is well-typed. E.g., if we declare

  .. code-block:: easycrypt

     op "_.[_<-_]" : int -> int -> int -> bool.
     op x : bool = "_.[_<-_]" 3 4 5.
     op y : bool = 3.[4 <- 5].

  then ``y`` will evaluate to the same value as ``x``.

In addition, if ``e_1``, ``e_2``, ..., ``e_n`` are expressions then
``[e_1; e_2; ...; e_n]`` is translated to ``e_1 :: e_2 :: ... :: e_n :: []``
whenever the latter expression is well-typed.

The initial argument of ``"_.[_]"`` and ``"_.[_<-_]"`` have higher
precedence than even function application. E.g., one can't omit the
parentheses in

.. code-block:: easycrypt

   op f : int -> int.
   op y : bool = (f 3).[4].
   op z : bool = (f 3).[4 <- 5].

Some operators are built-in to |EasyCrypt|, automatically understood
by its ambient logic:

.. code-block:: easycrypt

   op (=) ['a]: 'a -> 'a -> bool.

   op [!] : bool -> bool.
   op (||) : bool -> bool -> bool.
   op (\/) : bool -> bool -> bool.
   op (&&) : bool -> bool -> bool.
   op (/\) : bool -> bool -> bool.
   op (=>) : bool -> bool -> bool.
   op (<=>) : bool -> bool -> bool.
   op mu : 'a distr -> ('a -> bool) -> real.

The operator ``=`` is equality. On the booleans, we have negation
``!``, two forms of disjunction (``\/`` and ``||) and conjunction
(``/\`` and ``&&``), implication (``=>``) and if-and-only-if
(``<=>``).  The two disjunctions (respectively, conjunctions) are
semantically equivalent, but are treated differently by |EasyCrypt|
proof engine. The associativities and precedences of the infix
operators were given in Section :ref:`sec:lexical`, and (as a prefix
operator) ``!`` has higher precedence than all of them. The expression
``e1 <> e2`` is treated as ``!(e1 = e2)``. The symbol ``<>`` is not an
operator, but it has the precedence and non-associative status of
Section :ref:`sec:lexical`.  The intended meaning of ``mu d p`` is the
probability that randomly choosing a value of the given type from the
sub-distribution ``d`` will satisfy the event ``p`` (in the sense of
causing it to return ``true``).

If ``e`` is an expression of type ``int``, then ``e%r`` is the
corresponding real. ``_%r`` has higher precedence than even
function application.

If ``e1`` is an expression of type ``bool`` and ``e2``, ``e3`` are
expressions of some type ``t``, then the *conditional expression*

.. code-block:: easycrypt

   e1 ? e2 : e3

evaluates to ``e2`` if ``e1`` evaluates to ``true``, and evaluates to
``e3`` if ``e1`` evaluates to ``false``.  Conditionals may also be
written using if-then-else notation:

.. code-block:: easycrypt

   if e1 then e2 else e3

E.g., if we write

.. code-block:: easycrypt

   op x : int = (3 < 4) ? 4 + 7 : (9 - 1).

then ``x`` evaluates to ``11``. The conditional expression's
precedence at its first argument is lower than function application,
but higher than the prefix operators; its second argument needn't be
parenthesized; and the precedence at its third argument is lower than
the prefix operators, but higher than the infix operators.

For the built-in types ``bool``, ``int`` and ``real``, and the type
operator ``distr``, the |EasyCrypt| Library (see
Chapter :ref:`chap:library`) provides corresponding theories, ``Bool``,
``Int``, ``Real`` and ``Distr``. These theories provide various
operations, axioms, etc.  To make use of a theory, one must
``require`` it.  E.g.,

.. code-block:: easycrypt

   require Bool Int Real Distr.

will make the theories just mentioned available. This would allow us
to write, e.g.,

.. code-block:: easycrypt

   op x = Int.(+) 3 4.

making ``x`` evaluate to ``7``. But to be able to use ``+`` and the
other operators provided by ``Int`` in infix form and without
qualification (specifying which theory to find them in), we need to
import ``Int``. If we do

.. code-block:: easycrypt

   import Bool Int Real.
   op x : int = 3 + 4 - 7 * 2.
   op y : real = 5%r * 3%r / 2%r.
   op z : bool = x%r >= y.

we'll end up with ``z`` evaluating to ``false``.  One may combine
requiring and importing in one step:

.. code-block:: easycrypt

   require import Bool Int Real Distr.

We'll cover theories and their usage in detail in
Chapter :ref:`chap:structuring`.

Requiring the theory ``Bool`` makes available the value ``{0,1}`` of
type ``bool distr``, which is the uniform distribution on the
booleans. (No whitespace is allowed in the name for this distribution,
and the ``0`` must come before the ``1``.)  Requiring the theory
``Distr`` make available syntax for the uniform distribution of
integers from a finite range. If ``e1`` and ``e2`` are expressions of
type ``int`` denoting $n_1$ and $n_2$, respectively, then ``[e1..e2]``
is the value of type ``int distr`` that is the uniform distribution on
the set of all integers that are greater-than-or-equal to $n_1$ and
less-than-or-equal-to $n_2$ |---| unless $n_1>n_2$, in which case it
is the sub-distribution assigning probability $0$ to all integers.

Values of product (tuple) and record types are constructed and
destructed as follows:

.. code-block:: easycrypt

   op x : int * int * bool = (3, 4, true).
   op b : bool = x .` 3.
   type t = { u : int; v : bool; }.
   op y : t = {| v = false; u = 10; |}.
   op a : bool = y .` v.

Then, ``b`` evaluates to ``true``, and ``a`` evaluates to ``false``.
Note the field order in the declaration of ``y`` was allowed to be a
permutation of that of the record type ``t``.

When we declare a datatype, its constructors are available to us as
values. E.g, if we declare

.. code-block:: easycrypt

   type ('a, 'b) either = [Fst of 'a | Snd of 'b].
   op x : (int, bool) either = Fst 10.
   op y : int -> (int, bool) either = Fst.
   op z : (int, bool) either = y 10.

then ``z`` evaluates to the same result as ``x``.

We can declare operators using pattern matching on the constructors of
datatypes. E.g., continuing the previous example, we can declare and
use an operator ``fst`` by:

.. code-block:: easycrypt

   op fst ['a, 'b] (def : 'a) (ei : ('a, 'b) either) : 'a =
     with ei = Fst a => a
     with ei = Snd b => def.
   op l1 : (int, bool) either = Fst 10.
   op l2 : (int, bool) either = Snd true.
   op m1 : int = fst (-1) l1.
   op m2 : int = fst (-1) l2.

Here, ``m1`` will evaluate to ``10``, whereas ``m2`` will evaluate to
``-1``.  Such operator declarations may be recursive, as long as
|EasyCrypt| can determine that the recursion is well-founded. E.g.,
here is one way of declaring an operator ``length`` that computes the
length of a list:

.. code-block:: easycrypt

   type 'a list = [Nil | Cons of 'a & 'a list].
   op len ['a] (acc : int, xs : 'a list) : int =
     with xs = Nil => acc
     with xs = Cons y ys => len (acc + 1) ys.
   op length ['a] (xs : 'a list) = len 0 xs.
   op xs = Cons 0 (Cons 1 (Cons 2 Nil)).
   op n : int = length xs.

Then ``n`` will evaluate to ``3``.

Module System
--------------------------------------------------------------------

Modules
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

|EasyCrypt|'s modules consist of typed global variables and
procedures, which have different name spaces.  :numref:`list:simpmod`
contains the definition of a simple module, ``M``, which exemplifies
much of the module language.

.. literalinclude:: examples/specifications-examp1.ec
   :caption: Simple Module
   :name: list:simpmod

``M`` has one *global variable* ``x`` which is used by the
``procedures`` of ``M`` |---| ``init``, ``incr``, ``get`` and
``main``. Global variables must be declared before the procedures that
use them.

The procedure ``init`` has a *parameter* (or *argument*) ``bnd`` of
type ``int``.  ``init`` uses a *random assignment* to assign to ``x``
an integer chosen uniformly from the integers whose absolute values
are at most ``bnd``.  The return type of ``init`` is ``unit``, whose
only element is ``tt``; this is implicitly returned by ``init`` upon
exit.

The procedure ``incr`` (``increment''), increments the value of
``x`` by its parameter ``n``. The procedure ``get`` takes no
parameters, but simply returns the value of ``x``, using
a *return statement* |---| which is only allowed as the
final statement of a procedure.

And the ``main`` procedures takes no parameters, and returns a boolean
that's computed as follows:

- It declares a local variable, ``n``, of type ``int`` |---| local in
  the sense that other procedures can't access or affect it.

- It uses a *procedure call* to call the procedure ``init`` with a
  bound of ``100``, causing ``x`` to be initialized to an integer
  between ``-100`` and ``100``.

- It calls ``incr`` twice, with ``10`` and then ``-50``.

- It uses a *procedure call assignment* to call the procedure ``get``
  with no arguments, and assign ``get``'s return value to ``n``.

- It evaluates the boolean expression ``n  < 0``, and returns the value
  of this expression as its boolean result.

|EasyCrypt| tries to infer the return types of procedures and the
types of parameters and local variables. E.g., our example module
could be written:

.. literalinclude:: examples/specifications-examp1a.ec
   :caption: Simple Module with Type Inference
   :name: SimpModInfer
   :lines: 3-25

As we've seen, each declaration or statement of a procedure is
terminated with a semicolon.  One may combine multiple local variable
declarations, as in:

.. code-block:: easycrypt

    var x, y, z : int;
    var u, v;
    var x, y, z : int = 10;
    var x, y, z = 10;


Procedure parameters are variables; they may be modified during the
execution of their procedures.  A procedure's parameters and local
variables must be distinct variable names.  The three kinds of
assignment statements differ according to their allowed right-hand
sides (rhs):

- The rhs of a random assignment must be a single
  (sub-)distribution. When choosing from a proper sub-distribution,
  the random assignment may fail, causing the procedure call that
  invoked it to fail to terminate.

- The rhs of an ordinary assignment may be an arbitrary expression
  (which doesn't include use of procedures).

- the rhs of a procedure call assignment must be a single procedure
  call.

If the rhs of an assignment produces a tuple value, its left-hand side
may use pattern matching, as in

.. code-block:: easycrypt

   (x, y, z) <- e;

in the case where ``e`` produces a triple.

The two remaining kinds of statements are illustrated in
:numref:`list:condwhileexamp`: *conditionals* and *while loops*.

.. literalinclude:: examples/specifications-examp2.ec
   :caption: Conditionals and While Loops
   :name: list:condwhileexamp

``N`` has a single procedure, ``loop``, which begins by initializing a
local variable ``y`` to ``0``. It then enters a while loop, which
continues executing until (which may never happen) ``y`` becomes
``10`` or more. At each iteration of the while loop, an integer
between ``1`` and ``10`` is randomly chosen and assigned to the local
variable ``z``. The conditional is used to behave differently
depending upon whether the value of ``z`` is less-than-or-equal-to
``5`` or not.

- When the answer is ``yes'', ``y`` is decremented by ``z``.

- When the answer is ``no'', ``y`` is incremented by ``z - 5``.

Once (if) the while loop is exited |---| which means ``y`` is now
``10`` or more |---| the procedure returns ``y``'s value as its return
value.

When the body of a while loop, or the then or else part of a
conditional, has a single statement, the curly braces may be
omitted. E.g., the conditional of the preceding example could be
written:

.. code-block:: easycrypt

   if (z <= 5)
     y <- y - z;
   else
     y <- y + (z - 5);

And when the else part of a conditional is empty, it may be omitted,
as in:

.. code-block:: easycrypt

   if (z <= 5) y <- y - z;

As illustrated in :numref:`list:usingothermoduleexamp`, modules may
access the global variables, and call the procedures, of previously
declared modules.

.. literalinclude:: examples/specifications-examp3.ec
   :caption: One Module Using Another Module
   :name: list:usingothermoduleexamp

Procedure ``g`` of ``N`` both accesses the global variable ``x`` of
module ``M`` (``M.x``), and calls ``M``'s procedure, ``f`` (``M.f``).
The parameter list of ``g`` could equivalently be written:

.. code-block:: easycrypt

   n : int, m : int, b : bool  

A module may refer to its own global variables using its own module
name, allowing us to write

.. code-block:: easycrypt

   proc f() : unit = {
     M.x <- M.x + 1;
   }

for the definition of procedure ``M.f``.  The procedure ``h`` of ``N``
is an alias for procedure ``M.f``: calling it is equivalent to
directly calling ``M.f``.  One declare a module name to be an alias
for a module, as in

.. code-block:: easycrypt

   module L = N.

A procedure call is carried out in the context of a *memory* recording
the values of all global variables of all declared modules.  So all
global variables are |---| by definition |---| initialized. On the
other hand, the local variables of a procedure start out as arbitrary
values of their types.  This is modeled in |EasyCrypt|'s program
logics by our not knowing anything about them. For example, the
probability of ``X.f()``

.. code-block:: easycrypt

   module X = {
     proc f() : bool = {
       var b : bool;
       return b;
     }
   }.

returning ``true`` is undefined |---| we can't prove anything about
it.  On the other hand, just because a local variable isn't
initialized before use doesn't mean the result of its use will be
indeterminate, as illustrated by the procedure ``Y.f``, which always
returns ``0``:

.. code-block:: easycrypt

   module Y = {
     proc f() : int = {
       var x : int;
       return x - x;
     }
   }.

Module Types
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

|EasyCrypt|'s *module types* specify the types of a set of
procedures.  E.g., consider the module type ``OR``:

.. literalinclude:: examples/specifications-examp4.ec
   :caption: Module Type Example
   :lines: 3-4

``OR`` describes minimum expectations for a *guessing oracle* |---|
that it provide at least procedures with the specified types.  The
order of the procedures in a module type is irrelevant. In a
procedure's type, one may combine multiple parameters of the same
type, as in:

.. code-block:: easycrypt

   proc init(secret tries : int) : unit

The names of procedure parameters used in module types
are purely for documentation purposes; one may elide them instead
using underscores, writing, e.g.,

.. code-block:: easycrypt

   proc init(_ : int, _ : int) : unit

Note that module types say nothing about the global variables a module
should have. Modules types have a different name space than modules.

:numref:`list:guessormodule` contains an example guessing oracle
implementation.

.. literalinclude:: examples/specifications-examp4.ec
   :caption: Guessing Oracle Module
   :lines: 9-30
   :name: list:guessormodule

Its ``init`` procedure stores the supplied secret in the global
variable ``sec``, initializes the allowed number of guesses in the
global variable ``tris``, and initializes the ``guessed`` global
variable to record that the secret hasn't yet been guessed.  If more
allowed tries remain, the ``guess`` procedure updates ``guessed`` to
take into account the supplied guess, and decrements the allowed
number of tries; otherwise, it does nothing.  And its ``guessed``
procedure returns the value of ``guessed``, indicating whether the
secret has been successfully guessed, so far.  ``Or`` *satisfies* the
specification of the module type ``OR``, and we can ask |EasyCrypt| to
check this by supplying that module type when declaring ``Or``, as in
:numref:`list:guessormodulecheck`.

.. literalinclude:: examples/specifications-examp5.ec
   :caption: Guessing Oracle Module with Module Type Check
   :lines: 9-30
   :name: list:guessormodulecheck

Supplying a module type *doesn't* change the result of a module
declaration. E.g., if we had omitted ``guessed`` from the module type
``OR``, the module ``Or`` would still have had the procedure
``guessed``. Furthermore, when declaring a module, we can ask
|EasyCrypt| to check whether it satisfies multiple module types, as
in:

.. code-block:: easycrypt

   module type A = { proc f() : unit }.
   module type B = { proc g() : unit }.
   module X : A, B = {
     var x, y : int
     proc f() : unit = { x <- x + 1; }
     proc g() : unit = { y <- y + 1; }
   }.

When declaring a module alias, one may ask |EasyCrypt| to check that
the module matches a module type, as in:

.. code-block:: easycrypt

   module X' : A, B = X.

Suppose we want to declare a cryptographic game using our guessing
oracle, parameterized by an adversary with access to the ``guess``
procedure of the oracle, and which provides two procedures |---| one
for choosing the range in which the guessing game will operate, and
one for doing the guessing.  We'd like to write something like:

.. code-block:: easycrypt

   module type GAME = {
     proc main() : bool
   }.

   module Game(Adv : ADV) : GAME = {
     module A = Adv(Or)
     proc main() : bool = { #\ldots# }
   }.

Thus, the module type ``ADV`` for adversaries must be parameterized by
an implementation of ``OR``. Given the adversary procedures we have in
mind, the syntax for this is

.. code-block:: easycrypt

   module type ADV(O : OR) = {
     proc chooseRange() : int * int
     proc doGuessing() : unit
   }.

But this declaration would give the adversary access to all of ``O``'s
procedures, which isn't what we want. Instead, we can write

.. code-block:: easycrypt

   module type ADV(O : OR) = {
     proc chooseRange() : int * int {}
     proc doGuessing() : unit {O.guess}
   }.

meaning that ``chooseRange`` has no access to the oracle, and
``doGuessing`` may only call its ``guess`` procedure. Using this
notation, our original attempt would have to be written

.. code-block:: easycrypt

   module type ADV(O : OR) = {
     proc chooseRange() : int * int {O.init O.guess O.guessed}
     proc doGuessing() : unit {O.init O.guess O.guessed}
   }

Finally, we can specify that ``chooseRange`` must initialize all of
the adversary's global variables (if any) by using a star annotation:

.. code-block:: easycrypt

   module type ADV(O : OR) = {
     proc * chooseRange() : int * int {}
     proc doGuessing() : unit {O.guess}
   }.

The full Guessing Game example is contained in
:numref:`list:fullguessing`.

.. literalinclude:: examples/specifications-examp5.ec
   :caption: Full Guessing Game Example
   :name: list:fullguessing

``SimpAdv`` is a simple implementation of an adversary.  The inclusion
of the constraint ``SimpAdv : ADV`` in ``SimpAdv``'s declaration

.. code-block:: easycrypt

   module (SimpAdv : ADV) (O : OR) = #\ldots#

makes |EasyCrypt| check that ``SimpAdv`` implements the module type
``ADV``: its implementation of ``chooseRange`` doesn't use ``O`` at
all; its implementation of ``doGuessing`` doesn't use any of ``O``'s
procedures other than ``guess``; and that ``chooseRange`` initializes
``SimpAdv``'s global variables.  Its ``chooseRange`` procedure chooses
the range of ``1`` to ``100``, and initializes global variables
recording this range and the number of guesses it will make (see the
code of ``Game`` to see why ``10`` is a sensible choice). The
``doGuessing`` procedure makes ``10`` random guesses.  It would be
legal for the parameter ``O`` in ``SimpAdv``'s definition to be
constrained to match a module type ``T`` providing a proper subset of
``OR``'s procedures, but that would further limit what procedures of
``O`` ``SimpAdv``'s procedures could call. On the other hand, it would
be illegal for ``T`` to provide procedures not in ``OR``.

Despite ``SimpAdv`` being a parameterized module, to refer to one of
its global variables from another module one ignores the parameter,
saying, e.g.,

.. code-block:: easycrypt

   module X = {
     proc f() : int = {
       return SimpAdv.tries;
     }
   }.

On the other hand, to call one of ``SimpAdv``'s procedures, one needs
to specify which oracle parameter it will use, as in:

.. code-block:: easycrypt

   module X = {
     proc f() : unit = {
       SimpAdv(Or).doGuessing();
     }
   }.

The module ``Game`` gives its adversary parameter, ``Adv``, the
concrete guessing oracle ``Or``, calling the resulting module
``A``. Its main function then uses ``Or`` and ``A`` to run the game.

- It calls ``A``'s ``chooseRange`` procedure to get the adversary's
  choice of guessing range. If the range doesn't have at least ten
  elements, it returns ``false`` without doing anything else |---| the
  adversary has supplied a range that's too small.

- Otherwise, it uses ``Or.init`` to initialize the guessing oracle
  with a secret that's randomly chosen from the range, plus a number
  of allowed guesses that's one tenth of the range's size.

- It then calls ``A.doGuessing``, allowing the adversary to attempt
  the guess the secret.

- Finally, it calls ``Or.guessed`` to learn whether the adversary has
  guessed the secret, returning this boolean value as its result.

Finally, the declaration

.. code-block:: easycrypt

    module SimpGame = Game(SimpAdv).

declares ``SimpGame`` to be the specialization of ``Game`` to our
simple adversary, ``SimpAdv``. When processing this declaration,
|EasyCrypt|'s type checker verifies that ``SimpAdv`` satisfies the
specification ``ADV``.  The reader might be wondering what |---| if
anything |---| prevents us writing a version of ``SimpAdv`` that
directly accesses/calls the global variables and procedures of ``Or``
(or of ``Game``, were ``SimpAdv`` declared after it), violating our
understanding of the adversary's power. The answer is that
|EasyCrypt|'s type checker isn't in a position to do this. Instead,
we'll see in the next section how such constraints are modeled using
|EasyCrypt|'s logic.

.. _subsec:globalvariables:

Global Variables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The set of all *global variables of* a module ``M`` is the union of

- the set of global variables that are declared in ``M``; and

- the set of all that global variables declared in other modules such
  that the variables *could* be read or written by a series of
  procedure calls beginning with a call of one of ``M``'s
  procedures. By *could* we mean the read/write analysis assumes the
  execution of both branches of conditionals, the execution of while
  loop bodies, and the terminal of while loops.

To print the global variables of a module ``M``, one runs:

.. code-block:: easycrypt

   print glob M.

For example, suppose we make these declarations:

.. code-block:: easycrypt

   module Y1 = {
     var y, z : int
     proc f() : unit = { y <- 0; }
     proc g() : unit = { }
   }.
   module Y2 = {
     var y : int
     proc f() : unit = { Y1.f(); }
   }.
   module Y3 = {
     var y : int
     proc f() : unit = { Y1.g(); }
   }.
   module type X = {
     proc f() : unit
   }.
   module Z(X : X) = {
     var y : int
     proc f() : unit = { X.f(); }
   }.

Then: the set of global variables of ``Y1`` consists of ``Y1.y`` and
``Y1.z``; the set of global variables of ``Y2`` consists of ``Y1.y``
and ``Y2.y``; the set of global variables of ``Y3`` consists of
``Y3.y``; the set of global variables of ``Z`` consists of ``Z.y``;
and the set of global variables of ``Z(Y1)`` consists of ``Z.y`` and
``Y1.y``. In the case of ``Z``, because its parameter ``X`` is
abstract, no global variables are obtained from ``X``.

For every module ``M``, there is a corresponding type, ``glob M$``,
where a value of type ``glob M$`` is a tuple consisting of a value for
each of the global variables of ``M``. Nothing can be done with values
of such types other than compare them for equality.

Logics
--------------------------------------------------------------------

Formulas
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The *formulas*} of |EasyCrypt|'s ambient logic are formed by adding to
|EasyCrypt|'s expressions

- universal and existential quantification,

- application of built-in and user-defined predicates,

- probability expressions and lossless assertions, and

- |hl|, |phl| and |prhl| judgments,

and identifying the formulas with the extended expressions of type
``bool``.  This means we automatically have all boolean operators as
operators on formulas, with their normal precedences and
associativities, including negation

.. code-block:: easycrypt

   op [!] : bool -> bool.

the two semantically equivalent disjunctions

.. code-block:: easycrypt

   op (||) : bool -> bool -> bool.
   op (\/) : bool -> bool -> bool.

the two semantically equivalent conjunctions

.. code-block:: easycrypt

   op (&&) : bool -> bool -> bool.
   op (/\) : bool -> bool -> bool.

implication

.. code-block:: easycrypt

   op (=>) : bool -> bool -> bool.

and if-and-only-if

.. code-block:: easycrypt

   op (<=>) : bool -> bool -> bool.

The quantifiers' bound identifiers are typed, although |EasyCrypt|
will attempt to infer their types if they are omitted. Universal and
existential quantification are written as

.. code-block:: easycrypt

   forall (x : t), \phi

and

.. code-block:: easycrypt

   exists (x : t), phi

respectively, where the formula ``phi`` typically involves the
identifier ``x`` of type ``t``. We can abbreviate nested universal or
existential quantification in the style of nested anonymous functions,
writing, e.g.,

.. code-block:: easycrypt

   forall (x : int, y : int, z : bool), ...
   forall (x y : int, z : bool), ...
   forall (x y : int) (z : bool), ...
   exists (x : int, y : int, z : bool), ...
   exists (x y : int, z : bool), ...
   exists (x y : int) (z : bool), ...

Quantification extends as far to the right as possible, i.e., has
lower precedence than the binary operations on formulas.

Abstract *predicates* may be defined as in:

.. code-block:: easycrypt

   pred P0.
   pred P1 : int.
   pred P2 : int & (int * bool).
   pred P3 : int & (int * bool) & (real -> int).

``P0``, ``P1``, ``P2`` and ``P3`` are extended expressions of types
``bool``, ``int -> bool``, ``int -> int * bool -> bool`` and ``int ->
int * bool -> (real -> int) -> bool``, respectively.  The parentheses
are mandatory in ``(int * bool)`` and ``(real -> int)``.  Thus, if
``e1``, ``e2`` and ``e3`` are extended expressions of types ``int``,
``int * bool`` and ``real -> int``, respectively, then ``P0``,
``P1 e1``, ``P2 e1 e2`` and ``P3 e1 e2 e3`` are formulas.

Concrete predicates are defined in a way that is similar to how
operators are declared.  E.g., if we declare

.. code-block:: easycrypt

   pred Q (x y : int, z : bool) = x = y /\ z.

or

.. code-block:: easycrypt

   pred Q (x : int) (y : int) (z : bool) = x = y /\ z.

then ``Q`` is an extended expression of type

.. code-block:: easycrypt

   int -> int -> bool -> bool

meaning that, e.g.,

.. code-block:: easycrypt

   (fun (b : bool -> bool) => b true) (Q 3 4)

is a formula.  And here is how polymorphic predicates may be defined:

.. code-block:: easycrypt

   pred R ['a, 'b] : ('a, 'a * 'b).
   pred R' ['a, 'b] (x : 'a, y : 'a * 'b) = (y.`1 = x).

Extended expressions also include program memories, although there
isn't a type of memories, and anonymous functions and operators can't
take memories as inputs.  If ``&m`` is a memory and $x$ is a program
variable that's in ``&m``'s domain, then ``x{&m}`` is the extended
expression for the value of ``x`` in ``&m``.  Quantification over
memories is allowed:

.. code-block:: easycrypt

   forall &m, phi

Here, ``&m`` ranges over all memories with domains equal to the set of
all variables declared as global in currently declared modules.  E.g.,
suppose we have declared:

.. code-block:: easycrypt

   module X = { var x : int }.
   module Y = { var y : int }.

Then, this is a (true) formula:

.. code-block:: easycrypt

   forall &m, X.x{m} < Y.y{m} => X.x{m} + 1 <= Y.y{m}

|EasyCrypt|'s logics can introduce memories whose domains include not
just the global variables of modules but also:

- the local variables and parameters of procedures; and

- ``res``, whose value in a memory resulting from running a procedure
  will record the result (return value) of the procedure.

There is no way for the user to introduce such memories directly.  We
can't do anything with memories other than look up the values of
variables in them. In particular, formulas can't test or assert the
equality of memories.

If ``M`` is a module and ``&m`` is a memory, then ``(glob M){m}`` is
the value of type ``glob M`` consisting of the tuple whose components
are the values of all the global variables of ``M`` in ``&m``.  (See
Subsection :ref:`subsec:globalvariables` for the definition of the set
of all global variables of a module.)

For convenience, we have the following derived syntax for formulas: If
$\phi$ is a formula and ``&m`` is a memory, then ``phi{m}`` means the
formula in which every subterm ``u`` of ``phi`` consisting of a
variable or ``res`` or ``glob M``, for a module ``M``, is replaced
by ``u{m}``.  For example,

.. code-block:: easycrypt

   (Y1.y = Y1.z => Y1.z = Y1.y){m}

expands to

.. code-block:: easycrypt

   Y1.y{m} = Y1.z{m} => Y1.z{m} = Y1.y{m}

The parentheses are necessary, because ``_{m}`` has higher precedence
than even function application.  We say that ``&m`` satisfies ``phi``
iff ``phi{m}`` holds.

Extended expressions also include modules, although there isn't a type
of modules, and anonymous functions and operators can't take modules
as inputs.  Quantification over modules is allowed. If ``T`` is a
module type, and ``M`` is a module name, then

.. code-block:: easycrypt

   forall (M <: T), phi

means **for all modules ``M`` satisfying ``T``, ``phi`` holds**.

Formulas can't talk about module equality.

There is also a variant form of module quantification of the
the form

.. code-block:: easycrypt

   forall (M <: T{N_1,...,N_l}), phi

where the ``N_i``'s are modules. Its meaning is **for all modules
``M`` satisfying ``T`` whose sets of global variables are disjoint
from the sets of global variables of the ``N_i``'s, ``phi`` holds**.

Finally, |EasyCrypt|'s ambient logic has probability expressions,
|hl|, |phl| and |prhl| judgments, and lossless assertions:


- **Probability Expressions..** A *probability expression*
  has the form ``Pr[M.p(e_1,...,e_n) @ &m : \phi]`` where:

  - ``p`` is a procedure of module ``M`` that takes $n$ arguments, whose
    types agree with the types of the ``e_i``'s;

  - ``&m`` is a memory whose domain is the global variables of all
    declared modules;

  - the formula ``phi`` may involve the term ``res``, whose type is
    ``M.p``'s return type, as well as global variables of modules.

  Occurrences in ``phi`` of bound identifiers (bound outside the
  probability expression) whose names conflict with parameters and
  local variables of ``M.p`` will refer to the bound identifiers, not
  the parameters/local variables.

  The informal meaning of the probability expression is the
  probability that running ``M.p`` with arguments ``e_1,...,e_n``, and
  initial memory ``&m`` will terminate in a final memory satisfying
  ``phi``. To run ``M.p``:

  - ``&m`` is extended to map ``M.p``'s parameters to the ``e_i``'s,
    and to map the procedure's local variables to *arbitrary* initial
    values;

  - the body of the procedure is run in this extended memory;

  - if the procedure returns, its return value will be stored in a
    component ``res`` of the resulting memory, and the procedure's
    parameters and local variables will be removed from that memory.

  If the procedure doesn't initialize its local variables before using
  them, the probability expression may be undefined.

- **|hl| Judgments**. A |hl| *judgment* has the form ``hoare[$M$.$p$ :
  $\,\phi$ ==> $\,\psi$]`` where:

  - ``p`` is a procedure of module ``M``;

  - the formula ``phi`` may involve the global variables of declared
    modules, as well as the parameters of ``M.p``;

  - the formula $\psi$ may involve the term ``res``, whose type is
    ``M.p``'s return type, as well as the global variables of
    declared modules.

  Occurrences in ``phi`` and ``psi`` of bound identifiers (bound
  outside the judgment) whose names conflict with parameters and local
  variables of ``M.p`` will refer to the bound identifiers, not the
  parameters/local variables.

  The informal meaning of the |hl| judgment is that, for all initial
  memories ``&m`` satisfying ``phi`` and whose domains consist of the
  global variables of declared modules plus the parameters and local
  variables of ``M.p``, if running the body of ``M.p`` in ``&m``
  results in termination with a memory, the restriction of that memory
  to ``res`` and the global variables of declared modules satisfies
  ``psi``.

- **|phl| Judgments**. A |phl| *judgment* has one of the following
  forms:

  - ``phoare [M.p : phi ==> psi] < e``
  - ``phoare [M.p : phi ==> psi] = e``
  - ``phoare [M.p : phi ==> psi] > e``

  where:

  - ``p`` is a procedure of module ``M``;

  - the formula ``phi`` may involve the global variables of declared
    modules, as well as the parameters of ``M.p``;

  - the formula $\psi$ may involve the term ``res``, whose type is
    ``M.p``'s return type, as well as the global variables of
    declared modules;

  - ``e`` is an expression of type ``real``.

  Occurrences in ``phi`` and ``psi`` and of bound identifiers (bound
  outside the judgment) whose names conflict with parameters or local
  variables of ``M.p`` will refer to the bound identifiers, not the
  parameters/local variables. ``e`` will have to be parenthesized
  unless it is a constant or nullary operator.

  The informal meaning of the |phl| judgment is that, for all initial
  memories ``&m`` satisfying $\phi$ and whose domains consist of the
  global variables of declared modules plus the parameters and local
  variables of ``M.p``, the probability that **running the body of
  ``M.p`` in ``&m`` results in termination with a memory whose
  restriction to ``res`` and the global variables of declared modules
  satisfies ``psi`` has the indicated relation to the value of $e$**.

- **|prhl| Judgments**. A |prhl| *judgment* has the form
  ``equiv[M.p ~ N.q : phi ==> psi]`` where:

  - ``p`` is a procedure of module ``M``, and ``q`` is a procedure of module
    ``N``;

  - the formula ``phi`` may involve the global variables of declared
    modules, the parameters of ``M.p``, which must be interpreted
    in memory ``&1`` (e.g., ``x{1}), and the parameters of
    ``N.q``, which must be interpreted in memory ``&2``;

  - the formula ``psi`` may involve the global variables of declared
    modules, ``res{1}``, which has the type of ``M.p``'s return type,
    and ``res{2}``, which has the type of ``N.q``'s return type.

  Occurrences in ``psi`` of bound identifiers (bound outside the
  judgment) whose names conflict with parameters and local variables
  of ``M.p`` and ``N.q`` will refer to the bound identifiers, not the
  parameters and local variables, even if they are enclosed in memory
  references (e.g., ``x{1}``). If ``&1`` (resp., ``&2``) is a bound
  memory (outside the judgment), then all references to ``&1`` (resp.,
  ``&2``) in ``phi`` and ``psi`` are renamed to use a fresh memory.

  The informal meaning of the |prhl| judgment is that, for all initial
  memories ``&1`` whose domains consist of the global variables of
  declared modules plus the parameters and local variables of ``M.p``,
  for all initial memories ``&2`` whose domains consist of the global
  variables of declared modules plus the parameters and local
  variables of ``N.q``, if ``phi`` holds, then the sub-distributions
  on memories $\Pi_p$ and $\Pi_q$ obtained by running ``M.p`` on
  ``&1``, storing ``p``'s result in the component ``res`` of the
  resulting memory, from which ``p``'s parameters and local variables
  are removed, and running ``N.q`` on ``&2``, storing ``q``'s result
  in the component ``res`` of the resulting memory, from which ``q``'s
  parameters and local variables are removed, satisfy ``psi``, in the
  following sense.  (The probability of a memory in $\Pi_p$ (resp.,
  $\Pi_q$) is the probability that ``p`` (resp., ``q``) will terminate
  with that memory. $\Pi_p$ and $\Pi_q$ are *sub*-distributions on
  memories because ``p`` and ``q`` may fail to terminate.)

  We say that $(\Pi_p, \Pi_q)$ *satisfy* ``psi`` iff there is a
  function $f$ dividing the probability assigned to each memory ``&m``
  by $\Pi_p$ among the memories ``&n`` related to it by ``psi``
  (``&m`` and ``&n`` are related according to ``psi`` iff ``psi``
  holds when references to ``&1`` are replaced by reference to ``&m``,
  and reference to ``&2`` are replaced by reference to ``&n``) such
  that, for all memories ``&n``, the value assigned to ``&n`` by
  $\Pi_q$ is the sum of all the probabilities distributed to ``&n`` by
  $f$. (When ``psi`` is an equivalence like ``={res}`` (i.e., ``res{1}
  = res{2}``), this is particularly easy to interpret.)

- **Lossless Assertions**. A *lossless assertion* has the form
  ``islossless $\,M$.$p$`` and is simply an abbreviation for ``phoare
  [M.p : true ==> true] = 1%r``.

For the purpose of giving some examples, consider these declarations:

.. code-block:: easycrypt

   module G1 = {
     proc f() : bool = {
       var x : bool;
       x <$ {0,1};
       return x;
     }
   }.

   module G2 = {
     proc f() : bool = {
       var x, y : bool;
       x <$ {0,1}; y <$ {0,1};
       return x ^^ y;  (* ^^ is exclusive or *)
     }
   }.

Then:

- The expression ``Pr[G1.f() @ &m : res]`` is the probability that
  ``G1.f()`` returns ``true`` when run in the memory ``&m``. (The
  memory is irrelevant, and the expression's value is ``1%r /
  2%r``.)

- The |hl| judgement ``hoare[G2.f : true ==> !res]`` says that, if
  ``G2.f()`` halts (which we know it will), then its return value will
  be ``false``. (This judgement is ``false``.)

- The |phl| judgement ``phoare [G2.f : true ==> res] = (1%r / 2%r)``
  says that the probability of ``G2.f()`` returning ``true`` is ``1%r
  / 2%r``. (This judgement is ``true``.)

- The |prhl| judgement ``equiv[G1.f ~ G2.f : true ==> res]`` says that
  ``G1.f()`` and ``G2.f()`` are equally likely to return ``true`` as
  well as equally likely to return ``false``.  (This judgement is
  ``true``.)

- The lossless assertion ``lossless G2.f`` says that ``G2.f()`` always
  terminates, no matter what memory it's run in. (This judgement is
  ``true``.)

Axioms and Lemmas
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

One states an *axiom* or *lemma* by giving a well-typed formula with
no free identifiers, as in:

.. code-block:: easycrypt

   axiom Sym : forall (x y : int), x = y => y = x.
   lemma Sym : forall (x y : int), x = y => y = x.

The difference between axioms and lemmas is that axioms are trusted
by |EasyCrypt|, whereas lemmas must be proved, in the steps that
follow. The *proof* of a lemma has the form

.. code-block:: easycrypt

   proof.
   tactic_1. tactic_2. ... tactic_n.
   qed.

Actually the ``proof`` step is optional, but it's good style to
include it. The steps of the proof consist of tactic applications; but
``print`` and ``search`` commands are also legal steps.  The ``qed``
step saves the lemma, making it available for reuse; it's only allowed
when the proof is complete.  If the name chosen for a lemma conflicts
with an already stated axiom or lemma, one only finds this out upon
running ``qed``, which will fail.

When the proof for a lemma has a very simple form, the proof may be
included as part of the lemma's statement:

.. code-block:: easycrypt

   lemma L : phi by [tactic].

or

.. code-block:: easycrypt

   lemma L : phi by [].

In the first case, the proof consists of a single tactic; the meaning
of ``by []`` will be described in Chapter :ref:`chap:tactics`.

One may also parameterize an axiom of lemma by the free identifiers of
its formula, as in:

.. code-block:: easycrypt

   lemma Sym (x : int) (y : int) : x = y => y = x.

or

.. code-block:: easycrypt

   lemma Sym (x y : int) : x = y => y = x.

This version of ``Sym`` has the same logical meaning as the previous
one. But we'll see in Chapter :ref:`chap:tactics` why the parameterized
form makes an axiom or lemma easier to apply.

Polymorphic axioms and lemmas may be stated using a syntax reminiscent
of the one for polymorphic operators:

.. code-block:: easycrypt

   lemma Sym ['a] (x y : 'a) : x = y => y = x.
   lemma PairEq ['a, 'b] (x x' : 'a) (y y' : 'b) :
     x = x' => y = y' => (x, y) = (x', y').

or

.. code-block:: easycrypt

   lemma Sym (x y : 'a) : x = y => y = x.
   lemma PairEq (x x' : 'a) (y y' : 'b) :
     x = x' => y = y' => (x, y) = (x', y').

We can axiomatize the meaning of abstract types, operators and
relations.  E.g., an abstract type of monoids may be axiomatized by:

.. code-block:: easycrypt

   type monoid.
   op id : monoid.
   op (+) : monoid -> monoid -> monoid.
   axiom LeftIdentity (x : monoid) : id + x = x.
   axiom RightIdentity (x : monoid) : x + id = x.
   axiom Associative (x y z : monoid) : x + (y + z) = (x + y) + z.

Any proofs we do involving monoids will then apply to any valid
instantiation of ``monoid``, ``id`` and ``(+)``. In
Chapter :ref:`chap:structuring`, we'll see how to carry out such
instantiations using theory cloning.

One must be careful with axioms, however, because it's easy to
introduce inconsistencies, allowing one to prove false formulas. E.g.,
because all types must be nonempty in |EasyCrypt|, writing

.. code-block:: easycrypt

   type t.
   axiom Empty : !(exists (x : t), true).

will allow us to prove ``false``.

Axioms and lemmas may be parameterized by memories and
modules. Consider the declarations:

.. code-block:: easycrypt

   module type T = {
     proc f() : unit
   }.
   module G(X : T) = {
     var x : int
     proc g() : unit = {
       X.f();
     }
   }.

Then lemma ``Lossless``

.. code-block:: easycrypt

   lemma Lossless (X <: T) : islossless X.f => islossless G(X).g.

which is parameterized by an abstract module ``X`` of module type
``T``, says that ``G(X).g`` always terminates, no matter the memory
it's run in, as long as this is true of ``X.f``.

Lemma ``Invar`` (see below)

.. code-block:: easycrypt

   lemma Invar (X <: T{G}) (n : int) :
     islossless X.f =>
     phoare [G(X).g : G.x = n ==> G.x = n] = 1%r.

which is parameterized by an abstract module ``X`` of module type
``T`` that is guaranteed not to access or modify ``G.x``, and an
integer ``n``, says that, assuming ``X.f`` is lossless, if
``G(X).g()`` is run in a memory giving ``G.x`` the value ``n``, then
``G(X).g()`` is guaranteed to terminate in a memory in which ``G.x``'s
value is still ``n``.  Finally lemma ``Invar'`` (see below)

.. code-block:: easycrypt

   lemma Invar' (X <: T{G}) (n : int) &m :
     islossless X.f => G.x{m} = n =>
     Pr[G(X).g() @ &m : G.x = n] = 1%r.

which has the parameters of ``Invar`` plus a memory ``&m``, says the
same thing as ``Invar``, but using a probability expression rather
than a |phl| judgement.
