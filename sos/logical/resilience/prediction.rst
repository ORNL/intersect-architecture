.. _intersect:arch:sos:logical:resilience:patterns:prediction:

Prediction
==========

The Prediction structural pattern is a derivative of the Fault Diagnosis
architectural pattern and the Fault Treatment strategy pattern in the
original resilience design pattern specification
(:numref:`intersect:arch:sos:logical:resilience:patterns:classification`)
:cite:`engelmann22rdp-20`. It predicts future faults that have not been
activated based on the idea that such future faults have detectable
precursors. The following describes the
:ref:`intersect:arch:sos:logical:resilience:patterns:prediction:pattern`
and its application in the
:ref:`intersect:arch:sos:logical:resilience:patterns:prediction:system`
and in the
:ref:`intersect:arch:sos:logical:resilience:patterns:prediction:service`
of the :term:`INTERSECT` federated ecosystem for instrument science. Note that
the
:ref:`intersect:arch:sos:logical:resilience:patterns:prediction:pattern`
description uses the terms system, subsystem, and service in an abstract way,
while the
:ref:`intersect:arch:sos:logical:resilience:patterns:prediction:system`
and the
:ref:`intersect:arch:sos:logical:resilience:patterns:prediction:service`
map those terms to the :term:`INTERSECT` federated ecosystem.

.. _intersect:arch:sos:logical:resilience:patterns:prediction:pattern:

Pattern
-------

Problem
   Not anticipating the presence, root cause, and impact of a defect or
   anomaly in the system causes lack of corrective action at design or run
   time and may eventually result in an error or failure.

Context
   The pattern applies to a system that has the following characteristics:

   -  The system has well-defined parameters that enable a monitoring system
      to discover the presence of a defect or anomaly in the behavior of the
      monitored system.

   -  The interaction between the monitored and monitoring systems is bounded
      in terms of time.

   -  The monitoring system has the capability to store historical data about
      the behavior of the monitored system to analyze it for defect or anomaly
      occurrences.

Forces
   -  The interactions between the monitoring and monitored systems may
      interfere with the operation of the monitored system, specifically its
      performance.

   -  While the frequency and duration of these interactions must be minimized
      to reduce the monitoring overhead, the interactions must be able to
      detect/infer a defect or anomaly in the monitored system.

   -  The monitoring system’s data gathering and defect/anomaly
      detection/inference must be in time to prevent the activation of an
      error and a subsequent failure.

   -  The diagnostic resolution, i.e., the degree of accuracy of the fault
      diagnosis, must be high to be effective.

Solution
   The pattern enables the discovery and treatment of a defect or anomaly in
   the system, which has the potential to activate an error and potentially a
   subsequent failure. It supports methods that attempt to recognize the
   potential of a future defect or anomaly within a monitored system. It
   prevents its activation or enables its containment and mitigation by
   notifying the monitored system about a future fault with location and type
   information, such that the anomaly or defect is removed before or after it
   results in an error or a failure.

   The solution requires a monitoring system, which may be a subsystem of the
   monitored system or an external independent system, to observe key
   parameters of the monitored system and to notify the monitored system when
   these parameters deviate. The pattern identifies anomalous behavior that
   indicates the potential for a future fault, which may result in an error or
   failure in the system. The monitoring system may approach the problem using
   two strategies:

   Statistical Method
      The monitoring system discovers probabilistic characteristics of a
      potential fault in the system using statistical inference techniques
      that examine correlations with previous events.

   Rule-based Method
      The monitoring system builds rules of association to capture the causal
      correlations between system parameter values and faults.

   The monitoring system contains the following components to predict faults
   in the monitored system:

   Filter/Preprocessor
      This component removes incomplete monitoring data and duplicates and
      produces a consistent monitoring data format for analysis.

   Regression
      This component analyzes the monitoring parameter values and establishes
      relationships between them.

   Knowledge Base
      This storage component maintains the rules or statistical properties and
      models to be used for online prediction of faults using real-time
      monitoring data captured from the monitored system.

   The components of this pattern are illustrated in
   :numref:`intersect:arch:sos:logical:resilience:patterns::prediction:components`.
   
   .. figure:: monitoring/components.png
      :name: intersect:arch:sos:logical:resilience:patterns::prediction:components
      :align: center
      :alt: Prediction pattern components

      Prediction pattern components

