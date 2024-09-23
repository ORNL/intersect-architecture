.. _intersect:arch:sos:physical:howto:

Developing the Physical View
============================

The nature of the :term:`INTERSECT` architecture requires a highly
collaborative approach in order to fully realize broad system integration
across organizational boundaries. This collaboration must span multiple levels
of the organization and will touch on a broad range of topics including
specific procedural implementations, policy configurations and restrictions,
organizational processes, and clear identification of organizational roles
responsible for enabling cross organizational connections. The issues described
by this view will cross multiple levels of the organizational hierarchy, and
range from phyiscally configuring network connections between systems all the
way to reconciling policies and procedures that govern usage of organizational
resources.

Resource Taxonomy and Behavioral Model
--------------------------------------

Initial development of the physical view requires the development of a taxonomy
of the resources that make up the environment of the organization being
integrated with :term:`INTERSECT`. This taxonomy should describe the classes of
resources, what role they play within the environment, and the basic
capabilities that each resource provides to the environment. This taxonomy
allows a high level assessment of what components constituate a given system
and provides a high level overview of which components are relevant to
the :term:`INTERSECT` system architecture. From this high level view,
stakeholders can then decompose in an abstract way the various
:term:`INTERSECT` components and identify the relevant target system components
they will need to interface with. This taxonomy should capture a high level
description of the overall capability of the organization and environment to
identify areas of concern that will likely require additional efforts to
integrate with :term:`INTERSECT`.

Endpoint Identification and Description
---------------------------------------

Following from the high level taxonomy, a full description of the current and
future system environment needs to be collected. This description will include
concrete description of actual physical resources that will need to be directly
integrated with :term:`INTERSECT` as API endpoints. The granularity of these
descriptions should be at the interface boundary between :term:`INTERSECT` and
the target system. This description is separate from the taxonomy description
in that it identifies specific system components and instances that need to
interface with :term:`INTERSECT` APIs. As an example, in the case of a
computational cluster the taxonomy description would include the overall
capabilities of the cluster itself (e.g. storage and compute capacity), while
the endpoint description would include the cluster's head/login nodes and/or
scheduler interface. The identification of the endpoints should be complete,
i.e., it should fully capture all of the actual endpoints that are both
currently active in the system as well as future endpoints that are planned for
but not yet activated.

The purpose of this description is to provide a complete list of system
components to be integrated into the system, and allows the identification of
the responsible stakeholders that will need to be engaged with during the
integration process. 

Network Topology and Connectivity
---------------------------------

After the :term:`INTERSECT` endpoints have been identified, the next step is to
collect information about the network topology of the target system. This
topology should include both physical and functional connectivity as well as
the performance capabilities of the underlying network infrastructure. Physical
connecticity refers to the actual links (copper wires, optical fibers, or radio
transmitters) that physically connect the :term:`INTERSECT` endpoints. The
topology does not need to include network interconnects that are internal to a
system components, but should include any external connections to other system
components. Using the compute cluster example again, the network topology would
not need to include an internal Infiniband network with no external routes
(this should be included as part of the taxonomy description) but should
include the ethernet network that allows users to login to the head node.
Functional connectivity refers to the ability of the network to support actual
functional connections between system components. Functional connectity is
different from physical connectivity due to the presence of routing rules, vlan
configurations, or firewalls that interpose the physical connections between
components. The purpose of separating these views of the network is to
accurately identify the stakeholders to be engaged in order to alter or expand
the current network topology. For instance, adding a routing rule will often
require working with a different set of stakeholders than physically running
new cables between systems. The description of the functional connectivity
should include a full description of the components that enforce functional
constraints, including fully identifying any firewalls, routers, or other
middleboxes that might need to be reconfigured. These network resources may or
may not be then added to the list of :term:`INTERSECT` endpoints depending on
whether they are reconfigurable or otherwise capable of interfacing with the
:term:`INTERSECT` architecture. Finally, the network topology should include
the performance capabilities of the underlying network components. This is
necessary in order to determine whther the available network resources are
sufficient to meet the requirements of any potential :term:`INTERSECT`
workloads.

