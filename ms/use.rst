.. _intersect:arch:ms:use:

Use of Microservices in the INTERSECT Architecture
==================================================

The INTERSECT Open Architecture provides a catalog of infrastructure and
experiment-specific microservices that may be useful within an interconnected
science ecosystem. All microservices are defined to facilitate composition 
within federated :term:`SoS` architectures, where each system corresponds to 
one or more microservices coordinating through well-defined 
:ref:`microservice interaction patterns <intersect:arch:ms:interactions>`.

*Infrastructure microservices* represent common service
functionality and capabilities, such as data management, computing,
system management, and workflow orchestration that are likely to be
generally useful across many science ecosystems without the need for
customization. 

*Experiment-specific microservices* represent services whose 
implementation may require detailed application knowledge, 
such as experiment planning or steering services that require
knowledge of experiment-specific control parameters and their associated
constraints. 

The INTERSECT science use case design patterns help
identify the relevant infrastructure and experiment-specific
microservices for a given science ecosystem.
:numref:`fig:intersect:arch:ms:use:overview` provides an
architectural overview of the potential classes of microservices that
may be involved with a given interconnected science ecosystem.
:ref:`intersect:arch:ms:class`
provides additional information on the various INTERSECT microservice
classes and their shared capabilities and data requirements.

.. _fig:intersect:arch:ms:use:overview:
.. figure:: images/ms-classes.svg
   :alt: Potential classes of INTERSECT microservices

   Potential Classes of INTERSECT Microservices
