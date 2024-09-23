.. _intersect:arch:pat:

Science Use Case Design Patterns
################################

The science use case design patterns of the :term:`INTERSECT` Open Architecture
Specification identify and abstract the involved hardware/software components
and their interactions in terms of control, work and data flow. The
:ref:`intersect:arch:pat:anatomy` is defined in a loop control problem
paradigm.

At the moment, the :ref:`intersect:arch:pat:catalog` defines two classes of
patterns: :ref:`intersect:arch:pat:catalog:strategic` with high-level solution
methods using experiment control architecture features at a very coarse
granularity and :ref:`intersect:arch:pat:catalog:architectural` with more
specific solution methods using hardware and software architecture features at
a finer granularity. The classification scheme itself is open for extension,
such as for adding new patterns for each class or new classes entirely. For
example, a new class may map the existing patterns to other workflow
properties, such as (a) data-intensive, (b) time-sensitive and (c) long-term
experiment campaigns (woprkflow execution patterns defined by the :term:`IRI`
Architecture Blueprint Activity :cite:`IRI:2023`).

:ref:`intersect:arch:pat:solutions` requires dissecting a science use case
by the open or closed loop control problem or problems it contains.
:ref:`intersect:arch:pat:solutions:guide` discusses the involved steps.
Real-world solutions may also include using
:ref:`intersect:arch:pat:solutions:compositions`.

.. toctree::
   :maxdepth: 2
   :name: intersect:arch:pat:toc
   :caption: Design Patterns for Science Use Cases

   introduction
   anatomy
   format
   catalog/index
   solutions/index
