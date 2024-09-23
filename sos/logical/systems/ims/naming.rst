.. _intersect:arch:sos:logical:systems:ims:naming:

Naming and Addressing
=====================

Within the :term:`SoS`, systems, subsystems, and services are named and
addressed in a hierarchical fashion, from systems to subsytems to services, to
properly identify which entity is part of another entity and addressable as
such. In this context, naming and addressing may refer to a communication
channel or endpoint. In addition, microservice capabilities provided by
services as part of the :ref:`intersect:arch:ms` are named and addressed in a
similar hierarchical fashion, from systems to subsytems to services to
capabilities. Names are unique within each level of the hierarchy, such that
there are unique names for all systems, all subsytems within the same system,
services within the same subsystem, and all capabilities within the same
service. Addresses can be described as :term:`URN`\ s, where one or more
subsystems are optional:

- :term:`URN`: ``intersect:system:[sub-system:|...]service:capability``

Extra care is required when translating such :term:`URN`\ s to :term:`URI`\ s
and :term:`URL`\ s due to the variable number of subsystems. Delimiters between
systems, services and capabilities should be the same and preferably different
from the delimiters between systems and subsystems. The variable number of
subsystems permits systems to be front-ends for other systems.

The naming and addressing scheme is currently not defining specific system and
subsystem names. In the future, a ``system`` name may include specific names
for the organization, an optional facility within the organization, and a system
within the facility/organization:

- ``system[.facility].organization``

In the future, a ``sub-system`` name may be one of the following logical
systems:

- ``ims`` or ``infrastructure`` for the
  :ref:`intersect:arch:sos:logical:systems:ims`
- ``ums`` or ``user``           for the
  :ref:`intersect:arch:sos:logical:systems:ums`
- ``ors`` or ``orchestration``  for the
  :ref:`intersect:arch:sos:logical:systems:ors`
- ``dms`` or ``data``           for the
  :ref:`intersect:arch:sos:logical:systems:dms`
- ``cms`` or ``campaign``       for the
  :ref:`intersect:arch:sos:logical:systems:cms`
- ``cs``  or ``communication``  for the
  :ref:`intersect:arch:sos:logical:systems:cs`

.. admonition:: Optional Requirement
   :name: intersect:arch:sos:logical:systems:ims:naming:naming:optional

   Optionally, the given :term:`URN`\ -based naming and addressing scheme may
   be supported. It is expected to become a minimum requirement.

.. note::

   This is work in progress, see also
   https://code.ornl.gov/intersect/sdk/python-sdk/sdk/-/issues/19.
