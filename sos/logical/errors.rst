.. _intersect:arch:sos:logical:errors:

Error and Failure Notification and Handling
===========================================
   
Faults, errors, and failures do happen at various levels of granularity and
need to be handled properly within a federated ecosystem. For example, systems
or subsystems may fail to respond or services may behave erroneously.
:ref:`intersect:arch:sos:logical:errors:detection`,
:ref:`intersect:arch:sos:logical:errors:containment`, and
mitigation (:ref:`intersect:arch:sos:logical:errors:notification` and
:ref:`intersect:arch:sos:logical:errors:handling` ) is needed.

The following terms were defined by the :term:`HPC` resilience community
:cite:`engelmann22rdp-20`: A :ref:`intersect:arch:sos:logical:errors:fault` is
an underlying flaw or defect that has potential to cause problems. It can be
dormant and can have no effect. When activated during operation, a fault leads
to an :ref:`intersect:arch:sos:logical:errors:error`. Fault activation may be
due to triggers that are internal or external. An error results from the
activation of a fault and causes an illegal state. A
:ref:`intersect:arch:sos:logical:errors:failure` occurs if an error reaches
the service interface of a system, resulting in system behavior that is
inconsistent with a specification.

There are different aspects of dealing with faults, errors and failures in the
:term:`INTERSECT` ecosystem. First, basic :term:`INTERSECT` services required
to operate and use the ecosystem need to be up and running correctly at the
time they are being used, i.e., they need to be highly available and
dependable. Second, disruptive events need to be handled in a reasonable
manner, ranging from a simple fail-stop to more elaborate fault tolerance
strategies such as failing over to redundant services. Third, certain workflows
using the ecosystem may have real-time requirements that, if not fulfilled, may
result in a failure of a workflow. Lastly, there are certainly other resilience
aspects, such as guaranteeing the correctness of computation performed by
services.

The :ref:`intersect:arch:sos:logical` addresses the logical composition and
interactions between the different systems in the overall system. In this
context, it also addresses the
:ref:`intersect:arch:sos:logical:errors:notification` and
:ref:`intersect:arch:sos:logical:errors:handling` of errors and failures
impacting these interactions. Either a system is detecting that another system
experiences such an event or it is notified about it by the system experiencing
the event or by another system. There is, however, a distinct difference between
:ref:`intersect:arch:sos:operational:activities:monitoring` and
:ref:`intersect:arch:sos:operational:activities:health` performed in the
:ref:`intersect:arch:sos:operational` and
:ref:`intersect:arch:sos:logical:errors:detection`,
:ref:`intersect:arch:sos:logical:errors:notification`, and
:ref:`intersect:arch:sos:logical:errors:handling` performed in the
:ref:`intersect:arch:sos:logical`.

The error and failure notification and handling in the logical view is
always in the scope of a specific
:ref:`task, command, or action<intersect:arch:sos:logical:systems:ors:tasks>`
and in the context of a specific :ref:`system, subsystem, and
service<intersect:arch:sos:logical:systems>`. These activities may encounter
such events, either when self-detected or when notified. This may include a
failed action, command, or task as a result of a failed instrument, computer,
or data storage. These events may be encountered by a service and communicated
back to another service that was trying to use it. They also may be encounterd
when a service is trying to use another service, but it fails to respond.

.. _intersect:arch:sos:logical:errors:fault:

Fault
-----

A fault is an underlying flaw or defect that has potential to cause problems
:cite:`engelmann22rdp-20`. It can be dormant and can have no effect. When
activated during operation, a fault leads to an error. Fault activation may be
due to triggers that are internal or external. The following fault classes
exist: *{benign, dormant, active} {permanent, transient, intermittent} {hard,
soft}*. These fault classes have the following categories:

   - *Benign:* An inactive fault that does not activate.
   - *Dormant:* An inactive fault that potentially does become active at some
     point in time.
   - *Active:* A fault that causes an error at the moment it becomes active.
   - *Permanent:* The presence of the fault is continuous in time.
   - *Transient:* The presence of the fault is temporary.
   - *Intermittent:* The presence of the fault is temporary and recurring.
   - *Hard:* A fault that is systematically reproducible.
   - *Soft:* A fault that is not systematically reproducible.

The following common terms map to these fault classes:

   - *Latent fault:* Any type of *dormant fault*.
   - *Solid fault:* Any type of *hard fault*.
   - *Elusive fault:* Any type of *soft fault*.

.. _intersect:arch:sos:logical:errors:error:

Error
-----

