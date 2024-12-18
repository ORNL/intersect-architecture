.. _intersect:arch:sos:logical:resilience:patterns:rollforward:

Rollforward
===========

.. todo:: Provide an introduction (maybe reuse content from and refer to the
          strategy, architectural and structural patterns).

.. _intersect:arch:sos:logical:resilience:patterns:rollforward:pattern:

Pattern
-------

Problem
   A hardware or software error or subsystem failure due to a physical fault
   (e.g., wear-out or destruction) or a design fault (e.g., resource
   underprovisioning) causes a software, such as a service, to experience an
   error due to loss of or corrupted state, and potentially a subsequent
   failure.

Context
   The pattern applies to a system that has the following characteristics:

   -  The system is deterministic, i.e., forward progress of the system is
      defined in terms of the input state to the system and the execution steps
      completed since system initialization.

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

Forces:
   -  The pattern requires additional storage to capture system state or to log
      messages or events, which increases overhead in terms of resources
      required by the system.

   -  The amount of state captured during each creation of a recovery point
      incurs storage space and execution time overheads.

   -  The creation frequency of system state snapshots determines overhead.
      More frequent snapshot creation increases system execution time, but
      reduces the amount of lost work upon an error or failure.

   -  The time interval for the recovery of a system from a snapshot as well as
      the time interval to create a snapshot must be less than the system’s
      :term:`mean-time between failures (MTBF)<MTBF>` to guarantee forward
      progress.

Solution
   The pattern enables the resumption of correct operation of a system impacted
   by an error or failure. It supports resilient operation by restoring the
   system to a known correct state in the event of an error or failure. Similar
   to :ref:`intersect:arch:sos:logical:resilience:patterns:rollback`
   solutions, rollforward solutions are classified into checkpoint-based and
   log-based strategies.

   The checkpoint-based strategy relies on the creation of system state
   snapshots and the maintenance of such checkpoints on a persistent storage
   system that is not affected by the error or failure. Upon detection of an
   error or failure, the most recent snapshot is used to recreate the last
   known error/failure-free state of the system. The log-based strategy relies
   on logging, i.e., storing the information of events, such as messages sent
   between different parts of the system or to the system as input, on a
   persistent storage system that is no t affected by the error or failure.
   Upon detection of an error or failure, the log is replayed to recreate the
   last known error/failure-free state of the system. In contrast to the
   checkpoint-based strategy, the log-based strategy is able to offer
   resilience in the presence of non-deterministic events and for
   non-deterministic systems, as replaying the event log deterministically
   recreates system state.
   
   The checkpoint and log-based strategies may be used together, where events
   are logged in-between snapshots. With both strategies, the operation of the
   system is resumed when the system state is recovered. Based on a temporal
   view of the system’s progress, the error/failure recovery is forward to the
   time when the error/failure occurred. The pattern must include a mechanism
   to facilitate restoring the system state from the last snapshot up to the
   point of the error or failure. This mechanism may be based on either:

   -  Log-based protocols that are based on the piecewise deterministic
      assumption, in which the system identifies nondeterministic events and
      the information necessary to replay the event during recovery is captured
      and logged. The following logging protocols for non-deterministic events
      may be used:
   
      Pessimistic
         The protocol assumes that an error or failure occurs after a
         nondeterministic event in the system. Therefore, the determinant of
         each nondeterministic event is immediately logged to persistent
         storage. The error/failure-free overhead of this approach is high.
   
      Optimistic
         The determinants are held in a volatile storage and written to
         persistent storage asynchronously. This protocol makes the optimistic
         assumption that the logging is completed before the occurrence of an
         error or failure. The error/failure-free overhead of this approach is
         low.
   
      Causal
         The protocol provides a balanced approach by avoiding immediate
         writing to persistent storage (much like the optimistic protocol to
         reduce error/failure-free overhead), but each subsystem commits output
         independently (like the pessimistic protocol to prevent creation of
         orphan subsystems).
   
   -  Online recovery protocols, which do not rely on event logging for
      rollforward of the system. These protocols may rely on inference to
      recreate state or on self-correction.

   Undetected (latent) errors that are either detected later or result in a
   different detected error or failure later represent a problem, as the most
   recent or even more snapshots may contain an illegal system state. In this
   case, the most recent correct snapshot may be used to recreate the last
   known error/failure-free state of the system, skipping snapshots containing
   illegal state and going further back in time in terms of when the snapshot
   was made. The components of this pattern are illustrated in
   :numref:`intersect:arch:sos:logical:resilience:patterns:rollforward:components`.
   
   .. figure:: rollforward/components.png
      :name: intersect:arch:sos:logical:resilience:patterns:rollforward:components
      :align: center
      :alt: Rollforward pattern components
   
      Rollforward pattern components

