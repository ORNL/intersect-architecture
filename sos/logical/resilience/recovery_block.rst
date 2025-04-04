.. _intersect:arch:sos:logical:resilience:patterns:recovery_block:

Recovery Block
==============

The Recovery Block structural pattern is a derivative of the Design Diversity
architectural pattern and the Compensation strategy pattern in the original
resilience design pattern specification
(:numref:`intersect:arch:sos:logical:resilience:patterns:classification`)
:cite:`engelmann22rdp-20`. It offers detection, containment, and mitigation
with continuous operatation in the presence of an error or failure, and with
some interruption and no loss of progress. The following describes the
:ref:`intersect:arch:sos:logical:resilience:patterns:recovery_block:pattern`
and its application in the
:ref:`intersect:arch:sos:logical:resilience:patterns:recovery_block:system`
and in the
:ref:`intersect:arch:sos:logical:resilience:patterns:recovery_block:service`
of the :term:`INTERSECT` federated ecosystem for instrument science. Note that
the
:ref:`intersect:arch:sos:logical:resilience:patterns:recovery_block:pattern`
description uses the terms system, subsystem, and service in an abstract way,
while the
:ref:`intersect:arch:sos:logical:resilience:patterns:recovery_block:system`
and the
:ref:`intersect:arch:sos:logical:resilience:patterns:recovery_block:service`
map those terms to the :term:`INTERSECT` federated ecosystem.

.. _intersect:arch:sos:logical:resilience:patterns:recovery_block:pattern:

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

   -  The pattern introduces a performance penalty upon an error or failure, as
      the recovery block processes the input and validates its output after
      error/failure discovery.

Solution
   The pattern enables the continuous correct operation of a system impacted by
   an error or failure. It supports resilient operation by applying redundancy
   to system state and optionally to system resources. This redundancy is in
   the form of a functionally equivalent alternate system implementation
   encapsulated in a recovery block. This pattern designs a different
   implementation of the system that is functionally equivalent to enable error
   and failure resilience through design diversity. The two different
   implementations of the system are less likely to experience the same error
   or failure.

   The pattern requires very well defined input and output to permit input
   replication and output validation. Input is replicated to the functionally
   equivalent alternate system implementations. The original system processes
   the input and validates its output. Upon discovery of an error or failure,
   the recovery block implementation processes the input, validates its output,
   and corrects the output of the original system. The scope and strength of
   the redundancy is defined by the implementation design diversity.

   Redundancy is in time, as the recovery block processes the input and
   validates its output after error/failure discovery. It may be additionally
   in space, if the recovery block is executed on different resources than the
   system. The components of this pattern are illustrated in
   :numref:`intersect:arch:sos:logical:resilience:patterns:recovery_block:components`.
   
   .. figure:: recovery_block/components.png
      :name: intersect:arch:sos:logical:resilience:patterns:recovery_block:components
      :align: center
      :alt: Recovery Block pattern components
   
      Recovery Block pattern components

Capability
   A system using this pattern is able to continue to operate in the presence
   of an error or failure with some interruption for the execution of the
   recovery block. This pattern provides error and/or failure detection in the
   system by output validation. The pattern provides mitigation of an error or
   failure in the system by applying redundancy to system state and optionally
   to system resources, such that the system continues to operate correctly in
   the presence of such an event. The flowchart of the pattern is shown in
   :numref:`intersect:arch:sos:logical:resilience:patterns:recovery_block:flowchart`,
   the state diagram in
   :numref:`intersect:arch:sos:logical:resilience:patterns:recovery_block:state_diagram`,
   and its parameters in
   :numref:`intersect:arch:sos:logical:resilience:patterns:recovery_block:parameters`.
   
   .. figure:: recovery_block/flowchart.png
      :name: intersect:arch:sos:logical:resilience:patterns:recovery_block:flowchart
      :align: center
      :alt: Flowchart
   
      Flowchart
   
   .. figure:: recovery_block/state_diagram.png
      :name: intersect:arch:sos:logical:resilience:patterns:recovery_block:state_diagram
      :align: center
      :alt: State diagram
   
      State diagram
   
   .. table:: Recovery Block pattern parameters
      :name: intersect:arch:sos:logical:resilience:patterns:recovery_block:parameters
      :align: center

      +---------------+----------------------------------------------------+
      | Parameter     | Definition                                         |
      +===============+====================================================+
      | :math:`T_{a}` | Time to activate the recovery block of the (sub-)  |
      |               | system                                             |
      +---------------+----------------------------------------------------+
      | :math:`T_{i}` | Time to replicate the input to the (sub-) system   |
      |               | and the recovery block of the (sub-) system        |
      +---------------+----------------------------------------------------+
      | :math:`T_{e}` | Time to execute (sub-) system progress             |
      +---------------+----------------------------------------------------+
      | :math:`T_{o}` | Time to validate the output from the (sub-) system |
      +---------------+----------------------------------------------------+
      | :math:`T_{r}` | Time to execute the recovery block of the (sub-)   |
      |               | system                                             |
      +---------------+----------------------------------------------------+

