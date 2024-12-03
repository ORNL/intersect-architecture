.. _intersect:arch:sos:logical:resilience:patterns::rollback:

Rollback
========

.. todo:: Provide an introduction (maybe reuse content from and refer to the
          strategy, architectural and structural patterns).

.. _intersect:arch:sos:logical:resilience:patterns::rollback:pattern:

Pattern
-------

Problem
   A hardware or software error or subsystem or service failure due to a
   physical fault (e.g., wear-out or destruction) or a design fault (e.g.,
   resource underprovisioning) causes a software, such as a service, to
   experience an error due to loss of or corrupted state, and potentially a
   subsequent failure.

Context
   The pattern applies to a system that has the following characteristics:
   
   -  The system is deterministic, i.e., forward progress of the system is
      defined in terms of the input state to the system and the execution
      steps completed since system initialization.
   
   -  The error or failure in the system that the pattern handles must be
      detected, as the pattern offers no error or failure detection.
   
   -  The system is capable of compartmentalizing its state that is accurately
      representative of the progress of the system since initialization at the
      time such state is captured.
   
   -  The system operation has well-defined intervals that enable the pattern
      to transition the system to a known correct interval in response to an
      error or failure.
   
   -  The system is capable of saving its current state and loading a
      previously saved state.

Forces
   -  The pattern requires additional storage to capture system state or to
      log messages or events, which increases overhead in terms of
      resources required by the system.
   
   -  The amount of state captured during each creation of a recovery point
      incurs storage space and execution time overheads.
   
   -  The creation frequency of system state snapshots determines overhead.
      More frequent snapshot creation increases system execution time, but
      reduces the amount of lost work upon an error or failure.
   
   -  The time interval for the recovery of a system from a snapshot as
      well as the time interval to create a snapshot must be less than the
      system's :term:`mean-time between failures (MTBF)<MTBF>` to guarantee
      forward progress.

Solution
   This pattern enables the resumption of correct operation of a system
   impacted by an error or failure. It supports resilient operation by
   restoring the system to a known correct state in the event of an error or
   failure. Rollback solutions are classified into checkpoint-based and
   log-based strategies.
   
   The **checkpoint-based strategy** relies on the creation of system state
   snapshots and the maintenance of such checkpoints on a persistent storage
   system that is not affected by the error or failure. Upon detection of an
   error or failure, the most recent snapshot is used to recreate the last
   known error/failure-free state of the system. The **log-based strategy**
   relies on logging, i.e., storing the information of events, such as
   messages sent between different parts of the system or to the system as
   input, on a persistent storage that is not affected by the error or failure.
   Upon detection of an error or failure, the log is replayed to recreate the
   last known error/failure-free state of the system. In contrast to the
   checkpoint-based strategy, the log-based strategy is able to offer
   resilience in the presence of non-deterministic events and for
   non-deterministic systems, as replaying the event log deterministically
   recreates system state.
   
   The checkpoint and log-based strategies may be used together, where
   events are logged in-between snapshots. With both strategies, the
   operation of the system is resumed when the system state is recovered.
   Based on a temporal view of the system's progress, the error/failure
   recovery is backward to the time when the snapshot occurred. When the
   system is partitioned into several subsystems, the pattern must
   coordinate the process of checkpointing. The pattern may use the
   following checkpointing methods:
   
   Coordinated Checkpointing
      The subsystems to coordinate the process of creating checkpoints. The
      coordination enables a globally consistent checkpoint state, which
      simplifies the recovery.
   
   Uncoordinated Checkpointing
      The subsystems each independently decides when to create their respective
      checkpoints. This has the potential to cause a domino effect, where
      rollbacks propagate among system components due to lack of consistency,
      potentially back to the initial state.
   
   Communication-based Checkpointing
      Each subsystem creates local checkpoints, but periodically also enforces
      coordinated checkpoints between all subsystems as backstop for the domino
      effect.
   
   The log-based recovery is based on a piecewise deterministic assumption, in
   which the system identifies nondeterministic events and the information
   necessary to replay the event during recovery is captured and logged. The
   following logging protocols for non-deterministic events may be used by the
   pattern:
   
   Pessimistic Message Logging
     The protocol assumes that an error or failure occurs after a
     nondeterministic event in the system. Therefore, the determinant of each
     nondeterministic event is immediately logged to persistent storage. The
     error/failure-free overhead of this approach is high.
   
   Optimistic Message Logging
      The determinants are held in a volatile storage and written to persistent
      storage asynchronously. This protocol makes the optimistic assumption
      that the logging is completed before the occurrence of an error or
      failure. The error/failure-free overhead of this approach is low.
   
   Causal Message Logging
      This protocol provides a balanced approach by avoiding immediate writing
      to persistent storage (much like the optimistic protocol to reduce
      error/failure-free overhead), but each subsystem commits output
      independently (like the pessimistic protocol to prevent creation of
      orphan subsystems).
   
   Undetected (latent) errors that are either detected later or result in a
   different detected error or failure later represent a problem, as the most
   recent or even more snapshots may contain an illegal system state. In this
   case, the most recent correct snapshot may be used to recreate the last
   known error/failure-free state of the system, skipping snapshots containing
   illegal state and going further back in time in terms of when the snapshot
   was made. The components of this pattern are illustrated in
   :numref:`intersect:arch:sos:logical:resilience:patterns::rollback:components`.
   
   .. figure:: rollback/components.png
      :name: intersect:arch:sos:logical:resilience:patterns::rollback:components
      :align: center
      :alt: Rollback pattern components
   
      Rollback pattern components