Capability
   A system using this pattern is able to continue to operate in the presence
   of an error or failure with some interruption. This pattern provides
   mitigation of an error or failure in the system by preserving system state
   on a persistent storage system before an error or failure, using a
   checkpoint-based and or log-based strategy, and restoring the previously
   preserved system state upon such an event and rolling it forward to resume
   operation from the known correct state right before the event. The flowchart
   of the pattern is shown in
   :numref:`intersect:arch:sos:logical:resilience:patterns:rollforward:flowchart`,
   the state diagram in
   :numref:`intersect:arch:sos:logical:resilience:patterns:rollforward:state_diagram`,
   and its parameters in
   :numref:`intersect:arch:sos:logical:resilience:patterns:rollforward:parameters`.
   
   .. figure:: rollback/flowchart.png
      :name: intersect:arch:sos:logical:resilience:patterns:rollforward:flowchart
      :align: center
      :alt: Flowchart
   
      Flowchart
   
   .. figure:: rollback/state_diagram.png
      :name: intersect:arch:sos:logical:resilience:patterns:rollforward:state_diagram
      :align: center
      :alt: State diagram
   
      State diagram
   
   .. table:: Rollforward pattern parameters
      :name: intersect:arch:sos:logical:resilience:patterns:rollforward:parameters
      :align: center

      +---------------+-----------------------------------------------------+
      | Parameter     | Definition                                          |
      +===============+=====================================================+
      | :math:`T_{e}` | Time to execute (sub-) system progress              |
      +---------------+-----------------------------------------------------+
      | :math:`T_{d}` | Time to detect an error/failure (not part of this   |
      |               | pattern, but shown for completeness)                |
      +---------------+-----------------------------------------------------+
      | :math:`T_{l}` | Time to load consistent (sub-) system state and     |
      |               | progress from storage                               |
      +---------------+-----------------------------------------------------+
      | :math:`T_{r}` | Time to rollforward to the correct state before the |
      |               | event                                               |
      +---------------+-----------------------------------------------------+
      | :math:`T_{s}` | Time to save (sub-) system state and progress to    |
      |               | storage                                             |
      +---------------+-----------------------------------------------------+

Protection Domain:
   The protection domain extends to the system state before an error or failure
   that can be recreated using the system state captured by snapshots stored on
   persistent storage.

