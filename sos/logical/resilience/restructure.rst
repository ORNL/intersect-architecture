.. _intersect:arch:sos:logical:resilience:patterns:restructure:

Restructure
===========

The Restructure structural pattern is a derivative of the Reconfiguration
architectural pattern and the Fault Treatment and Fault Recovery strategy
patterns in the original resilience design pattern specification
(:numref:`intersect:arch:sos:logical:resilience:patterns:classification`)
:cite:`engelmann22rdp-20`. It offers detection, containment, and mitigation
without restoring previously preserved state, employing redundancy, or
self-masking or self-correcting illegal system state. The following describes
the
:ref:`intersect:arch:sos:logical:resilience:patterns:restructure:pattern`
and its application in the
:ref:`intersect:arch:sos:logical:resilience:patterns:restructure:system`
and in the
:ref:`intersect:arch:sos:logical:resilience:patterns:restructure:service`
of the :term:`INTERSECT` federated ecosystem for instrument science. Note that
the
:ref:`intersect:arch:sos:logical:resilience:patterns:restructure:pattern`
description uses the terms system, subsystem, and service in an abstract way,
while the
:ref:`intersect:arch:sos:logical:resilience:patterns:restructure:system`
and the
:ref:`intersect:arch:sos:logical:resilience:patterns:restructure:service`
map those terms to the :term:`INTERSECT` federated ecosystem.

.. _intersect:arch:sos:logical:resilience:patterns:restructure:pattern:

Pattern
-------

Problem
   A hardware or software error or subsystem failure due to a physical fault
   (e.g., wear-out or destruction) or a design fault (e.g., resource
   underprovisioning) causes a software, such as a service, to experience an
   error or failure.

Context
   The pattern applies to a system that has the following characteristics:

   -  The system is deterministic, i.e., forward progress of the system is
      defined in terms of the input state to the system and the execution steps
      completed since system initialization.
   
   -  The system has well-defined parameters that enable a monitoring system to
      discover the presence of an existing or future fault, error, or failure
      in the behavior of the monitored system.
   
   -  The interaction between the monitored and monitoring systems is bounded
      in terms of time.
   
   -  The monitoring system has the capability to readily analyze the behavior
      of the monitored system to detect or predict a fault, error, or failure.
   
   -  The system is able to be partitioned into logical subsystems, where
      altering the interconnection between the subsystems enables the system to
      remain operational.

Forces
   -  The interactions between the monitoring and monitored systems may
      interfere with the operation of the monitored system, specifically its
      performance.
   
   -  While the frequency and duration of these interactions must be minimized
      to reduce the monitoring overhead, the interactions must be able to
      detect or predict a fault, error, or failure in the monitored system.
   
   -  The diagnostic resolution, i.e., the degree of accuracy of the fault
      diagnosis, must be high to be effective.
   
   -  The ability of the system to alter the interconnection among subsystems
      must permit system operation that is functionally equivalent to the
      fault, error, or failure-free operation of the system.
   
   -  The restructuring may force the system to operate at a lower level of
      performance.

Solution
   The pattern alleviates the impact of a fault, error, or failure on system
   operation by changing the interconnection between the subsystems in the
   overall system. It has a detection component and an additional containment
   and mitigation component that acts upon the notification from the detection
   component.

   The detection component enables the discovery of an existing or future
   fault, error, or failure in the system. It enables its containment and
   mitigation by notifying the system about it with location and type
   information. The solution requires a monitoring system, which may be a
   subsystem of the monitored system or an external independent system, to
   observe key parameters of the monitored system and to notify the monitored
   system when these parameters deviate. This pattern does not specify the
   detailed method of detection or prediction.

   The containment and mitigation component acts upon the notification from the
   detection component by modifying the interconnection between the :math:`N`
   subsystems in the overall system to permanently isolate (exclude) the
   subsystem affected by the predicted or detected fault, error, or failure.
   The system assumes an :math:`N-1` subsystem configuration in response to a
   notification, which is characterized by its own interconnection topology and
   retains functional equivalency with the original system configuration. The
   components of this pattern are illustrated in
   :numref:`intersect:arch:sos:logical:resilience:patterns:restructure:components`.
   
   .. figure:: restructure/components.png
      :name: intersect:arch:sos:logical:resilience:patterns:restructure:components
      :align: center
      :alt: Restructure pattern components

      Restructure pattern components

