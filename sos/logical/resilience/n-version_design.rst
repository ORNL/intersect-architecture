.. _intersect:arch:sos:logical:resilience:patterns:n-version_design:

N-Version Design
================

The N-Version Design structural pattern is a derivative of the Design Diversity
architectural pattern and the Compensation strategy pattern in the original
resilience design pattern specification
(:numref:`intersect:arch:sos:logical:resilience:patterns:classification`)
:cite:`engelmann22rdp-20`. It offers detection, containment, and mitigation
with continuous operatation in the presence of an error or failure, and with
none-to-little interruption and no loss of progress. The following describes
the
:ref:`intersect:arch:sos:logical:resilience:patterns:n-version_design:pattern`
and its application in the
:ref:`intersect:arch:sos:logical:resilience:patterns:n-version_design:system`
and in the
:ref:`intersect:arch:sos:logical:resilience:patterns:n-version_design:service`
of the :term:`INTERSECT` federated ecosystem for instrument science. Note that
the
:ref:`intersect:arch:sos:logical:resilience:patterns:n-version_design:pattern`
description uses the terms system, subsystem, and service in an abstract way,
while the
:ref:`intersect:arch:sos:logical:resilience:patterns:n-version_design:system`
and the
:ref:`intersect:arch:sos:logical:resilience:patterns:n-version_design:service`
map those terms to the :term:`INTERSECT` federated ecosystem.

.. _intersect:arch:sos:logical:resilience:patterns:n-version_design:pattern:

Pattern
-------

Problem
   A hardware or software error or subsystem failure due to a design fault
   (e.g., human mistake or defective design tool) causes a software, such as a
   service, to experience an error and potentially a subsequent failure.

Context
   The pattern applies to a system that has the following characteristics:

   -  The system is deterministic, i.e., forward progress of the system is
      defined in terms of the input state to the system and the execution steps
      completed since system initialization.

   -  The system has a well-defined specification for which multiple
      implementation variants may be created.

   -  There is an implicit assumption of independence between multiple variants
      of the implementation.

Forces
   -  The pattern introduces an execution time and/or resource requirement
      (storage space, computational capability, etc.) penalty independent of
      whether an error or failure occurs during system operation or not.
   
   -  The scope and strength of the diversity employed by the pattern determine
      its execution time and resource requirement overhead.
   
   -  The pattern requires distinct implementations of the same design
      specification, which may need to be created by different individuals.
   
   -  The pattern increases design complexity due to the need of additional
      design and verification effort required to create multiple
      implementations.
   
   -  The pattern may introduce a performance penalty during error/failure-free
      operation due to disparity in the implementation variants.

Solution
   The pattern enables the continuous correct operation of a system impacted by
   an error or failure. It supports resilient operation by applying redundancy
   to system state and optionally to system resources. This redundancy is in
   the form of :math:`N` functionally equivalent alternate system
   implementations. This pattern designs different implementations of the
   system that are functionally equivalent to enable error and failure
   resilience through design diversity. Different implementations of the system
   are less likely to experience the same error or failure.

   The pattern requires very well defined input and output to permit input
   replication and output validation. Input is replicated to functionally
   equivalent alternate system implementations, processed by each
   implementation of the system, and the output is then validated. The
   validation corrects an error or failure of a system implementation. The
   scope and strength of the redundancy are defined by the number of
   functionally equivalent alternate system implementations :math:`N` and by
   their implementation design diversity.

   Redundancy can be in time, meaning the same system resources execute the
   :math:`N` equivalent alternate system implementations in time. Redundancy
   can also be in space, meaning additional (redundant/diverse) system
   resources execute the :math:`N` equivalent alternate system implementations
   in space. Redundancy in time saves system resources, while redundancy in
   space offers more error/failure coverage. A mix between redundancy in time
   and space is possible as well, where there are more equivalent alternate
   system implementations than additional (redundant/diverse) system resources.
   The components of this pattern are illustrated in
   :numref:`intersect:arch:sos:logical:resilience:patterns:n-version_design:components`.

   .. figure:: n-version_design/components.png
      :name: intersect:arch:sos:logical:resilience:patterns:n-version_design:components
      :align: center
      :alt: N-Version Design pattern components

      N-Version Design pattern components

