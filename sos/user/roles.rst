.. _intersect:arch:sos:user:roles:

User Roles
==========

A user roles is based on a person type, a category of persons defined by the
role or roles they share that are relevant to the architecture. User roles are
contextual, typically limited to the scope of resources. For example, an owner
would have elevated privileges only for the resources they own; they would be
considered a regular user in the context of any resource they do not own.
:numref:`intersect:arch:sos:user:roles:persontypes` defines the person
types in the :term:`INTERSECT` architecture.

.. list-table:: Person type roles and descriptions.
   :name: intersect:arch:sos:user:roles:persontypes
   :header-rows: 1
   :align: center
   :class: tight-table

   * - Person Type
     - Description
     - Example
   * - User
     - Using the system (not responsible for administration)
     - A User leverages the SDK on multiple Resources to compose and run a
       scientific campaign.
   * - Maintainer/Operator
     - Maintains one or more resources; different view of system (i.e., in
       contrast to User)
     - An Operator installs and configures the SDK on one or more Resources in
       addition to setting up (e.g. - loading chemicals into vials) and tearing
       down (e.g. purging tubes of all chemicals) the setup for each campaign
   * - Administrator
     - Maintains one or more systems; complete view of "their" system (their
       jurisdiction /domain/realm/area). Limited to a given jurisdiction (i.e.,
       their administrative domain)
     - An Administrator grants/approves new Resources, where the SDK is
       installed, to be added to the INTERSECT ecosystem
   * - Owner
     - Individual fiscally responsible for a resource; Vested interest;
       Possibly approver for a resource
     - An Owner purchases Resource(s) and delegates maintenance and operations
       to Operators. Owners could be Group Leaders to an Associate Lab
       Director
   * - Provider
     - Manufacturer of a Logical (e.g. INTERSECT services) or Physical Resource
       (Computing, Observational, Data, Networking). Provider creates the
       Resource that the Operator maintains.
     - Examples include manufacturer of a scientific instrument, NVIDIA for an
       edge compute Resource, INTERSECT SecDevOps is provider of core INTERSECT
       SDK

.. admonition:: Minimum requrement
   :name: intersect:arch:sos:user:roles:minimum

   At minimum, the defined user roles are reflected and enforced in all parts
   of the :term:`INTERSECT` federated ecosystem through the
   :ref:`intersect:arch:sos:logical:systems:ums`.

.. admonition:: Optional requrement
   :name: intersect:arch:sos:user:roles:optional

   Optionally, user roles of external resources and services are reflected and
   enforced through the use of :ref:`intersect:arch:sos:logical:adapters` in
   the :ref:`intersect:arch:sos:logical:systems:ums`

.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Old Content
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Do these desctiptions belong here?
   Or do they belong in the :ref:`intersect:arch:sos:logical` or :ref:`intersect:arch:sos:physical`?
   Or do they bemong in :ref:`terms`
   In any case, these terms need to be consistent.

   The DoDAF meta-model defines concepts involving performer. The DoDAF
   definition of performer is any entity – human, automated, or any
   aggregation of human and/or automated – that performs an activity and
   provides a capability.

   Organization

      A specific real-world assemblage of people and other resources organized
      for an on-going purpose.

   System

      A functionally, physically, and/or behaviorally related group of
      regularly interacting or interdependent elements.

   Person Type

      A category of persons defined by the role or roles they share that are
      relevant to an architecture.

   Service

     A mechanism to enable access to a set of one or more capabilities, where
     the access is provided using a prescribed interface and is exercised
     consistent with constraints and policies as specified by the service
     description. The mechanism is a Performer. The capabilities accessed are
     Resources – Information, Data, Materiel, Performers, and Geo-political
     Extents.

   Capability

      The ability to achieve a Desired Effect under specified (performance)
      standards and conditions through combinations of ways and means
      (activities and resources) to perform a set of activities."

   Activity
   
     Work, not specific to a single organization, system or individual that
     transforms inputs (Resources) into outputs (Resources) or changes their
     state.