Capability
   A system using this pattern is able to continue to operate in the presence
   of a non-permanent fault, error, or failure with some interruption. This
   pattern provides detection/prediction, containment, and mitigation of a
   future or existing fault, error, or failure in the system by changing the
   interconnection between the subsystems in the overall system to a
   functionally equivalent configuration, permanently isolating (excluding) the
   affected subsystem. The flowchart of the
   pattern is shown in
   :numref:`intersect:arch:sos:logical:resilience:patterns:restructure:flowchart`,
   the state diagram in
   :numref:`intersect:arch:sos:logical:resilience:patterns:restructure:state_diagram`,
   and its parameters in
   :numref:`intersect:arch:sos:logical:resilience:patterns:restructure:parameters`.
   
   .. figure:: restructure/flowchart.png
      :name: intersect:arch:sos:logical:resilience:patterns:restructure:flowchart
      :align: center
      :alt: Flowchart
   
      Flowchart
   
   .. figure:: restructure/state_diagram.png
      :name: intersect:arch:sos:logical:resilience:patterns:restructure:state_diagram
      :align: center
      :alt: State diagram
   
      State diagram
   
   .. table:: Restructure pattern parameters
      :name: intersect:arch:sos:logical:resilience:patterns:restructure:parameters
      :align: center

      +---------------+-----------------------------------------------------+
      | Parameter     | Definition                                          |
      +===============+=====================================================+
      | :math:`T_{e}` | Time to execute system progress                     |
      +---------------+-----------------------------------------------------+
      | :math:`T_{d}` | Time to detect or predict a fault, error or failure |
      +---------------+-----------------------------------------------------+
      | :math:`T_{i}` | Time to isolate the affected subsystem(s)           |
      +---------------+-----------------------------------------------------+
      | :math:`T_{r}` | Time to remove the affected subsystem(s)            |
      +---------------+-----------------------------------------------------+

Protection Domain
   The protection domain extends to the monitored system’s state that is not
   lost due to a subsystem exclusion and to all of its resources that are able
   to be operate correctly after a restructuring.

Resulting Context
   A fault, error, or failure is prevented from affecting the correct operation
   of the system. While functional equivalency to the original system
   configuration is maintained through reconfiguration, progress in the system
   may be lost. The system is interrupted during reconfiguration in response to
   a detected or predicted fault, error, or failure, but is not interrupted
   during fault-, error-, and failure-free operation. The restructuring may
   force the system to operate at a lower level of performance. After
   reconfiguration, the system’s ability to prevent a fault, error or failure
   from affecting the correct operation of the system remains the same if it
   retains the capability to assume an :math:`N-1` system configuration with
   functional equivalency (where :math:`N` is the new number of subsystems
   after the previous reconfiguration).

   The pattern may be used in conjunction with other patterns that provide
   containment and mitigation in a complementary fashion, where some
   error/failure types are covered by the other  pattern(s) and the pattern
   covers for the remaining error/failure types.

   Performance
      In the case when the monitoring system is not a part of the monitored
      system, the monitoring system doesn’t impact the task's total execution
      time :math:`T_{E}`. The error/failure-free performance :math:`T_{f=0}` is
      :math:`T_{E}`.

      When the monitoring system is a part of the monitored system, the
      failure-free performance :math:`T_{f=0}` of the pattern is defined by the
      task’s total execution time without any resilience strategy :math:`T_{E}`
      and the time to detect or predict a fault, error or failure :math:`T_{d}`
      with the total number of input-execute-output cycles :math:`P`.

      .. math::
      
         \begin{aligned}
            T_{f=0} = T_{E} + P t_{d}
         \end{aligned}

      The performance under errors/failures :math:`T_{f!=0}` is defined by
      :math:`T_{f=0}`, plus the time to isolate the affected subsystem(s)
      :math:`T_{i}` and the time to remove the affected subsystem(s)
      :math:`T_{r}`, for each of the encountered faults, errors or failures
      :math:`N`. Assuming constant times for :math:`T_{i}` and :math:`T_{r}`,
      :math:`T_{f!=0}` can be defined as:

      .. math::
      
         \begin{aligned}
            T_{f!=0} = T_{f=0} + N (T_{i} + T_{r})
         \end{aligned}

   Reliability
      Given that the pattern enables the resumption of correct operation after
      an error or failure, the reliability of a system employing it is defined
      by errors and failures that are not handled by the pattern, such as
      failures of the persistent storage. The reliability after applying the
      pattern :math:`R(t)` can be obtained using the performance under failure
      :math:`T` and the failure rate :math:`\lambda_{u}` (or its inverse, the
      :term:`mean-time to interrupt (MTTI)<MTTI>`, :math:`M_{u}`) of the
      unprotected part of the system.

      .. math::
      
         \begin{aligned}
            R(t) = e^{-\lambda_{u} T} = e^{-T/M_{u}}
         \end{aligned}

   Availability
      The availability of the pattern can be calculated using the task's total
      execution time without the pattern :math:`T_{E}` and performance under
      errors/failures :math:`T_{f!=0}`. :math:`T_{E}` is the :term:`planned
      uptime (PU)<PU>` :math:`t_{pu}`. :math:`T_{f!=0}` is the
      :term:`planned uptime (PU)<PU>` :math:`t_{pu}`, the :term:`scheduled
      downtime (SD)<SD>` :math:`t_{sd}`, and the :term:`unscheduled downtime
      (UD)<UD>` :math:`t_{ud}`.

      .. math::
      
         \begin{aligned}
           A = \frac{T_{E}}{T_{f!=0}} = \frac{t_{pu}}{t_{pu}+t_{ud}+t_{sd}}
         \end{aligned}

