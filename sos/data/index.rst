.. _intersect:arch:sos:data:

Data View
---------

The data view of a system of systems is a representation of the system from
the perspective of data needs, and the data framework that needs to exist to
support the :term:`INTERSECT` architecture. The data view is a specification
for all data aspects of :term:`INTERSECT` as a whole system, and shall include
the conceptual, logical, and physical data models. The conceptual data model
provides the high-level data concepts and their relationships that are
important to :term:`INTERSECT`’s operations that meet its intended purpose. The
logical data model bridges the conceptual and physical data models and
introduces the data structure for needed components. The physical data model is
the actual data schema and specifications for :term:`INTERSECT` services and
applications.

Some of the items associated with the data view are:

- Overall data flow within the :term:`INTERSECT` system.
- Descriptions and definitions of data components.
- Specification of the data messages, in XML Schema format, for
  command/control, data movement of bulk and streaming data.
- Database schema for :term:`INTERSECT`’s operational data.

Some of the items NOT associated with the data view are:

- Specifications for scientific data (aka, the payload).
- Specifications for instruments, resources, etc.
- Experiment specifications.

This view should be read by software developers, database developers, software
engineers, network engineers, project managers, and others who will need to
understand the data necessary for an :term:`INTERSECT` installation to operate
and how that data is defined and exchanged.

.. toctree::
   :maxdepth: 2
   :name: intersect:arch:sos:data:toc
   :caption: Components of the Data View

   erdm/index
   messages
   model

   