Capability
   A system using this pattern is able to continue to operate in the presence
   of an error or failure with some interruption and some loss of progress.
   This pattern provides mitigation of an error or failure in the system by
   preserving system state on a persistent storage before an error or failure,
   using a checkpoint-based and/or log-based strategy, and restoring the
   previously preserved system state upon such an event to resume operation
   from a previously preserved known correct state. The flowchart of the
   pattern is shown in
   :numref:`intersect:arch:sos:logical:resilience:patterns::rollback:flowchart`,
   the state diagram in
   :numref:`intersect:arch:sos:logical:resilience:patterns::rollback:state_diagram`,
   and its parameters in
   :numref:`intersect:arch:sos:logical:resilience:patterns::rollback:parameters`.
   
   .. figure:: rollback/flowchart.png
      :name: intersect:arch:sos:logical:resilience:patterns::rollback:flowchart
      :align: center
      :alt: Flowchart
   
      Flowchart
   
   .. figure:: rollback/state_diagram.png
      :name: intersect:arch:sos:logical:resilience:patterns::rollback:state_diagram
      :align: center
      :alt: State diagram
   
      State diagram
   
   .. table:: Rollback pattern parameters
      :name: intersect:arch:sos:logical:resilience:patterns::rollback:parameters
      :align: center
   
      +---------------+---------------------------------------------------+
      | Parameter     | Definition                                        |
      +===============+===================================================+
      | :math:`T_{e}` | Time to execute system progress                   |
      +---------------+---------------------------------------------------+
      | :math:`T_{d}` | Time to detect an error/failure (not part of this |
      |               | pattern, but shown for completeness)              |
      +---------------+---------------------------------------------------+
      | :math:`T_{l}` | Time to load consistent system state and          |
      |               | progress from storage                             |
      +---------------+---------------------------------------------------+
      | :math:`T_{r}` | Time to rollback to the last known correct state  |
      |               | (initial and/or previously saved)                 |
      +---------------+---------------------------------------------------+
      | :math:`T_{s}` | Time to save system state and progress to         |
      |               | storage                                           |
      +---------------+---------------------------------------------------+

Protection Domain
   The protection domain extends to the previously preserved system state that
   can be recreated using the system state captured by snapshots stored on
   persistent storage.