An error results from the activation of a fault and causes an illegal state
:cite:`engelmann22rdp-20`. The following error classes exist: *{undetected,
detected} {unmasked, masked} {hard, soft}*. These error classes have the
following categories:

  - *Undetected:* An error whose presence is not indicated.
  - *Detected:* An error whose presence is indicated by a message or a signal.
  - *Masked:* An error whose impact is compensated so that the specification is
    satisfied despite the incorrect state; the propagation of the error is
    limited.
  - *Unmasked:* An error that has not been compensated and has the potential to
    propagate.
  - *Hard:* An error caused by a permanent fault.
  - *Soft:* An error caused by a transient or intermittent fault.

The following common terms map to these error classes:

  - *Latent error:* Any type of *undetected error*.
  - *Silent error:* Any type of *undetected error*.
  - :term:`Silent data corruption (SDC)<SDC>`: An *undetected unmasked
    hard* or *soft error*.

.. _intersect:arch:sos:logical:errors:failure:

Failure
-------

A failure occurs if an error reaches the service interface, resulting in
behavior that is inconsistent with the specification :cite:`engelmann22rdp-20`.
The following failure classes exist: *{undetected, detected} {permanent,
transient, intermittent} {complete, partial, Byzantine}*. These failure
classes have the following categories:

  - *Undetected:* A failure whose occurrence is not indicated.
  - *Detected::* A failure whose occurrence is indicated by a message or a
    signal.
  - *Permanent:* The presence of the failure is continuous in time.
  - *Transient:* The presence of the failure is temporary.
  - *Intermittent:* The failure is temporary but recurring in time.
  - *Complete:* A failure that causes service outage.
  - *Partial:* A failure causing a degraded service within the functional
    specification.
  - *Byzantine:* A failure causing an arbitrary deviation from the functional
    specification.

The following common terms map to these failure classes:

  - *Fail-stop:* An *undetected* or *detected failure* that completely halts
    operation, which often causes an irretrievable loss of state.
  - *Fail-safe:* A mode of operation that mitigates the consequences of
    a failure.

.. _intersect:arch:sos:logical:errors:detection:

Detection
---------

As a :ref:`intersect:arch:sos:logical:errors:fault` is an underlying flaw or
defect, a :ref:`intersect:arch:sos:logical:errors:fault` is not detectable
until it becomes an error or results in a failure. Detection entails the
discovery of an error or failure :cite:`engelmann22rdp-20`. It is typically
accomplished with the help of extra information that enables the verification
of correct state. Errors are detected by identifying the corresponding state
change. Failures are detected by identifying the corresponding transition to
an incorrect service. An error or a failure is indicated by a detector. This
detector itself can experience an error or failure as well, which may lead to
undetected errors or failures, or the false positive indications of error or
failure events. The following detection classes exist: *{true, false}
{positive, negative}*. These detection classes have the following categories:

  - *True:* A correct detection.
  - *False:* An incorrect detection.
  - *Positive:* An indication, such as a message or a signal.
  - *Negative:* No indication.

.. admonition:: Minimum requrement
   :name: intersect:arch:sos:logical:errors:detection:minimum

   At minimum, outages of :ref:`intersect:arch:sos:logical:systems` need to
   be detected.

.. admonition:: Optional requrement
   :name: intersect:arch:sos:logical:errors:detection:optional

   Optionally, the degradations of performance and functionality and erroneous
   behavior of :ref:`intersect:arch:sos:logical:systems` that do not amount to
   outages may be detected.

.. _intersect:arch:sos:logical:errors:containment:

Containment
-----------

Containment enables limiting the effects of an error or failure from
propagating :cite:`engelmann22rdp-20`. It is achieved by reasoning about the
modularity of subsystems and services that make up a system. In terms of
error or failure resilience of a system, a containment module is a unit that
fails independently of other units and it is also the unit of repair or
replacement.

.. admonition:: Optional requrement
   :name: intersect:arch:sos:logical:errors:containment:optional

   Optionally, errors and failures are contained as much as possible to prevent
   their propagation to other, previously unaffected
   :ref:`intersect:arch:sos:logical:systems`. This may involve automated
   :ref:`intersect:arch:sos:logical:errors:detection`  and
   :ref:`intersect:arch:sos:logical:errors:handling` within the
   :ref:`intersect:arch:sos:logical`, but also automated
   :ref:`intersect:arch:sos:operational:activities:monitoring` and
   :ref:`intersect:arch:sos:operational:activities:health` within the
   :ref:`intersect:arch:sos:operational`.

.. _intersect:arch:sos:logical:errors:masking:

Masking
-------

Masking may occur naturally when an erroneous state does not propagate, such
as when an erroneous value is multiplied with 0. Masking may also entail
recovery or mitigation, which ensures correct operation despite the occurrence
of an error. Masking is usually accomplished by providing additional redundant
state information in order to construct correct, or at least acceptably close,
values of the erroneous state. When masking involves the change of
incorrect state into correct state, it is called *error correction*.

