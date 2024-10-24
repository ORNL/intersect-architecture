.. _intersect:arch:sos:logical:systems:cs:

Communication System
--------------------

Systems, subsystems, and services within the :term:`INTERSECT` federated
ecosystem need to be able to communicate with each other using standardized
ommunication and programming interfaces. The :term:`Communication System
(CS)<CS>` provides the means for such communication using messages. It
generally supports the sending and receiving of messages within the
:term:`INTERSECT` federated ecosystem without exposing this functionality as
a service itself, as it is a built-in functionality of a client interacting
with a service and its microservice(s). A service and its microservice(s)
may be a client. The :term:`CS` has the following built-in functionalities:

- Point-to-point Messaging

  - Send: *Send a message to a service (and its microservice)*

  - Receive: *Receive a message from a service (and its microservice)*

- Publish/Subscribe Messaging

  - Message Subscribtion: *Subscribe to a certain class of messages*

  - Message Publication: *Publish a message*

The :term:`CS` has also the following services and microservice
capabilities (mapping the :ref:`intersect:arch:sos` to the
:ref:`intersect:arch:ms`):

- Federation Messaging Service

  - Message Routing Capability: *Route messages between different participants
    in the federation of systems*

The :term:`CS` supports the :ref:`intersect:arch:ms:interaction`.

.. admonition:: Minimum requrement
   :name: intersect:arch:sos:logical:systems:cs:minimum

   At minimum, there must be one and only one :term:`CS` in an
   :term:`INTERSECT` federated ecosystem, as the :term:`CS` spans over all
   infrastructure systems within the same :term:`INTERSECT` federated
   ecosystem.  Individual services of the :term:`CS` may be distributed
   across infrastructure systems as needed, where some services may only exist
   once.

   At minimum, the :term:`CS` supports the
   :ref:`intersect:arch:ms:interaction`.

.. admonition:: Optional requrement
   :name: intersect:arch:sos:logical:systems:cs:optional

   Optionally, multiple :term:`INTERSECT` federated ecosystems may exist that
   operate either completely indepenently from each other or collaborate with
   each other, but each :term:`INTERSECT` federated ecosystem has only one (its
   own) :term:`CS`.