Resulting Context
   Correct operation is resumed after an error or failure impacted the system.
   Progress in the system is lost after an error or failure, since the recovery
   is only able to recreate the system state to the time when the snapshot
   occurred. The system is interrupted during error-/failure-free operation for
   creating system state snapshots and maintaining them on a persistent storage
   system. The system is interrupted upon an error or failure for recreating
   the last known error/failure-free state of the system.
   
   A trade-off exists between the creation frequency of system state snapshots
   and/or event logging and the corresponding execution time overhead during
   error-/failure-free operation vs. the amount of lost progress. The optimal
   solution of this trade-off depends on the :term:`MTBF`, the time it takes to
   save and load a system state snapshot, the time it takes to log events, and
   the time it takes to recreate the system state.
   
   This pattern does not provide error or failure detection and may be used in
   conjunction with other patterns to be fully functional. This pattern may be
   used in conjunction with other patterns that provide containment and
   mitigation in a complementary fashion, where some error/failure types are
   covered by the other pattern(s) and this pattern covers for the remaining
   error/failure types.
   
   Performance
      The failure-free performance :math:`T_{f=0}` of the pattern is defined by
      the task's total execution time without any resilience strategy
      :math:`T_{E}` and the time spent on saving system state and progress to
      storage :math:`T_{s}` during task execution with a total number of
      checkpoints :math:`N`. Assuming a constant checkpoint interval
      :math:`\tau`, the total number of checkpoints :math:`N_{constant}` is
      defined by the task's total execution time without any resilience
      strategy :math:`T_{E}` divided by :math:`\tau`. :math:`T_{d}`, time to
      detect an error/failure, is not part of this pattern.

      .. math::
      
         \begin{aligned}
           T_{f=0} &= T_{E} + N T_{s}\\
           N_{constant} &= T_{E} / \tau
         \end{aligned}

      The performance under failure :math:`T_{f!=0}` is defined by the
      failure-free performance :math:`T_{f=0}`, plus the total lost time to
      execute system progress :math:`T_{EL}` and the total time to load
      consistent system state and progress from storage and to rollback to the
      last known correct state :math:`T_{R}`. Assuming constant times
      :math:`T_{s}`, :math:`T_{l}`, and :math:`T_{r}`, the performance under
      failure :math:`T_{f!=0}` can be further simplified with a total number of
      failures (:math:`T_{constant}`). :math:`T_{f!=0}` can be calculated
      :cite:`daly06higher` using a first-order (:math:`T_{first}`) and a
      higher-order (:math:`T_{higher}`) approximation for an optimal checkpoint
      interval :math:`\tau`.
      
      .. math::
      
         \begin{aligned}
           T_{f!=0} &= T_{E} + N T_{s} + T_{EL} + T_{R}\\
           T_{constant} &= T_{E} + N T_{s} + T_{EL} + \frac{T_{E}}{M}(T_{l} + T_{r})\\
           T_{first} &= T_{E} +
                \left( \frac{T_{E}}{\tau} - 1 \right) T_{s} +
                \frac{T_{E}}{M} T_{e,f} (\tau + T_{s}) +
                \frac{T_{E}}{M} (T_{l} + T_{r}),\notag\\
           \tau &= \sqrt{2 M T_{s}}\\
           T_{higher} &= M e^{(T_{l} + T_{r})/M} \left( e^{(\tau+T_{s})/M} - 1 \right) \frac{T_{E}}{\tau},\notag\\
           \tau &= \sqrt{2 M T_{s}}\left[ 1+\frac{1}{3}\left(\frac{T_{s}}{2M}\right)^{1/2}    +\frac{1}{9}\left(\frac{T_{s}}{2M}\right)\right] -    T_{s}
         \end{aligned}
      
   Reliability
      Given that the pattern enables the resumption of correct operation after
      an error or failure, the reliability of a system employing it is defined
      by errors and failures that are not handled by the pattern, such as
      failures of the persistent storage. The reliability after applying the
      pattern :math:`R(t)` can be obtained using the performance under failure
      :math:`T` and the failure rate :math:`\lambda_{u}` (or its inverse, the
      :term:`mean-time to failure (MTTF)<MTTF>`, :math:`M_{u}`) of the
      unprotected part of the system.
      
      .. math::
      
         \begin{aligned}
           R(t) &= e^{-\lambda_{u} T} = e^{-T/M_{u}}
         \end{aligned}
      
   Availability
      The availability of the pattern can be calculated using the task's total
      execution time without the pattern :math:`T_{E}` and the performance with
      the pattern :math:`T`. :math:`T_{E}` is :term:`planned uptime (PU)<PU>`
      and :math:`T` is :term:`planned uptime (PU)<PU>`, :term:`scheduled
      downtime (SD)<SD>` and :term:`unscheduled downtime (UD)<UD>`.
   
      .. math::
   
         \begin{aligned}
           A &= \frac{t_{pu}}{t_{pu}+t_{ud}+t_{sd}}
         \end{aligned}

Examples
   Many :term:`HPC` applications implement application-level rollback by
   regularly saving intermediate results to persistent storage as checkpoints
   and supporting the capability to load such a checkpoint in addition to some
   or all of the original data upon restart to recreate the last known correct
   state. Library-based solutions, such as FTI :cite:`Bautista-Gomez:2011`,
   permit tracking of state that needs to be saved and restored. System-level
   solutions, such as DMTCP :cite:`ansel2009dmtcp`, support transparent state
   saving and restoration using :term:`OS` support.

Rationale
   This pattern enables a system to tolerate an error or failure through
   resumption of correct operation after impact. It relies on the capability to
   preserve system state before an error or failure, often in a periodic
   fashion, and restore the previously preserved system state upon such an
   event to resume operation from a known correct state. The pattern performs
   proactive actions, such as preserving system state, but mostly relies on
   reactive actions after an error or failure impacted the system.

   Progress in the system is lost after an error or failure, as the recovery is
   only able to recreate the system state to the time when the snapshot
   occurred. Error or failure detection is not part of the pattern. The
   preserved system state is managed on persistent storage, which is not part
   of the protection domain. The containment and mitigation offered by this
   pattern are independent from the type of error or failure. The pattern has
   very little design complexity and has low dependence on a system's
   architecture, which makes it appealing as a general and portable solution.

.. _intersect:arch:sos:logical:resilience:patterns::rollback:system:

System Scope
------------

.. todo:: Describe the application of the pattern in the system scope.

.. _intersect:arch:sos:logical:resilience:patterns::rollback:service:

Service Scope
-------------

.. todo:: Describe the application of the pattern in the service scope.