.. _intersect:arch:sos:logical:errors:notification:

Notification
------------

Notifications only involve errors or failures, and they are always described in the
:ref:`intersect:arch:sos:logical` in the scope of a specific :ref:`task,
command, or action<intersect:arch:sos:logical:systems:ors:tasks>` and in the
context of a specific :ref:`system, subsystem, and
service<intersect:arch:sos:logical:systems>` in which an event occurs. For
example, if an action fails, then the command containing the action gets the
corresponding notification. To permit proper understaning of such events, the
following information is provided with a notification:

Type
   The type of the event.

Scope
   The
   :ref:`task, command, or action<intersect:arch:sos:logical:systems:ors:tasks>`
   in which an event occured.

Context
   The :ref:`system, subsystem, and
   service<intersect:arch:sos:logical:systems>` in which an event occured.

Details
   Detailed description and data of the event, such as error codes and/or
   textual description.

There is also the aspect of error and failure notification in the
:ref:`intersect:arch:sos:operational`, specifically with
:ref:`intersect:arch:sos:operational:activities:monitoring` and
:ref:`intersect:arch:sos:operational:activities:health`. Here, error and
failure detection are outside of the scope of a specific
:ref:`task, command, or action<intersect:arch:sos:logical:systems:ors:tasks>`.

.. admonition:: Minimum requrement
   :name: intersect:arch:sos:logical:errors:notification:minimum

   At minimum, the following event information must be provided with a
   notification: **Type**, **Scope**,and **Context**.

.. admonition:: Optional requrement
   :name: intersect:arch:sos:logical:errors:notification:optional

   Optionally, the following event information may be provided with a
   notification: **Details**.

.. _intersect:arch:sos:logical:errors:handling:

Handling
--------

Error and failure handling described in the :ref:`intersect:arch:sos:logical`
is also always in the scope of a specific :ref:`task, command, or
action<intersect:arch:sos:logical:systems:ors:tasks>` and a specific
:ref:`system, subsystem, and service<intersect:arch:sos:logical:systems>` in
which an event occurs. For example, if an action fails, then the command
containing the action performs a response. To permit proper responses to such
events, the following three general fault, error and failure handling
categories exist:

Ignore
   Although counterintuitive, ignoring a specific error or
   failure may be the right action to perform, such as when the event has no
   impact on the current :ref:`intersect:arch:sos:logical:systems:ors:tasks`.
   For example, the outcome of a :term:`campaign` may not be impacted if the
   task to shut down an instrument at the end of the :term:`campaign` fails.

Abort
   Aborting a :ref:`task, command, or
   action<intersect:arch:sos:logical:systems:ors:tasks>` or a :term:`campaign`
   may be prudent if the event has an impact and no other mitigation can handle
   it. An abort is a controlled fail-stop that may involve notifying other
   :ref:`intersect:arch:sos:logical:systems` to discontinue certain
   :ref:`intersect:arch:sos:logical:systems:ors:tasks` or
   :term:`campaigns<campaign>`.

User-defined response
   A user-defined response to an error or failure may enact specific
   containment and mitigation and is within the scope of
   :ref:`intersect:arch:sos:user:roles`. For example, an admin may define
   or a user may configure an automated fail-over procedure for a service.
   The admin knows the physical view and may use reserved resources as part of
   a general mitigation plan with transparent fail-over. In contrast, the
   user-defined response would request additional resources ahead of time and
   perform user-defined actions when required. Additionally, delegation may
   also be an appropriate user-defined response, such as when another task is
   better equipped to handle an error or failure. See
   :ref:`intersect:arch:sos:logical:resilience` for different
   :ref:`intersect:arch:sos:logical:resilience:mitigation` options for a
   user-defined response, including the use of
   :ref:`intersect:arch:sos:logical:resilience:patterns`.

There is also the aspect of error and failure handling in the
:ref:`intersect:arch:sos:operational`, specifically with
:ref:`intersect:arch:sos:operational:activities:monitoring` and
:ref:`intersect:arch:sos:operational:activities:health`. Here, error and
failure handling are outside of the scope of a specific
:ref:`task, command, or action<intersect:arch:sos:logical:systems:ors:tasks>`.

.. admonition:: Minimum requrement
   :name: intersect:arch:sos:logical:errors:handling:minimum

   At minimum, the following fault, error and failure handling categories must
   be provided: **Ignore** and **Abort**.

.. admonition:: Optional requrement
   :name: intersect:arch:sos:logical:errors:handling:optional

   Optionally, the following fault, error and failure handling categories may
   be provided: **User-defined response**.

