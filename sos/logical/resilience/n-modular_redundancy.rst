.. _intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:

N-Modular Redundancy
====================

The N-Modular Redundancy structural pattern is a derivative of the Redundancy
architectural pattern and the Compensation strategy pattern in the original
resilience design pattern specification
(:numref:`intersect:arch:sos:logical:resilience:patterns:classification`)
:cite:`engelmann22rdp-20`. It offers detection, containment and mitigation with
continuous operatation in the presence of an error or failure, and with
none-to-little interruption and no loss of progress. The following describes
the
:ref:`intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:pattern`
and its application in the
:ref:`intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:system`
and in the
:ref:`intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:service`
of the :term:`INTERSECT` federated ecosystem for instrument science.

.. _intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:pattern:

Pattern
-------

Problem
   A hardware error or subsystem failure due to a physical fault (e.g.,
   wear-out or destruction) causes a software, such as a service, to
   experience an error and potentially a subsequent failure.

Context
   The pattern applies to a system that has the following characteristics:

   -  The system is deterministic, i.e., forward progress of the system is
      defined in terms of the input state to the system and the execution steps
      completed since system initialization.

   -  The system has a modular design that has a well-defined scope and a set
      of inputs and outputs.

Forces
   -  The pattern introduces an execution time and/or resource requirement
      (storage space, computational capability, etc.) penalty independent of
      whether an error or failure occurs during system operation or not.

   -  The scope and strength of the redundancy employed by the pattern
      determine its execution time and resource requirement overhead.

Solution
   The pattern enables the continuous correct operation of a system impacted
   by an error or failure. It supports resilient operation by applying
   redundancy to system state and optionally to system resources. This
   redundancy is in the form of :math:`N` functionally identical replicas. The
   pattern requires very well defined input and output to permit input
   replication and output comparison. Input is replicated to identical
   instances of the system, processed by each replica system, and the output is
   then compared. The comparison corrects an error or failure of a replica
   system. The scope and strength of the redundancy are defined by the number
   of functionally identical replicas :math:`N`.

   Redundancy can be in time, meaning the same system resources are used for
   redundancy and execute the :math:`N` functionally identical replicas in
   time. Redundancy can also be in space, meaning additional (redundant) system
   resources are used and execute the :math:`N` functionally identical replicas
   in space. Redundancy in time saves system resources, while redundancy in
   space offers more error/failure coverage. A mix between redundancy in time
   and space is possible as well, where there are more functionally identical
   replicas than additional (redundant) system resources. The components of
   this pattern are illustrated in
   :numref:`intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:components`.

   .. figure:: n-modular_redundancy/components.png
      :name: intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:components
      :align: center
      :alt: N-modular Redundancy pattern components

      N-Modular Redundancy pattern components

Capability
   A system using this pattern is able to continue to operate in the presence
   of an error or failure with no interruption. This pattern provides error
   and/or failure detection in the system by applying redundancy to system
   state in the form of :math:`N` functionally identical replicas. The pattern
   provides mitigation of an error or failure in the system by applying
   redundancy to system state and optionally to system resources, such that the
   system continues to operate correctly in the presence of such an event. The
   flowchart of the pattern is shown in
   :numref:`intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:flowchart`,
   the state diagram in
   :numref:`intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:state_diagram`,
   and its parameters in
   :numref:`intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:parameters`.

   .. figure:: n-modular_redundancy/flowchart.png
      :name: intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:flowchart
      :align: center
      :alt: Flowchart
   
      Flowchart
   
   .. figure:: n-modular_redundancy/state_diagram.png
      :name: intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:state_diagram
      :align: center
      :alt: State diagram
   
      State diagram
   
   .. table:: N-Modular Redundancy pattern parameters
      :name: intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:parameters
      :align: center

      +---------------+---------------------------------------------------+
      | Parameter     | Definition                                        |
      +===============+===================================================+
      | :math:`T_{a}` | Time to activate :math:`N` replicas of the (sub-) |
      |               | system                                            |
      +---------------+---------------------------------------------------+
      | :math:`T_{i}` | Time to replicate the input to the :math:`N`      |
      |               | replicas of the (sub-) system                     |
      +---------------+---------------------------------------------------+
      | :math:`T_{e}` | Time to execute (sub-) system progress in the     |
      |               | :math:`N` replicas of the (sub-) system           |
      +---------------+---------------------------------------------------+
      | :math:`T_{o}` | Time to compare the outputs from the :math:`N`    |
      |               | replicas of the (sub-) system                     |
      +---------------+---------------------------------------------------+
      | :math:`T_{r}` | Time to remove, replace, or discount the affected |
      |               | redundant (sub) system replica(s)                 |
      +---------------+---------------------------------------------------+