Capability
   A system using this pattern is able to continue to operate in the presence
   of an error or failure with no or minimal interruption. This pattern
   provides error and/or failure detection in the system by applying redundancy
   to system state in the form of :math:`N` functionally equivalent alternate
   system implementations. The pattern provides mitigation of an error or
   failure in the system by applying redundancy to system state and optionally
   to system resources, such that the system continues to operate correctly in
   the presence of such an event. The flowchart of the pattern is shown in
   :numref:`intersect:arch:sos:logical:resilience:patterns:n-version_design:flowchart`,
   the state diagram in
   :numref:`intersect:arch:sos:logical:resilience:patterns:n-version_design:state_diagram`,
   and its parameters in
   :numref:`intersect:arch:sos:logical:resilience:patterns:n-version_design:parameters`.

   .. figure:: n-version_design/flowchart.png
      :name: intersect:arch:sos:logical:resilience:patterns:n-version_design:flowchart
      :align: center
      :alt: Flowchart
   
      Flowchart
   
   .. figure:: n-version_design/state_diagram.png
      :name: intersect:arch:sos:logical:resilience:patterns:n-version_design:state_diagram
      :align: center
      :alt: State diagram
   
      State diagram
   
   .. table:: N-Version Design pattern parameters
      :name: intersect:arch:sos:logical:resilience:patterns:n-version_design:parameters
      :align: center

      +---------------+-----------------------------------------------------+
      | Parameter     | Definition                                          |
      +===============+=====================================================+
      | :math:`T_{a}` | Time to activate :math:`N` versions of the (sub-)   |
      |               | system                                              |
      +---------------+-----------------------------------------------------+
      | :math:`T_{i}` | Time to replicate the input to the :math:`N`        |
      |               | versions of the (sub-) system                       |
      +---------------+-----------------------------------------------------+
      | :math:`T_{e}` | Time to execute (sub-) system progress in the       |
      |               | :math:`N` versions of the (sub-) system             |
      +---------------+-----------------------------------------------------+
      | :math:`T_{o}` | Time to validate the output from the :math:`N`      |
      |               | versions of the (sub-) system                       |
      +---------------+-----------------------------------------------------+
      | :math:`T_{r}` | Time to remove, replace, or discount the affected   |
      |               | redundant (sub) system version(s)                   |
      +---------------+-----------------------------------------------------+

Protection Domain
   The protection domain extends to the system state and the system resources
   described by the design specification that implement the :math:`N`
   functionally equivalent alternate systems.

