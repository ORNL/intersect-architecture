.. _intersect:arch:sos:logical:resilience:patterns:n-version_design:

N-Version Design
================

The N-Version Design structural pattern is a derivative of the Design Diversity
architectural pattern and the Compensation strategy pattern in the original
resilience design pattern specification
(:numref:`intersect:arch:sos:logical:resilience:patterns:classification`)
:cite:`engelmann22rdp-20`. It offers detection, containment, and mitigation
with continuous operatation in the presence of an error or failure, and with
none-to-little interruption and no loss of progress.

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
      The failure-free performance :math:`T_{f=0}` of the pattern is defined by
      the task total execution time without any resilience strategy
      :math:`T_{E}` (the worst case execution time of N versions of the (sub-)
      system), the total time to activate N versions of the (sub-) system
      :math:`T_{a}`, the time to replicate the input to the N versions of the
      (sub-) system :math:`T_{i}`, and the time to validate the output from the
      N versions of the (sub-) system :math:`T_{o}` with the total number of
      input-execute-output cycles :math:`P`. The performance under failure T is
      defined by :math:`T_{f=0}` plus the time :math:`T_{r}` to remove,
      replace, or discount the affected redundant (sub-) system version(s),
      where total time to remove, replace, or discount is number of error or
      failure times :math:`T_{r}`. Assuming constant times :math:`T_{a}`,
      :math:`T_{i}` (:math:`t_{i}`), :math:`T_{o}` (:math:`t_{o}`), and
      :math:`T_{r}`, :math:`T` can be defined. When the redundancy is in space,
      using a ratio for replication in space vs. in time :math:`\alpha`,
      :math:`T` can be reformulated.

      .. math::
       
         \begin{aligned}
            & T = T_{E} + T_{a} + P(t_{i} +t_{o}) + \frac{T_{E}}{M}\left(T_{r}\right)\\
            & T = \alpha T_{E} + (1 - \alpha) N T_{E} + T_{a} + P(t_{i} +t_{o}) + \frac{T_{E}}{M}\left(T_{r}        \right)
         \end{aligned}

   Reliability
      Reliability is defined by the parallel reliability of the
      :math:`N`-redundant execution and the performance under failure :math:`T`.

      .. math::

         \begin{aligned}
            R_{i}(t) &= 1 - (1 - e^{-\lambda T})^{N}
         \end{aligned}

   Availability
      The availability :math:`A` of :math:`N`-parallel sytems is defined by
      :math:`M_{n}` (or :math:`M`) and :math:`R_{n}` (or :math:`R`) where
      :math:`M` is the :term:`mean-time to failure (MTTF)<MTTF>` and :math:`R`
      is the :term:`mean-time to recover (MTTR)<MTTR>` of each individual
      system.

      .. math::

         \begin{aligned}
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

.. todo:: Describe the application of the pattern in the system scope.

.. _intersect:arch:sos:logical:resilience:patterns:n-version_design:service:

Service Scope
-------------

.. todo:: Describe the application of the pattern in the service scope.