Protection Domain
   The protection domain extends to the system state and the system resources
   that implement the :math:`N` functionally identical replica systems.

Resulting Context
   Correct operation is performed despite an error or failure impacting the
   system. Progress in the system is not lost due to an error or failure. The
   system is not interrupted during error-/failure-free operation or when
   encountering an error or failure. Resource usage in time or space is
   increased according to the amount of redundancy employed in the form of
   :math:`N` functionally identical replicas and due to the replication of
   input and comparison and correction of output.

   A trade-off exists between the amount of redundancy employed and the number
   of errors and/or failures that can be tolerated at the same time and/or in
   time. More redundancy tolerates generally more errors and/or failures, but
   requires either more resources or more execution time.

   This pattern may be used in conjunction with other patterns that provide
   containment and mitigation in a complementary fashion, where some
   error/failure types are covered by the other pattern(s) and this pattern
   covers for the remaining error/failure types.

   Performance
      The failure-free performance :math:`T_{f=0}` of the pattern is defined by
      the task’s total execution time without any resilience strategy
      :math:`T_{E}`, the total time to activate N replicas of the system
      :math:`T_{a}`, the time to replicate the input :math:`T_{i}`, the time
      to compare the outputs :math:`T_{o}` with the total number of
      input-execute-output cycles :math:`P`, and the :term:`mean-time to
      failure (MTTF)<MTTF>` :math:`M_{u}`. The performance under failure
      :math:`T` is defined by :math:`T_{f=0}`, plus the total time
      :math:`T_{r}` to remove, replace, or discount the replica(s) where total
      time to remove, replace, or discount is number of error or failure times
      :math:`T_{f}`. Assuming constant times :math:`T_{a}`, :math:`T_{i}`
      (:math:`t_{i}`), :math:`T_{o}` (:math:`t_{o}`), and :math:`T_{r}`,
      :math:`T` can be simplified. Using a ratio for replication in space vs.
      in time :math:`\alpha`, :math:`T` can be reformulated.

      .. math::

         \begin{aligned}
           T &= T_{E} + T_{a} + P(t_{i} + t_{o}) + \frac{T_{E}}{M_{u}}\left( T_{r} \right)\\
           T &= \alpha T_{E} + (1 - \alpha) N T_{E} + T_{a} + P(t_{i} + t_{o}) + \frac{T_{E}}{M_{u}}\left( T_{r} \right)
         \end{aligned}

   Reliability
      Reliability is defined by the parallel reliability of the
      :math:`N`-redundant execution and the performance under failure
      :math:`T`.
   
      .. math::
   
         \begin{aligned}
           R_{i}(t) &= 1 - (1 - e^{-\lambda T})^{N}
         \end{aligned}
   
   Availability
      The availability :math:`A` of :math:`N`-parallel syaytems is defined by
      :math:`M_{n}` (or :math:`M`) and :math:`R_{n}` (or :math:`R`) where
      :math:`M` is the :term:`MTTF` and :math:`R` is the :term:`mean-time to
      recover (MTTR)<MTTR>` of each individual system.
   
      .. math::
   
         \begin{aligned}
           A_{i} &= 1 - \left(1 - \frac{M}{M + R}\right)^{N}
         \end{aligned}

Examples
   The use of the pattern in various hardware and software systems enables
   detection and correction of errors, or the compensation of failures.
   Dual-modular redundancy for error detection and failure compensation and
   triple-modular redundancy for error detection and correction and failure
   compensation are used forms of this pattern in :term:`high-performance
   computing (HPC)<HPC>` environments. Examples include dual-redundant cooling
   fans, dual- and triple–modular redundant :term:`Message Passing Interface
   (MPI)<MPI>` implementations :cite:`Fiala:2012`, dual-redundant parallel
   file system :term:`metadata service (MDS)<MDS>` solutions
   :cite:`he09symmetric` and dual-redundant mission-critical :term:`HPC`
   systems (e.g., weather forecast).

Rationale
   The pattern enables a system to tolerate an error or failure through
   continuation of correct operation after impact. It relies on system state
   redundancy in the form of functionally identical replicas. The pattern
   performs mostly proactive actions, such as maintaining redundancy. Error or
   failure detection is part of the pattern in the form of output comparison.
   The pattern has some design complexity, as input needs to be replicated and
   output needs to be compared.

.. _intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:system:

System Scope
------------

.. todo:: Describe the application of the pattern in the system scope.

.. _intersect:arch:sos:logical:resilience:patterns:n-modular_redundancy:service:

Service Scope
-------------

.. todo:: Describe the application of the pattern in the service scope.
