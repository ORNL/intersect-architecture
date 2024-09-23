.. _intersect:arch:sos:operational:activities:health:

Health and Diagnostics
======================

Service-level health monitoring and diagnostics facility to help identify
issues among services in the ecosystem.  The focus here is on Service-level
diagnostics.


.. _intersect:arch:sos:operational:activities:health:descr:

Description
-----------

The identification of anomalous behavior ensures proper resource
utilization and flags system health threats. The INTERSECT software stack
needs to provide support for tracking overall ecosystem health
and identify patterns between systems participating in the federation. Given
the complexity of a federated ecosystem, diagnostics should be as automated
as possible to reduce operational burdens.

The service-level diagnostics mechanisms are likely to have different
degrees of data access due to authorization restrictions (e.g., institution
and federation) and a lack of visibility/understanding of operational
details impacting a service.  This is similar to the administrative
monitoring scopes mentioned in :doc:`Service Monitoring </sos/operational/activities/monitoring>`,
but more data is required for diagnostics.
While the diversity of the participating systems is hidden by uniform
service interfaces, the ability to pinpoint a root-cause for a flagged
issue may likely require intimate knowledge of the underlying
implementation. The ability to create markers to help provide details
back to site administrators to aid in diagnostics is important, such as
with active diagnostic hooks or simple flagging/reporting methods.
Logging of standard change events may be a useful way to provide hints
for problem diagnosis, as well as gathering of historical patterns.

Automated diagnostic procedures could be performed in regular intervals
with set time bounds (e.g., hourly for 30 seconds) or on an as needed
basis, such as triggered by suspicious observed activity. These
diagnostic procedures could even be performed in a pair- or group-wise
fashion among systems using "pilot jobs". The diagnostic data gathered
is stored to keep a history and to enable the detection of normal and
abnormal operation patterns. For example, the
`perfSONAR <https://www.perfsonar.net>`_ work by ESNet provides
detailed traffic information for the wide-area network. The historical
monitoring data is used to identify trends and highlight potential
problems to aid diagnostics in ESNet.

In microservice-based architectures the services are usually
"stateless", with stateful data being saved outside the service to
simplify service management (e.g., fast/easy rejuvenation of a stateless
service). This explicit separation of application state can aid
diagnostics by providing input for data analytics routines to establish
trends or identify problems in service behavior.


.. _intersect:arch:sos:operational:activities:health:example:

Example
-------

The diagnostic mechanisms in the INTERSECT ecosystem require contextual
details to help reason about the data gathered from services (e.g.,
service monitoring, data movement, and job scheduling). A service
optionally defines a health probe interface to permit gathering data, on
demand or periodically, to help asses health. Additionally, an
associated interpreter of the results could make intelligent use of such
health data. It may be via the service itself, or part of more holistic
diagnostic services.


The identification of patterns will require persistent storage of past
measurements to highlight anomalous behavior.  This data can grow large over
times so there should also be some way to archive, prune or otherwise
constrain the data in a configurable manner.  For example, it may be useful
to have support for aggregated data for time periods, e.g., round-robin
database, to have fixed size health monitoring at different granularities
for historical time periods.

.. note::
   The probes or extensible data processing methods might be additional
   micro-services to tailor the data for a given use case. This could
   lead to data coupling and restrictions on generality, while offering
   more advanced capabilities to perform diagnostics or other operations
   using information about INTERSECT resources.

.. note::
   The Health and Diagnostic of Services may require specific input on
   what data is required to satisfy distributed diagnostic/profiling
   needs. This can be piggybacked on things like reporting of transfer
   times on file moves to gather performance data indirectly, or via
   periodically scheduled measurements between select endpoints in the
   federation. While related, these capabilities are more focused on the
   profiling and analytics and less about the generic monitoring of
   services.


.. _intersect:arch:sos:operational:activities:health:related:

Related
-------

  * :ref:`intersect:arch:sos:operational:activities:monitoring`