Resulting Context
   Correct operation is performed despite an error or failure impacting the
   system. Progress in the system is not lost due to an error or failure. The
   system is not interrupted during error-/failure-free operation or when
   encountering an error or failure. Resource usage in time or space is
   increased according to the amount of redundancy employed in the form of
   :math:`N` functionally equivalent alternate system implementations and due
   to the difference in resource usage and execution time of the :math:`N`
   functionally equivalent alternate system implementations.

   A trade-off exists between the amount of redundancy employed and the number
   of errors and/or failures that can be tolerated at the same time and/or in
   time. More redundancy tolerates generally more errors and/or failures, but
   requires either more resources or more execution time.

   The pattern may be used in conjunction with other patterns that provide
   containment and mitigation in a complementary fashion, where some
   error/failure types are covered by the other pattern(s) and the pattern
   covers for the remaining error/failure types.

   Performance
      The error/failure-free performance :math:`T_{f=0}` of the pattern is
      defined by the task total execution time without any resilience strategy
      :math:`T_{E}` (the worst case execution time of N versions of the (sub-)
      system), the total time to activate N versions of the (sub-) system
      :math:`T_{a}`, and the time to replicate the input to the N versions of the
      (sub-) system :math:`T_{i}` and the time to validate the output from the
      N versions of the (sub-) system :math:`T_{o}` with the total number of
      input-execute-output cycles :math:`P`.

      .. math::
   
         \begin{aligned}
           T_{f=0} = T_{E} + T_{a} + P (T_{i} + T_{o})
         \end{aligned}

      The performance under errors/failures :math:`T_{f!=0}` is defined by the
      failure free performance :math:`T_{f=0}` plus the time to remove,
      replace, or discount the affected redundant (sub) system replica(s)
      :math:`T_{r}` for each of the errors or failures :math:`N`. Assuming
      constant times to remove, replace, or discount the affected redundant
      (sub) system replica(s) :math:`T_{r}` and a ratio for replication in
      space vs. in time of :math:`\alpha`, the performance under
      errors/failures :math:`T_{f!=0}` can be reformulated to:

      .. math::
   
         \begin{aligned}
           T_{f!=0} = \alpha T_{E} + (1 - \alpha) N T_{E} + T_{a} + P (T_{i} + T_{o}) + N T_{r}
         \end{aligned}

   Reliability
      The reliability :math:`R(t)` of a system applying this pattern is defined
      by the parallel reliability of the :math:`N`-redundant execution and the
      performance under errors/failures :math:`T_{f!=0}`, assuming constant
      propabalistic rate :math:`\lambda_{n}` of errors and failures for each
      redundant execution (or its corresponding inverse, the :term:`MTTI`
      :math:`M`). It can be simplified for redundancy of identical systems
      :math:`R_{i}(t)`, assuming an identical constant propabalistic
      error/failure rate :math:`\lambda` (or its corresponding inverse
      :math:`M`).

      .. math::
   
         \begin{aligned}
           R(t)     &= 1 - \prod_{n=1}^{N}(1-e^{-\lambda_{n} T_{f!=0}})
                     = 1 - \prod_{n=1}^{N}(1-e^{-T_{f!=0}/M})\\
           R_{i}(t) &= 1 - (1 - e^{-\lambda T_{f!=0}})^{N}
                     = 1 - (1 - e^{-T_{f!=0}/M})^{N}
         \end{aligned}
   
   Availability
      The availability :math:`A` of a system applying this pattern is defined
      by :math:`N`-parallel availability and the performance under failure
      :math:`T_{f!=0}`. It can be simplified for redundancy of identical
      systems :math:`A_{i}`. If :math:`T_{a}`, :math:`T_{i}`, :math:`T_{d}`,
      :math:`T_{r}`, and :math:`T_{f}` are small enough, non-identical and
      identical availability can be simplified further, where :math:`M_{n}` (or
      :math:`M`) is the :term:`MTTI` and :math:`R_{n}` (or :math:`R`) is the
      :term:`mean-time to recover (MTTR)<MTTR>` of each individual system
      (:math:`T_{f}`).
   
      .. math::
   
         \begin{aligned}
           A     &= 1 - \prod_{n=1}^{N} (1 - A_{n})\notag\\
                 &= 1 - \prod_{n=1}^{N} \left(1 - \frac{T_{E,n}}{T_{n}}\right)\\
           A_{i} &= 1 - (1-A)^{N}\notag\\
                 &= 1 - \left(1 - \frac{T_{E}}{T}\right)^{N}
         \end{aligned}
   
      .. math::
   
         \begin{aligned}
           A     &= 1 - \prod_{n=1}^{N} \left(1 - \frac{M_{n}}{M_{n} + R_{n}}\right)
           A_{i} &= 1 - \left(1 - \frac{M}{M + R}\right)^{N}
         \end{aligned}

Examples
   In :term:`high-performance computing (HPC)<HPC>` environments, various
   versions of the same software are used for the detection of implementation
   errors. This applies to completely different implementations of the
   :term:`Message Passing Interface (MPI)<MPI>` standard and to numerical
   libraries as well as to different versions of the same implementation.
   Regression and comparison tests are performed to identify incorrect
   behavior, missing features and performance problems.

Rationale
   The pattern enables a system to tolerate an error or failure through
   continuation of correct operation after impact. It relies on system state
   redundancy in the form of functionally equivalent alternate system
   implementations. The pattern performs mostly proactive actions, such as
   maintaining redundancy. Error or failure detection is part of the pattern in
   the form of output validation. The pattern has high design complexity due to
   the need for functionally equivalent alternate system implementations.

.. _intersect:arch:sos:logical:resilience:patterns:n-version_design:system:

System Scope
------------

In the context of :term:`INTERSECT` :ref:`intersect:arch:sos:logical:systems`,
this pattern can be applied to :term:`INTERSECT` systems and subsystems. It
would be primarily applied to an entire infrastructure system and its
subsystems, as opposed to an entire logical system that spans across multiple
infrastructure systems. It could be applied to a logical subsystem of an
infrastructure system only.

.. _intersect:arch:sos:logical:resilience:patterns:n-version_design:service:

Service Scope
-------------

In the context of :term:`INTERSECT` :ref:`intersect:arch:sos:logical:systems`,
this pattern can be applied to an :term:`INTERSECT` service. If it is applied
to a group of services, then this is typically within the
:ref:`intersect:arch:sos:logical:resilience:patterns:n-version_design:system`.
