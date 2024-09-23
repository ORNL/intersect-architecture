.. _intersect:arch:examples:

Practical Architecture Examples
###############################

The :term:`INTERSECT` architecture addresses the needs of a federated ecosystem
that connects scientific instruments, robot-controlled laboratories, and
edge/center computing/data resources to enable autonomous experiments,
self-driving laboratories, smart manufacturing, and :term:`AI`-driven design,
discovery and evaluation. It consists of:

- :ref:`intersect:arch:pat` that identify and abstract the involved
  hardware/software components and their interactions in terms of control,
  work and data flow.

- A :ref:`intersect:arch:sos` of the federated hardware/software ecosystem
  that clarifies terms, architectural elements, the interactions between them,
  and compliance.

- A federated :ref:`intersect:arch:ms` that maps science use case design
  patterns to the :ref:`intersect:arch:sos` with loosely coupled
  microservices, standardized interfaces, and multi programming language
  support.

It covers a wide variety of interconnected science use cases through proper
abstractions and composability. This Section describes how individual science
use cases are addressed by the architecture, including how the
:ref:`intersect:arch:pat`, the :ref:`intersect:arch:sos`, and the
:ref:`intersect:arch:ms` are applied in practice.

.. toctree::
   :maxdepth: 1
   :name: intersect:arch:examples:toc
   :caption: Architecture Examples Catalog

   aam/index
   agile/index