Resulting Context
   Correct operation is resumed after an error or failure impacted the system.
   Progress in the system is not lost, since the recovery is able to recreate
   the system state to the time when the error/failure occurred. The system is
   interrupted during error-/failure-free operation for creating system state
   snapshots and maintaining them on a persistent storage system. The system is
   interrupted upon an error or failure for recreating the last known
   error/failure-free state of the system.

   A trade-off exists between the creation frequency of system state snapshots
   and/or event logging and the corresponding execution time overhead during
   error-/failure-free operation vs. the amount of work required to recreate
   the state in the case. The optimal solution of this trade-off depends on the
   :term:`MTBF`, the time it takes to save and load a system state snapshot,
   the time it takes to log events, and the time it takes to recreate the
   system state.

   The pattern does not provide error or failure detection and may be used in
   conjunction with other patterns to be fully functional. The pattern may be
   used in conjunction with other patterns that provide containment and
   mitigation in a complementary fashion, where some error/failure types are
   covered by the other pattern(s) and the pattern covers for the remaining
   error/failure types.

   Performance
      The pattern avoids losing any work as it recovers the system to stable
      state immediately before the error or failure event. Assuming constant
      times :math:`T_{s}`, :math:`T_{l}`, and :math:`T_{r}`, the performance
      :math:`T` can be calculated by getting rid of lost work :math:`T_{EL}`.

      .. math::
      
         \begin{aligned}
           T &= T_{E} +
                \left( \frac{T_{E}}{\tau} - 1 \right) T_{s} +
                \frac{T_{E}}{M} T_{e,f} (\tau + T_{s}) +
                \frac{T_{E}}{M} (T_{l} + T_{r}),\notag\\
           \tau &= \sqrt{2 M T_{s}}\\
           T &= T_{E} +
                \left( \frac{T_{E}}{\tau} - 1 \right) T_{s} +
                \frac{T_{E}}{M} (T_{l} + T_{r}), \tau = \sqrt{2 M T_{s}}
         \end{aligned}

   Reliability
      Given that the pattern enables the resumption of correct operation after
      an error or failure, the reliability of a system employing it is defined
      by errors and failures that are not handled by the pattern, such as
      failures of the persistent storage. The reliability after applying the
      pattern :math:`R(t)` can be obtained using the performance under failure
      :math:`T` and the failure rate :math:`\lambda_{u}` (or its inverse, the
      :term:`MTTF`, :math:`M_{u}`) of the unprotected part of the system.

      .. math::
      
         \begin{aligned}
           R(t) &= e^{-\lambda_{u} T} = e^{-T/M_{u}}
         \end{aligned}

   Availability
      The availability of the pattern can be calculated using the task's total
      execution time without the pattern :math:`T_{E}` and the performance with
      the pattern :math:`T`. :math:`T_{E}` is the :term:`planned uptime
      (PU)<PU>`, :math:`t_{pu}`, and :math:`T` is the :term:`planned uptime
      (PU)<PU>`, :math:`t_{pu}`, the :term:`scheduled downtime (SD)<SD>`,
      :math:`t_{sd}`, and the :term:`unscheduled downtime (UD)<UD>`,
      :math:`t_{ud}`.

      .. math::
      
         \begin{aligned}
           A &= \frac{t_{pu}}{t_{pu}+t_{ud}+t_{sd}}
         \end{aligned}

Examples
      :term:`Global View Resilience (GVR)<GVR>` :cite:`Chien:2016` is a runtime
      system that provides fault tolerance to applications by versioning
      distributed arrays for rollforward recovery, while the
      checkpoint-on-failure protocol :cite:`ansel2009dmtcp` for :term:`Message
      Passing Interface (MPI)<MPI>` applications leverages the features of a
      high-quality fault-tolerant :term:`MPI` implementation. In either case,
      algorithm-specific knowledge is needed to perform rollforward recovery,
      Some :term:`algorithm-based fault tolerance (ABFT)<ABFT>`
      solutions :cite:`ltaief08fault` can utilize the original or previously
      saved data as a replacement for lost or erroneous data and rollforward
      recover their state to the point at which the error/failure event
      occurred.

Rationale
   The pattern enables a system to tolerate an error or failure through
   resumption of correct operation after impact. It relies on the capability to
   preserve system state before an error or failure, often in a periodic
   fashion, and restore the previously preserved system state upon such an
   event to resume operation from a known correct state. The pattern performs
   proactive actions, such as preserving system state, but mostly relies on
   reactive actions after an error or failure impacted the system.

   Progress in the system is not lost, since the recovery is able to recreate
   the system state to the time when the error/failure occurred. Error or
   failure detection is not part of the pattern. The preserved system state is
   managed on persistent storage, which is not part of the protection domain.
   The containment and mitigation offered by this pattern are independent from
   the type of error or failure. The pattern has some design complexity, as a
   mechanism to restore the system state from the last snapshot up to the point
   of the error or failure is needed. The pattern has low dependence on a
   system’s architecture.

.. _intersect:arch:sos:logical:resilience:patterns:rollforward:system:

System Scope
------------

.. todo:: Describe the application of the pattern in the system scope.

.. _intersect:arch:sos:logical:resilience:patterns:rollforward:service:

Service Scope
-------------

.. todo:: Describe the application of the pattern in the service scope.
