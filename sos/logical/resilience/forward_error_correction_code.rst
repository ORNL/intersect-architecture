.. _intersect:arch:sos:logical:resilience:patterns:forward_error_correction_code:

Forward Error Correction Code
=============================

The Forward Error Correction Code structural pattern is a derivative of the
Redundancy architectural pattern and the Compensation strategy pattern in the
original resilience design pattern specification
(:numref:`intersect:arch:sos:logical:resilience:patterns:classification`)
:cite:`engelmann22rdp-20`. It offers detection, containment, and mitigation
with continuous operatation in the presence of an error or failure, and with
none-to-significant interruption and no loss of progress.

.. _intersect:arch:sos:logical:resilience:patterns:forward_error_correction_code:pattern:

Pattern
-------

Problem
   A hardware error or subsystem failure due to a physical fault (e.g.,
   wear-out or destruction) causes a software, such as a service, to
   experience an error and potentially a subsequent failure.

Context
   The pattern applies to a system that has the following characteristics:

   -  The system is deterministic, i.e. forward progress of the system is
      defined in terms of the input state to the system and the execution steps
      completed since system initialization.

   -  The system state is represented using a sequence of symbols.

Forces
   -  The pattern introduces an execution time and/or resource requirement
      (storage space, computational capability, etc.) penalty independent of
      whether an error or failure occurs during system operation or not.

   -  The scope and strength of the redundancy employed by the pattern
      determine its execution time and resource requirement overhead.

   -  The number of errors and failures that are detectable and correctable is
      limited by the amount of redundant information contained in the forward
      error correction code.

Solution
   The pattern enables the continuous correct operation of a system impacted by
   an error or failure. It supports resilient operation by applying redundancy
   to system state and optionally to system resources. This redundancy is in
   the form of encoded system state. The pattern requires very well defined
   input and output to permit input encoding and output decoding. Input is
   encoded, processed redundantly in an encoded fashion by the system, and the
   output is then decoded. The decoding corrects an error or failure. The scope
   and strength of the redundancy are defined by the encoding/decoding.

   Redundancy can be in time, meaning the same system resources process the
   encoded input in time. Redundancy can also be in space, meaning additional
   (redundant) system resources are used, such that the different system
   resources process the encoded input in space. Redundancy in time saves
   system resources, while redundancy in space offers more error/failure
   coverage. A mix between redundancy in time and space is possible as well,
   where there is more encoded system state than additional (redundant) system
   resources.

   Encoding in its simplest form may be just repeating the input for redundancy
   in time, where the decoding just compares subsequent outputs. More involved
   encoding/processing/decoding schemes involve :math:`k` information symbols
   and :math:`r` redundant information symbols, where there may be less than,
   equal to or more than :math:`r` symbols than :math:`k` symbols. In the
   previously mentioned simplest form, the :math:`k` and :math:`r` symbols are
   the same and there may be 1 or more :math:`r` symbols. The components of
   this pattern are illustrated in
   :numref:`intersect:arch:sos:logical:resilience:patterns::forward_error_correction_code:components`.
   
   .. figure:: forward_error_correction_code/components.png
      :name: intersect:arch:sos:logical:resilience:patterns::forward_error_correction_code:components
      :align: center
      :alt: Forward Error Correction Code pattern components

      Forward Error Correction Code pattern components

Capability
   A system using this pattern is able to continue to operate in the presence
   of an error or failure with no interruption. This pattern provides error
   and/or failure detection in the system by applying redundancy to system
   state in the form of encoded system state. The pattern provides mitigation
   of an error or failure in the system by applying redundancy to system state
   and optionally to system resources, such that the system continues to
   operate correctly in the presence of such an event. The flowchart of the
   pattern is shown in
   :numref:`intersect:arch:sos:logical:resilience:patterns:forward_error_correction_code:flowchart`,
   the state diagram in
   :numref:`intersect:arch:sos:logical:resilience:patterns:forward_error_correction_code:state_diagram`,
   and its parameters in
   :numref:`intersect:arch:sos:logical:resilience:patterns:forward_error_correction_code:parameters`.

   .. figure:: forward_error_correction_code/flowchart.png
      :name: intersect:arch:sos:logical:resilience:patterns:forward_error_correction_code:flowchart
      :align: center
      :alt: Flowchart
   
      Flowchart
   
   .. figure:: forward_error_correction_code/state_diagram.png
      :name: intersect:arch:sos:logical:resilience:patterns:forward_error_correction_code:state_diagram
      :align: center
      :alt: State diagram
   
      State diagram
   
   .. table:: Forward Error Correction Code pattern parameters
      :name: intersect:arch:sos:logical:resilience:patterns:forward_error_correction_code:parameters
      :align: center

      +----------------+----------------------------------------------------+
      | Parameter      | Definition                                         |
      +================+====================================================+
      | :math:`T_{a}`  | Time to activate the redundant information storage |
      +----------------+----------------------------------------------------+
      | :math:`T_{en}` | Time to encode the input for the (sub-) system     |
      +----------------+----------------------------------------------------+
      | :math:`T_{ex}` | Time to execute (sub-) system progress             |
      +----------------+----------------------------------------------------+
      | :math:`T_{d}`  | Time to decode the output from the (sub-) system   |
      |                | and detect                                         |
      +----------------+----------------------------------------------------+
      | :math:`T_{c}`  | Time to correct using redundant information        |
      +----------------+----------------------------------------------------+