Examples
   Unhealthy, erroneous, or failed system resources, such as compute nodes or
   :term:`general-purpose computing graphics processing unit (GPGPU)<GPGPU>`
   memory pages :cite:`Nvidia:DPR`, are removed from the system’s pool of
   resources though restructuring. A programming model, such as the proposed
   extension to the :term:`Message Passing Interface (MPI)<MPI>`
   standard :cite:`Bland:2013:IJHPCA`, permits an application to restructure
   the programming environment to handle resource failures.

Rationale
   The pattern prevents an existing or future fault, error, or failure from
   affecting the correct operation of the system through changing the
   interconnection between :math:`N` subsystems in the overall system. It
   relies on the ability to assume an :math:`N-1` functionally equivalent
   system configuration in response to a detected or predicted fault, error, or
   failure that retains functional equivalency with the original system
   configuration. The pattern may perform proactive actions, such as
   restructuring the system or subsystem before a fault, error, or failure
   impacts its operation, or reactive actions, such as restructuring the system
   or subsystem upon such an event.

   Progress in the system may be lost. Fault, error, or failure
   detection/prediction is part of the pattern. The containment and mitigation
   offered by this pattern are independent from the type of fault, error, or
   failure. The pattern has some design complexity due to the need to partition
   the system into logical subsystems. It has low dependence on a system’s
   architecture.

.. _intersect:arch:sos:logical:resilience:patterns:restructure:system:

System Scope
------------

In the context of :term:`INTERSECT` :ref:`intersect:arch:sos:logical:systems`,
this pattern can be applied to :term:`INTERSECT` systems and subsystems. It
would be primarily applied to an entire infrastructure system and its
subsystems, but it could also be applied an entire logical system that spans
across multiple infrastructure systems. It could be applied to a logical
subsystem of an infrastructure system only. The pattern could also be applied
across multiple infrastructure systems and their entire logical systems or
across multiple logical systems.

.. _intersect:arch:sos:logical:resilience:patterns:restructure:service:

Service Scope
-------------

In the context of :term:`INTERSECT` :ref:`intersect:arch:sos:logical:systems`,
this pattern can be applied to an :term:`INTERSECT` service. If it is applied
to a group of services, then this is typically within the
:ref:`intersect:arch:sos:logical:resilience:patterns:restructure:system`.
However, it could also be applied to interconnected services, such as to
services participating in the same :term:`campaign`.

.. _intersect:arch:sos:logical:resilience:patterns:restructure:microservice:

Microservice Scope
------------------

In the context of the :term:`INTERSECT` :ref:`intersect:arch:ms`, this pattern
can be applied to an :term:`INTERSECT` microservice. If it is applied
to a group of microservices, then this is typically within the
:ref:`intersect:arch:sos:logical:resilience:patterns:restructure:service`.