Capability
   The pattern provides fault anticipation in the monitored system at design
   or run time, before it eventually results in an error or failure or after
   activation, by identifying deviations in monitored parameters. This pattern
   enables containment and mitigation of a future, imminent, or present error
   or failure in the monitored system through prediction and by notifying the
   monitored system about a future fault with location and type information. A
   system using the pattern is able to predict faults and take corrective
   action at design and run time. This pattern provides fault
   prediction/detection in the monitored system at design or run time, before
   it eventually results in an error or failure or after activation, by
   identifying deviations in monitored parameters and performing regression
   and statistical/rule-based modeling.

   The pattern enables containment and mitigation of a future, imminent or
   present error or failure in the monitored system through detection and by
   notifying the monitored system about a fault with location and type
   information based on regression and statistical/rule-based modeling. The
   flowchart of the pattern is shown in
   :numref:`intersect:arch:sos:logical:resilience:patterns:prediction:flowchart`,
   the state diagram in
   :numref:`intersect:arch:sos:logical:resilience:patterns:prediction:state_diagram`,
   and its parameters in
   :numref:`intersect:arch:sos:logical:resilience:patterns:prediction:parameters`.

   .. figure:: prediction/flowchart.png
      :name: intersect:arch:sos:logical:resilience:patterns:prediction:flowchart
      :align: center
      :alt: Flowchart
   
      Flowchart
   
   .. figure:: prediction/state_diagram.png
      :name: intersect:arch:sos:logical:resilience:patterns:prediction:state_diagram
      :align: center
      :alt: State diagram
   
      State diagram
   
   .. table:: Prediction pattern parameters
      :name: intersect:arch:sos:logical:resilience:patterns:prediction:parameters
      :align: center

      +-----------------+---------------------------------------------------+
      | Parameter       | Definition                                        |
      +=================+===================================================+
      | :math:`T_{mon}` | Time to monitor (sub-) system parameters,         |
      |                 | including wait and probe times                    |
      +-----------------+---------------------------------------------------+
      | :math:`T_{f}`   | Time to perform the filtering                     |
      +-----------------+---------------------------------------------------+
      | :math:`T_{r}`   | Time to perform the regression                    |
      +-----------------+---------------------------------------------------+
      | :math:`T_{mod}` | Time to perform the statistical/rule-based        |
      |                 | modeling                                          |
      +-----------------+---------------------------------------------------+
      | :math:`T_{n}`   | Time to raise notification                        |
      +-----------------+---------------------------------------------------+

Protection Domain
   The protection domain extends to the monitored system.

Resulting Context:
   The discovery and treatment of a defect or anomaly in the system that has
   the potential to activate are enabled, which can be used to prevent,
   contain, and mitigate an error or a failure in the system. The pattern
   requires identifying system parameters that indicate the potential for a
   fault. The overall system design must include a monitoring system, which
   introduces design complexity. When the monitoring system is extrinsic to
   the monitored system, the design effort may be simplified, but the
   interfaces between the monitoring and monitored systems must be
   well-defined. When the monitoring system is intrinsic to the design of the
   monitored system, design complexity increases due to the need to interface
   the monitoring and monitored subsystems.

   A trade-off exists between interference with the operation of the monitored
   system caused by the frequency and duration of the interactions between the
   monitoring and monitored systems, and the ability to detect/infer a defect
   or anomaly in the monitored system. A high performing solution reduces the
   interference, while maintaining a reasonable ability to detect/infer a
   defect or anomaly.

   The pattern may be used in conjunction with other patterns that provide
   containment and mitigation and require or can make use of fault
   prediction/detection. It detects the presence of a defect or anomaly and
   reports it, but does act to remedy the future fault. Based on the monitored
   system design and accessibility of the parameters selected for observation,
   the diagnosis may not be very precise and may sometimes give no indication.
   An efficient implementation performs regression and statistical/rule-based
   modeling with a reasonable degree of precision and recall.

   Performance
      In the case when monitoring system is not a part of monitored system,
      the monitoring system doesn’t impact the task total execution time
      :math:`T_{E}`. The error/failure-free performance :math:`T_{f=0}` when
      the monitoring system is not a part of monitored system is :math:`T_{E}`.

      When the monitoring system is a part of the monitored system, then it
      does impact the task total execution time. The error/failure-free
      performance :math:`T_{f=0}` of the pattern is defined by the task’s total
      execution time without any resilience strategy :math:`T_{E}`, the time to
      monitor sub-system parameters :math:`T_{mon}`, the time to perform the
      filtering :math:`T_{f}`, the time to perform the
      regression :math:`T_{r}`, and the time to perform the
      statistical/rule-based modeling :math:`T_{mod}` with the total number of
      input-execute-output cycles :math:`P`. Assuming constant times for
      :math:`T_{mon}`, :math:`T_{f}`, :math:`T_{r}`, and :math:`T_{mod}`,
      :math:`T_{f=0}` can be defined as:

      .. math::
      
         \begin{aligned}
            T_{f=0} = T_{E} + P(T_{mon} + T_{f} + T_{r} + T_{mod})
         \end{aligned}

      The performance under errors/failures :math:`T_{f!=0}` is defined by the
      error/failure-free performance :math:`T_{f=0}`, plus the time
      :math:`T_{n}` to raise :math:`N` notifications with type and location.
      Assuming constant time for :math:`T_{n}`, :math:`T_{f!=0}` can be defined
      as:

      .. math::
      
         \begin{aligned}
            T_{f!=0} = T_{f=0} + N T_{n}
         \end{aligned}

   Reliability
      As the pattern only detects errors or failures, the reliability remains
      the same with an assumed constant propabalistic error/failure rate
      :math:`\lambda` (or its corresponding inverse, the
      :term:`mean-time to interrupt (MTTI)<MTTI>` :math:`M`).

      .. math::
      
         \begin{aligned}
            R(t) = e^{-\lambda T_{f!=0}} = e^{-T_{f!=0}/M}
         \end{aligned}

   Availability
      The availability of the pattern can be calculated using the task's total
      execution time without the pattern :math:`T_{E}` and performance under
      errors/failures :math:`T_{f!=0}`. :math:`T_{E}` is the :term:`planned
      uptime (PU)<PU>` :math:`t_{pu}` and :math:`T_{f!=0}` is the
      :term:`planned uptime (PU)<PU>` :math:`t_{pu}`, the :term:`scheduled
      downtime (SD)<SD>` :math:`t_{sd}`, and the :term:`unscheduled downtime
      (UD)<UD>` :math:`t_{ud}`.

      .. math::
      
         \begin{aligned}
           A = \frac{T_{E}}{T_{f!=0}} = \frac{t_{pu}}{t_{pu}+t_{ud}+t_{sd}}
         \end{aligned}