Protection Domain
   The protection domain extends to the system state and the system resources
   described by the design specification that implement the recovery block.

Resulting Context
   Correct operation is performed despite an error or failure impacting the
   system. Progress in the system is not lost due to an error or failure. The
   system is not interrupted during error/failure-free operation. It is
   interrupted when encountering an error or failure for the execution of the
   recovery block. Resource usage in time or space is increased according to
   the additional resource usage and execution time of the recovery block that
   employs the redundancy in the form of the functionally equivalent alternate
   system implementation.

   The pattern may be used in conjunction with other patterns that provide
   containment and mitigation in a complementary fashion, where some
   error/failure types are covered by the other pattern(s) and the pattern
   covers for the remaining error/failure types.

   Performance
      The error/failure-free performance :math:`T_{f=0}` of the pattern is
      defined by the task total execution time without any resilience strategy
      :math:`T_{E}`, the total time to activate the recovery block of the
      (sub-) system :math:`T_{a}`, the time to replicate the input to the
      (sub-) system and the recovery block of the (sub-) system :math:`T_{i}`,
      and the time to validate the output from the (sub-) system :math:`T_{o}`
      with the total number of input-execute-output cycles :math:`P`.
      
      .. math::
   
         \begin{aligned}
           T_{f=0} = T_{E} + T_{a} + P (T_{i} + T_{o})
         \end{aligned}
      
      The performance under errors/failures :math:`T_{f!=0}` is defined by
      the failure free performance :math:`T_{f=0}` plus the time to execute the
      recovery block of the (sub-) system :math:`T_{r}` for each of the errors
      or failures :math:`N`. Assuming constant times to execute the recovery
      block of the (sub-) system :math:`T_{r}`, the performance under
      errors/failures :math:`T_{f!=0}` can be reformulated to:

      .. math::
      
         \begin{aligned}
           T_{f!=0} = T_{f=0} + N T_{r}
         \end{aligned}

   Reliability
      The reliability :math:`R(t)` of a system applying this pattern is defined
      by the parallel reliability of the :math:`N`-redundant execution and the
      performance under errors/failures :math:`T_{f!=0}`, assuming constant
      probabilistic rate :math:`\lambda_{n}` of errors and failures for each
      redundant execution (or its corresponding inverse, the :term:`MTTI`
      :math:`M`). It can be simplified for redundancy of identical systems
      :math:`R_{i}(t)`, assuming an identical constant probabilistic
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
   Containment Domains :cite:`Chung:2011:SC` provide language-based approaches
   for recovery blocks. Applications also often contain verification routines
   that check for the validity of a computation and correct any detected errors
   using application-specific knowledge.

Rationale
   The pattern enables a system to tolerate an error or failure through
   continuation of correct operation after impact. It relies on system state
   redundancy in the form of a functionally equivalent alternate system
   implementation encapsulated in a recovery block. The pattern performs some
   proactive actions, such as maintaining redundancy, but mainly relies on
   reactive actions, such as the execution of a recovery block after an error
   or failure was detected. Error or failure detection is part of the pattern
   in the form of output validation. The pattern has high design complexity due
   to the need for a functionally equivalent alternate system implementation
   encapsulated in a recovery block.

.. _intersect:arch:sos:logical:resilience:patterns:recovery_block:system:

System Scope
------------

In the context of :term:`INTERSECT` :ref:`intersect:arch:sos:logical:systems`,
this pattern is not applicable to :term:`INTERSECT` systems and subsystems, as
redundancy is in the form of a functionally equivalent alternate implementation
encapsulated in a recovery block and such :term:`INTERSECT` system and
subsystem funtionality is provided by :term:`INTERSECT` services.

.. _intersect:arch:sos:logical:resilience:patterns:recovery_block:service:

Service Scope
-------------

In the context of :term:`INTERSECT` :ref:`intersect:arch:sos:logical:systems`,
this pattern can be applied to an :term:`INTERSECT` service.

.. _intersect:arch:sos:logical:resilience:patterns:recovery_block:microservice:

Microservice Scope
------------------

In the context of the :term:`INTERSECT` :ref:`intersect:arch:ms`, this pattern
can be applied to an :term:`INTERSECT` microservice. If it is applied
to a group of microservices, then this is typically within the
:ref:`intersect:arch:sos:logical:resilience:patterns:recovery_block:service`.
