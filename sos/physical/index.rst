.. _intersect:arch:sos:physical:

Physical View
-------------

The physical view provides a mapping of the architecture onto the physical
infrastructure. This view of the environment enables system designers to
determine how to decompose and place the various system components onto the
resources that make up the overall system. This view provides the
architecture with an understanding of the attributes of the environment and
allows the system to configure its services based on the constraints and
capabilities of the underlying system components. The elements in this view
consist of physical resources that provide services to the architecture as
well as the network topology that connects them together. Types of physical
resources include computational resources, data storage services, data
sources, and network connections.

The physical view enables the enumeration of constraints placed on the
overall system. These constraints can consist of capacity constraints (e.g.,
available storage capacity or computational elements), network constraints
(e.g., available bandwidth between elements in the architecture), policy
constraints (e.g., firewall rules or access control policies), and
availability constraints (e.g., ability to allocate resources within
necessary time frames). These constraints limit the configuration space of
the architecture, and enumerate the necessary interfaces and processes
required to configure the physical infrastructure to support the operations
of the overall system.

Some of the items associated with the physical view are:

- Descriptions, definitions of physical systems
- Descriptions of networks and connectivity of systems
- Descriptions of organizational boundaries

Some of the items **not** associated with the physical view are:

- Specifications for instruments, resources, etc.
- Specifications for experiments
- Specifications for data
- Specifications for the logical view

This view should be read by resource managers/owners, system administrators,
network engineers, and facility space managers. The phyiscal view is inherently
site specific and provides a framework for describing the organization and
technical challenges that must be addressed to deploy the architecture described
in this document. The contents of this section will provide insight to
stakholders to describe general challanges and concerns that must be addressed,
as well as outline processes for fully developing the physical view for
potential deployment sites.

The current physical view offers a guide on
:ref:`intersect:arch:sos:physical:howto` for indivual realizations of the
:term:`INTERSECT` ecosystem parts, i.e., participations of indivual
institutions in the federated ecosystem.

.. toctree::
   :maxdepth: 2
   :name: intersect:arch:sos:physical:toc
   :caption: Components of the Physical View

   howto