Examples
   -  In proactive fault tolerance, an :term:`observe-orient-decide-act
      (OODA)<OODA>` loop control is employed that utilizes monitoring tools for
      collecting sensor data (e.g., temperature, fan speeds, voltages,
      computational load, memory and storage usage, etc.). It leverages the
      warning thresholds of these sensors as early fault indicators to migrate
      computation away from compute nodes that are about to
      fail :cite:`engelmann09proactive`. The mitigation may use
      process-level :cite:`wang12proactive` or :term:`virtual machine
      (VM)<VM>` level :cite:`nagarajan07proactive` migration.

   -  Monitoring tools collecting event data (e.g., anomalous, error and
      failure events, debug messages, etc.) are used in conjunction with tools
      for temporal and spatial filtering to identify event correlations and to
      predict failures :cite:`liang06blue`.

   -  Probabilistic networks are utilized for establishing correlations
      between event collected with monitoring tools to predict
      failures :cite:`sahoo03critical`.

Rationale
   The pattern enables a system to discover and treat a defect or anomaly in
   the system that has the potential to activate and become an error or
   failure. It relies on a monitoring system to observe the monitored system,
   identifying deviations in monitored parameters. A discovered defect or
   anomaly is treated by raising a notification about a future fault with
   location and type information, permitting the monitored system to provide
   containment and mitigation. A key benefit of this pattern is prediction of
   faults in the system, before they are activated and result in errors or
   failures. Preventive actions taken upon such discovery avoid the need for
   expensive error/failure recovery, compensation, or correction actions.

.. _intersect:arch:sos:logical:resilience:patterns:prediction:system:

System Scope
------------

In the context of :term:`INTERSECT` :ref:`intersect:arch:sos:logical:systems`,
this pattern can be applied to :term:`INTERSECT` systems and subsystems. It
would be primarily applied to an entire infrastructure system and its
subsystems, but it could also be applied an entire logical system that spans
across multiple infrastructure systems. It could be applied to a logical
subsystem of an infrastructure system only.

.. _intersect:arch:sos:logical:resilience:patterns:prediction:service:

Service Scope
-------------

In the context of :term:`INTERSECT` :ref:`intersect:arch:sos:logical:systems`,
this pattern can be applied to an :term:`INTERSECT` service. If it is applied
to a group of services, then this is typically within the
:ref:`intersect:arch:sos:logical:resilience:patterns:prediction:system`.

