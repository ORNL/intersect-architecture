.. _intersect:arch:pat:solutions:

Building Solutions using Science Use Case Design Patterns
=========================================================

The patterns detailed in the :ref:`intersect:arch:pat:catalog` focus on the
inherent open or closed loop control problem as a common problem to be solved
in reducing human-in-the-loop requirements with machine-in-the-loop
capabilities. Scientific instruments, robot-controlled laboratories and
edge/center computing/data resources are connected in a loop control to enable
autonomous experiments, self-driving laboratories, smart manufacturing, and
:term:`AI`-driven design, discovery and evaluation. Each science use case design
pattern consists of a behavior and a set of interfaces in the context of
performing a single or a set of experiments in an open or closed loop control.
The abstract design pattern definitions describe solutions free of
implementation details.

The science use case design patterns are divided into two different classes: (1)
:ref:`intersect:arch:pat:catalog:strategic` that define high-level solution
methods using experiment control architecture features at a very coarse
granularity, and (2) :ref:`intersect:arch:pat:catalog:architectural` that define
more specific solution methods using hardware and software architecture features
at a finer granularity. The :ref:`intersect:arch:pat:catalog:architectural`
inherit the features of their parent :ref:`intersect:arch:pat:catalog:strategic`,
but also address additional problems that are not exposed at the high
abstraction level of the strategic patterns.

:ref:`intersect:arch:pat:solutions:guide` discusses the involved steps in
building complete solutions using the science use case design patterns,
including individual decision parameters.
:ref:`intersect:arch:pat:solutions:compositions` may be required to construct
complete solutions.

.. toctree::
   :maxdepth: 1
   :name: intersect:arch:pat:solutions:toc
   :caption: Creating Solutions with Design Patterns for Science Use Cases

   guide
   compositions