Protection Domain
   The protection domain extends to the encoded system state and to the system
   resources processing it.

Resulting Context
   Correct operation is performed despite an error or failure impacting the
   system. Progress in the system is not lost due to an error or failure. The
   system is not interrupted during error-/failure-free operation or when
   encountering an error or failure. Resource usage in time or space is
   increased according to the amount of redundancy employed in the form of
   encoded system state and due to the encoding of input and decoding and
   correction of output.

   A trade-off exists between the amount of redundancy employed and the number
   of errors and/or failures that can be tolerated at the same time and/or in
   time. More redundancy tolerates generally more errors and/or failures, but
   requires either more resources or more execution time.

   The pattern may be used in conjunction with other patterns that provide
   containment and mitigation in a complementary fashion, where some
   error/failure types are covered by the other pattern(s) and the pattern
   covers for the remaining error/failure types.

   Performance
      The failure free performance :math:`T_{f=0}` of the pattern is defined by
      the task total execution time without any resilience strategy
      :math:`T_{E}`, the total time to activate the redundant information
      storage :math:`T_{a}`, the time to encode :math:`T_{en}`, and the time to
      decode and detect :math:`T_{d}` with the total number of
      input-execute-output cycles :math:`P`. The performance under failure T is
      defined by :math:`T_{f=0}` plus the time :math:`T_{c}` to correct using
      redundant information, where total time to correct using redundant
      information is number of error or failure times :math:`T_{c}`. Assuming
      constant times :math:`T_{a}`, :math:`T_{en}` (:math:`t_{en}`),
      :math:`T_{d}` (:math:`t_{d}`), and :math:`T_{c}`, :math:`T` can be
      defined by:

      .. math::

         \begin{aligned}
            T = T_{E} + T_{a} + P(t_{en} +t_{d}) + \frac{T_{E}}{M}\left( T_{c} \right)
         \end{aligned}

   Reliability
      Given that the pattern enables the resumption of correct operation after
      an error or failure, the reliability of a system employing it is defined
      by errors and failures that are not handled by the pattern, such as
      failures of the persistent storage system. The reliability after applying
      the pattern :math:`R(t)` can be obtained using the performance under
      failure :math:`T` and the failure rate :math:`\lambda_{u}` (or its
      inverse, the :term:`MTTF`, :math:`M_{u}`) of the unprotected part of the
      system.

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
   There are various schemes that enable forward error correction in memory
   devices, storage systems as well as communication channels. Based on time
   and space overhead constraints, schemes of different detection and
   correction capabilities are used. Popular examples include parity bits,
   checksums, Hamming codes, hash function codes. More elaborate schemes such
   as systematic cyclic block codes include binary
   :term:`Bose-Chaudhuri-Hocquenghem (BCH)<BCH>`, Reed-Solomon, and
   :term:`cyclic redundancy check (CRC)<CRC>`. Forward error correction can be
   found in storage systems with :term:`redundant array of independent disks
   (RAID)<RAID>`, the InfiniBand interconnect :cite:`Mellanox:2011`, the memory
   hierarchy :cite:`Moon:2005,ibm:chipkill`, :term:`algorithm-based fault
   tolerance (ABFT)<ABFT>` solutions :cite:`Huang:1984` and coded computing
   :cite:`jeong203d`.

Rationale
   The pattern enables a system to tolerate an error or failure through
   continuation of correct operation after impact. It relies on system state
   redundancy in the form of encoded system state. The pattern performs mostly
   proactive actions, such as maintaining redundancy. Error or failure
   detection is part of the pattern in the form of output decoding. The
   pattern has high design complexity due to the need for encoding input,
   decoding output, and processing encoded system state.

.. _intersect:arch:sos:logical:resilience:patterns:forward_error_correction_code:system:

System Scope
------------

.. todo:: Describe the application of the pattern in the system scope.

.. _intersect:arch:sos:logical:resilience:patterns:forward_error_correction_code:service:

Service Scope
-------------

.. todo:: Describe the application of the pattern in the service scope.
