.. _intersect:arch:sos:

System-of-Systems Architecture
==============================


The :term:`system-of-systems (SoS)<SoS>` architecture approach designs a highly
complex system by decomposing it into many smaller and easier to design systems
:cite:`manthorpe96emerging,pei00system`. These smaller systems interact with
each other to provide a unique capability that none of the individual systems
can accomplish on its own :cite:`iso21839`. A :term:`SoS` has five key
characteristics :cite:`maier98architecting`:

- Operational independence of systems
- Managerial independence of systems
- Geographical distribution
- Emergent behavior
- Evolutionary development

Systems are individually developed and evolved, as the architecture of a
:term:`SoS` is the system interfaces :cite:`rechtin90systems,maier09art`. A
recent example is the :term:`Defense Advanced Research Projects Agency's
(DARPA's')<DARPA>` :term:`System of Systems Integration Technology and
Experimentation (SoSITE)<SoSITE>` :cite:`darpa22sosite` project, called
:term:`System-of-systems Technology Integration Tool Chain for Heterogeneous
Electronic Systems (STITCHES)<STITCHES>`
:cite:`fortunato22stitches,darpa22creating`.

The :term:`INTERSECT` :term:`SoS` architecture consists of different
architectural views similar to other :term:`SoS` standards and efforts, such
as the :term:`U.S. Department of Defense Architecture Framework (DoDAF)<DoDAF>`
:cite:`DoDAF2:2010`, the :term:`United Kingdom Ministry of Defence Architecture
Framework (MoDAF)<MoDAF>` :cite:`MoDAF:2010` the 4+1 Architectural View Model
:cite:`Kruchten:1995` and the IEEE 42010 Standard on systems and software
engineering :cite:`ieee:iso42010`. The :term:`INTERSECT` :term:`SoS`
architecture views are based on a hybrid model of the :term:`DoDAF` and the
4+1 view model:

- The :ref:`intersect:arch:sos:logical` addresses the logical composition and
  interactions between the different systems in the overall system. By
  decomposing the overall system into logical systems, subsystems, services,
  capabilities and activities, it simplifies the overall design and makes it
  easier to architect the interactions between the different components.

- The :ref:`intersect:arch:sos:operational` describes the tasks, activities,
  procedures, information exchanges/flows from the perspective of the
  real-world operations stakeholders, i.e., systems administrators,
  maintenance, facility engineers, system managers, instrument scientists. The
  operational view captures restrictions that may be necessary to reflect
  facility constraints and procedures. The intent of the view is to capture
  the elements needed for the operation and usage of the distributed resources
  in the :term:`SoS`.

- The :ref:`intersect:arch:sos:user` is a representation of the :term:`SoS`
  that illustrates different human interactions. It does not include
  interactions between systems themselves. This view highlights the human
  facing functionality required from the overall system. A person's view
  changes depending on their role, which is specific to a context.

- The :ref:`intersect:arch:sos:data` is a representation of the system from
  the perspective of data needs and the data framework that needs to exist to
  support :term:`SoS`. The data view is a specification for all data aspects
  of the system as a whole, and includes the conceptual, logical, and physical
  data models.

- The :ref:`intersect:arch:sos:physical` provides a mapping of the :term:`SoS`
  architecture onto the physical infrastructure. This view enables system
  designers to determine how to decompose and place the various system
  components onto the resources that make up the overall system. It provides
  the understanding of the attributes of the overall system, and allows the
  it to be configured based on the constraints and capabilities of the
  underlying components.

- The :ref:`intersect:arch:sos:standards` defines the standards supported by
  the :term:`SoS` and its corresponding views and architecture elements that
  are impacted by each standard. Such standards are versioned and include
  messaging standards of the :term:`SoS` and external standards, such as
  instrument-specific standards. The standards view defines the set of rules
  governing the arrangement, interaction, and interdependence of systems.

The :term:`INTERSECT` :term:`SoS` architecture addresses different groups, both
within and outside of an organization, such as architects, developers,
administrators, and end users. The view model enables various stakeholders to
establish the impact of the architecture from their own perspective. For each
stakeholder role, individual stakeholder concerns can be addressed by the views
of the :term:`INTERSECT` :term:`SoS` architecture
(see :numref:`intersect:arch:sos:stakeholders`).

.. table:: Stakeholder roles and the :term:`INTERSECT` :term:`SoS` architecture views that address them.
   :name: intersect:arch:sos:stakeholders
   :align: center

   +------------------+-------------+-----------------+----------+----------+--------------+---------------+
   | **Role/View**    | **Logical** | **Operational** | **User** | **Data** | **Physical** | **Standards** |
   +==================+=============+=================+==========+==========+==============+===============+
   | Application      | X           |                 | X        | X        |              | X             |
   | software         |             |                 |          |          |              |               |
   | developers       |             |                 |          |          |              |               |
   +------------------+-------------+-----------------+----------+----------+--------------+---------------+
   | Infrastructure   |             | X               |          | X        | X            | X             |
   | software         |             |                 |          |          |              |               |
   | developers       |             |                 |          |          |              |               |
   +------------------+-------------+-----------------+----------+----------+--------------+---------------+
   | End users        | X           |                 | X        |          |              |               |
   +------------------+-------------+-----------------+----------+----------+--------------+---------------+
   | Security         |             | X               |          | X        | X            |               |
   | Engineers        |             |                 |          |          |              |               |
   +------------------+-------------+-----------------+----------+----------+--------------+---------------+
   | Communications   |             |                 |          | X        |              | X             |
   | engineers        |             |                 |          |          |              |               |
   +------------------+-------------+-----------------+----------+----------+--------------+---------------+
   | System-of-system | X           | X               |          | X        | X            | X             |
   | engineers        |             |                 |          |          |              |               |
   +------------------+-------------+-----------------+----------+----------+--------------+---------------+
   | Chief            | X           |                 | X        | X        |              | X             |
   | engineers        |             |                 |          |          |              |               |
   | /scientists      |             |                 |          |          |              |               |
   +------------------+-------------+-----------------+----------+----------+--------------+---------------+
   | Lead System      |             | X               |          | X        | X            |               |
   | Integrator       |             |                 |          |          |              |               |
   +------------------+-------------+-----------------+----------+----------+--------------+---------------+
   | System           | X           | X               | X        | X        |              | X             |
   | Integration and  |             |                 |          |          |              |               |
   | test engineers   |             |                 |          |          |              |               |
   +------------------+-------------+-----------------+----------+----------+--------------+---------------+
   | External test    | X           | X               | X        | X        | X            |               |
   | agencies         |             |                 |          |          |              |               |
   +------------------+-------------+-----------------+----------+----------+--------------+---------------+
   | Operational      |             | X               | X        | X        |              |               |
   | system managers  |             |                 |          |          |              |               |
   +------------------+-------------+-----------------+----------+----------+--------------+---------------+
   | Maintainers      |             | X               | X        |          |              |               |
   +------------------+-------------+-----------------+----------+----------+--------------+---------------+
   | Representatives  | X           | X               |          | X        |              | X             |
   | of               |             |                 |          |          |              |               |
   | standardization  |             |                 |          |          |              |               |
   | activities       |             |                 |          |          |              |               |
   +------------------+-------------+-----------------+----------+----------+--------------+---------------+

.. toctree::
   :maxdepth: 2
   :name: intersect:arch:sos:toc
   :caption: Architectural Views

   logical/index
   operational/index
   user/index
   data/index
   physical/index
   standards/index


