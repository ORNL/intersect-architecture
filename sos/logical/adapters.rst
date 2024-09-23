.. _intersect:arch:sos:logical:adapters:

Adapters for External Resources and Services
============================================

The :term:`INTERSECT` architecture offers a way to construct a federated
ecosystem by connecting scientific instruments, computational resources and
data resources to enable science breakthroughs with autonomous experiments,
self-driving laboratories, smart manufacturing, and :term:`AI`-driven design,
discovery and evaluation. It uses a novel :ref:`intersect:arch:concept` that
relies on a :ref:`intersect:arch:sos`. The federated ecosystem, i.e., the
overall system in the :ref:`intersect:arch:sos`, is decomposed into many
smaller and easier to design systems that coordinate activities with each
other using standardized communication and programming interfaces.

Adapter
   The :ref:`intersect:arch:sos:logical:systems` in the
   :ref:`intersect:arch:sos` of the :term:`INTERSECT` federated ecosystem
   utilize and integrate external resources or services using adapters. An
   adapter is a service that bridges the communication gap between
   :term:`INTERSECT` :ref:`intersect:arch:sos:logical:systems` and external
   resources and services by exposing the external capabilities to the federated
   ecosystem using the standardized :term:`INTERSECT` communication and
   programming interfaces. An adapter needs to offer certain basic services of
   the :ref:`intersect:arch:sos:logical:systems:ims`, in addition to any other
   services. While adapter implementation solutions may be reused for the same
   or similar resource and service types, each resource and service requires
   its own adapter instance. An instance may be used simultaneously in
   different contexts, or different instances may use the same resource or
   service, each instance with its own context.

Instrument Adapter
   The most prominent instance of an adapter is an instrument adapter. It
   exposes the capabilities of an instrument to the :term:`INTERSECT`
   :ref:`intersect:arch:sos`. This essentially makes the instrument an
   :term:`INTERSECT` infrastructure system and embeds the instrument into the
   :term:`INTERSECT` :ref:`intersect:arch:sos` with certain logical systems and
   corresponding subsystems and services.

Other Resource or Service Adapters
   Many other adapters exist, such as for compute and data storage resources, or
   for services that offer needed capabilities. These adapters integrate these
   resources and services into the :term:`INTERSECT` federated ecosystem as
   infrastructure systems and expose their capabilities.

.. admonition:: Minimum requrement
   :name: intersect:arch:sos:logical:adapters:minimum

   At minimum, adapters are used to integrate external resources and services
   with the :term:`INTERSECT` federated ecosystem to prevent the proliferation
   of proprietary architecture features, such as incompatible services and
   :term:`API`\s, to other :ref:`intersect:arch:sos:logical:systems`. External
   (non-:term:`INTERSECT`) architecture features must remain outside the
   :term:`INTERSECT` federated ecosystem boundary and be made compatible at
   that boundary.

.. admonition:: Optional requrement
   :name: intersect:arch:sos:logical:adapters:optional

   Optionally, :term:`INTERSECT` :ref:`intersect:arch:sos:logical:systems` are
   adopted when integrating external resources and services, removing the need
   for adapters and making them fully compatible with the :term:`INTERSECT`
   federated ecosystem and expanding the ecosystem's boundary.