Security Policies and Access Control
------------------------------------

Once the physical and network resources have been catalogued, the next step is
to collect the security policies that govern how those resources may be
accessed and how they can be used. These policies will take many forms, and do
not necessarily need to be specified in exact detail. The important part is to
identify the various points of constraint in the system and identify the
relevant stakeholders that are responsible for managing those constraints.
While not always possible, the most effective way of describing policies is to
identify one or more constraints that are directly related, map those to the
one or more mechanisms that enforce that policy, and then map the mechanims to
the responsible stakeholders in the organization. This mapping allows the
determination of any policy constraints that will impact the operation of
:term:`INTERSECT` and provide the set of stakeholders that need to be engaged
with in order to manage any policy conflicts.

Access control is a major component of the security policies of a given system,
but should also be considered separatly in the physical view. A description of
the access control mechanisms should include the actual authentication
procedures as well as a definition of the user set that is allowed to access
the system components.

It is important to note that security policies are likely to not be fully
global policies that uniformly apply to all resources in the system, but
instead are often granular with specific constraints targetting specific
components. In the :term:`INTERSECT` physical view, it is important to
differentiate the two and accurately identify the policies that apply to a
particular :term:`INTERSECT` endpoint.

Administrative Processes
------------------------

Up to this point the physical view has focused on the actual physical
infrastructure of the target environment, however it is important to also
understand how that infrastructure is managed and administered by the
organization. This requires understanding the processes that control who is
able to make administrative decisions and how those decisions are made. This is
a critical component because the :term:`INTERSECT` architecture will most
likely require administrative changes and allowances to enable it to
effectively integrate with the environment. Depending on the organization in
question these processes may be more or less well defined, but should
nonetheless be identified as such in order to understand not only how to
achieve integration with :term:`INTERSECT` but also how to maintain that
integration in the future. Similar to the previous aspects of the physical
view, this description does not need to be exhaustive but should fully
capture the processes that are required for managing the :term:`INTERSECT`
endpoints and connecting them to the wider :term:`INTERSECT` architecture.

The purpose of this part of the description is to identify where the boundary
at which :term:`INTERSECT` stops interfacing with the physical environment and
where it starts interfacing with the human level organizational systems. This
separation indicates at which point :term:`INTERSECT` integration needs to
shift from software level interfaces to inter-organizational discussions and
coordination in order to determine how to map the target organizations
processes to the :term:`INTERSECT` requirements. There are a number of avenues
for this, including formalizing existing processes in such a way that they can
be automated or at least automatically initiated, deploying federated policy
models allowing the target organization to delegate administrative processes to
other :term:`INTERSECT` enabled organizations, or altering the actual technical
integration approach to accomodate restrictions resulting from existing
administrative requirements.

As an example of a basic administrative process that must be interfaced with is
the user account and management processes employed by the organization. These
processes govern how user accounts are created, how they are granted access to
the various ogranizational resources, how access permisions are approved and
authorized, and who maintains oversight of the accounts once created. For most
:term:`INTERSECT` enabled systems it can be expected that user account
managment will be a fundamental challenge. Furthermore, while federation based
approaches are being explored it is likely that target organizations will lack
either the capability or desire to adopt such an approach.

Accounting Practices
--------------------

Finally, the physical view needs to include a description of the accounting
practices employed by the target organization. While this is similar to the
description of the administrative processes, it is often the case that
accounting procedures and models are based on more overarching and stringent
processes that the organization itself has less control over. Accounting
practices determine how usage of a given resource is monitored and accounted
for and often, but not always, ties that usage to a cost model that governs
how a given user is charged to use the system. Interfacing with these systems
requires that :term:`INTERSECT` include awareness of both the cost structure
and accounting methods employed by the target environment. This is necessary to
ensure that the target organization is able to correctly charge for the usage
of its resources as well as providing transparency of the cost model to
:term:`INTERSECT` users and components.
