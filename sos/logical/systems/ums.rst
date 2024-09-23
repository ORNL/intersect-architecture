.. _intersect:arch:sos:logical:systems:ums:

User Management System
----------------------

The :term:`INTERSECT` federated ecosystem has persons interactining with it in
different :ref:`intersect:arch:sos:user:roles`. It also has systems,
subsystems, and services acting on behalf of persons in their
:ref:`intersect:arch:sos:user:roles`. The :term:`User Management System
(UMS)<UMS>` is responsible for managing all aspects of such users, including
delegations of user responsibilities to systems, subsystems, and services. The
:term:`UMS` has the following services and microservice capabilities (mapping
the :ref:`intersect:arch:sos` to the :ref:`intersect:arch:ms`):

- User Accounts Administration Service

  - User Accounts Administration Capability: *Create, read, update, and delete user accounts*

  - User Authorization Administration Capability: *Read and update user authorizations*

- User Registration Service

  - User Registration Capability: *Request user account creation*

- User Profile Service

  - User Profile Capability: *Read and update user account profile information*

- User Projects Service

  - User Projects Capability: *Create, read, update, and delete user project information*

- User Authentication Service

  - User Authentication Capability: *Authenticate a user*

- User Authorization Service

  - User Authorization Capability: *Verify a user's authorization*

.. admonition:: Minimum requrement
   :name: intersect:arch:sos:logical:systems:ums:minimum

   At minimum, there must be one and only one :term:`UMS` in an
   :term:`INTERSECT` federated ecosystem, as the :term:`UMS` spans over the
   infrastructure systems within the same :term:`INTERSECT` federated
   ecosystem.  Individual services of the :term:`UMS` may be distributed
   across infrastructure systems as needed, where some services may only exist
   once.
   
   At minimum, the :term:`UMS` reflects and enforces the defined
   :ref:`intersect:arch:sos:user:roles` of the :ref:`intersect:arch:sos:user`.

.. admonition:: Optional requrement
   :name: intersect:arch:sos:logical:systems:ums:optional

   Optionally, multiple :term:`INTERSECT` federated ecosystems may exist that
   operate either completely indepenently from each other or collaborate with
   each other, but each :term:`INTERSECT` federated ecosystem has only one (its
   own) :term:`UMS`.

   Optionally, the :term:`UMS` may additionally support user roles for external
   resources and services through the use of
   :ref:`intersect:arch:sos:logical:adapters`.
