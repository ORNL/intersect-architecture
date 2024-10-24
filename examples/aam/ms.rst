.. _intersect:arch:examples:aam:ms:

Microservices Architecture
--------------------------

As described in the :term:`SoS` :ref:`intersect:arch:examples:aam:sos:logical` for the :term:`AM` ecosystem, there are five infrastructure systems that encompass the capabilities needed by the scientific workflow.

- **Additive Manufacturing System:** The 3D metal printer with its controller
  computer at the :term:`MDF`.

- **Experiment Steering Analysis System:** The :term:`OLCF` :term:`ACE` testbed
  computer used for the thermomechanical simulation.

- **Spallation Neutron Source System:** The :term:`SNS` with its neutron beam
  experiment and corresponding neutron diffraction sensors.

- **Design of Experiments Analysis System:** The :term:`SNS` analysis cluster
  computer used for the analysis of the neutron diffraction data.

- **Experiment Planning System:** The domain expert computer used for experiment
  planning.

Together, these systems provide microservices for 
:ref:`system management <intersect:arch:ms:classification:infrastructure:system>`, 
:ref:`data management <intersect:arch:ms:classification:infrastructure:data_info>`,
:ref:`experiment control <intersect:arch:ms:classification:experiment:control>`, and
:ref:`computing <intersect:arch:ms:classification:infrastructure:compute>`.

As described in :ref:`intersect:arch:ms:classification:infrastructure:system`, each
:term:`AM` system listed above is expected to provide a *System Management Service*. 
This service manages a catalog of information about the system and its components including 
associated resources, services, and subsystems via the 
:ref:`System Information Catalog capability <intersect:arch:ms:classification:infrastructure:capabilities:system_info_catalog>`.
The management service also enables control and status monitoring of services and subsystems
via the :ref:`System Manager capability <intersect:arch:ms:classification:infrastructure:capabilities:system_manager>`.

Each of the :term:`AM` systems listed above requires local data storage and thus should
provide a *Data Management Service* as described in 
:ref:`intersect:arch:ms:classification:infrastructure:data_info:data_mgmt`. This service gives local
and remote services access to the local data storage via the
:ref:`Data Storage capability <intersect:arch:ms:classification:infrastructure:capabilities:data_storage>`
and enables remote data transfers to and from the local storage via the
:ref:`Data Transfer Endpoint capability <intersect:arch:ms:classification:infrastructure:capabilities:data_transfer_endpoint>`.
In addition, to facilitate streaming of experiment observational data from the
**Additive Manufacturing System** to the **Experiment Steering Analysis System**, the data management
services on these systems should provide the
:ref:`Data Stream capability <intersect:arch:ms:classification:infrastructure:capabilities:data_stream>`
that extends the functionality of the Data Storage capability.

For experiment control, the **Additive Manufacturing System** and **Spallation Neutron Source System** 
should each provide an *Instrument Service*.
In the **Additive Manufacturing System**, this service enables control of the 3D metal printer and observation
of thermocouple and IR camera data by interfacing with the :term:`ROS` software :cite:`ROS-software` and exposing the
:ref:`Instrument Controller capability <intersect:arch:ms:classification:experiment:capabilities:instrument_control>`.
The ROS Instrument Controller supports three actions: (1) start a print job, (2) stop a print job, and (3) update printer control parameters.
In addition, it creates data products for the files corresponding to sampled thermocouple and IR camera observations and adds them to data streams for consumption by the :term:`ADAMANTINE` thermomechanical simulation running on the **Experiment Steering Analysis System**.
The Instrument Service for the **Spallation Neutron Source System** interfaces with the 
:term:`SNS` VULCAN Engineering Materials Diffractometer :cite:`SNS:VULCAN` control software and 
also exposes the Instrument Controller capability.

The **Experiment Steering Analysis System** and **Design of Experiments Analysis System** provide computing
resources for online and post-mortem analysis of the experimental data. Each system is 
expected to support the execution of a pre-configured application on the associated
local computational resource via the 
:ref:`Application Execution capability <intersect:arch:ms:classification:infrastructure:capabilities:compute_application>`.
This capability in turn depends on a local *Compute Service* providing either the
:ref:`Compute Allocation capability <intersect:arch:ms:classification:infrastructure:capabilities:compute_allocation>`
or the
:ref:`Compute Queue capability <intersect:arch:ms:classification:infrastructure:capabilities:compute_queue>`.

.. list-table:: Microservice Capabilities for Infrastructure System Services
   :name: intersect:arch:examples:aam:ms:capabilities
   :align: center

   * - **Logical \\ Infrastructure System**
     - **Additive Manufacturing System**
     - **Experiment Steering Analysis System**
     - **Spallation Neutron Source System**
     - **Design of Experiments Analysis System**
     - **Experiment Planning System**
   * - :ref:`intersect:arch:sos:logical:systems:ims`
     - - System Management Service

         * System Manager
         * System Information Catalog

       - Instrument Service

         - Instrument Controller

     - - System Management Service

         * System Manager
         * System Information Catalog

       - Steering Analysis Service

         * Application Execution

       - Compute Service

         * Compute Allocation or Compute Queue

     - - System Management Service

         * System Manager
         * System Information Catalog

       - Instrument Service

         * Instrument Controller

     - - System Management Service

         * System Manager
         * System Information Catalog

       - Design Analysis Service

         * Application Execution

       - Compute Service

         * Compute Allocation or Compute Queue

     - - System Management Service

         * System Manager
         * System Information Catalog

   * - :ref:`intersect:arch:sos:logical:systems:dms`
     - - Data Management Service

         * Data Storage
         * Data Stream
         * Data Transfer Endpoint

     - - Data Management Service

         * Data Storage
         * Data Stream
         * Data Transfer Endpoint

     - - Data Management Service

         * Data Storage
         * Data Transfer Endpoint

     - - Data Management Service

         * Data Storage
         * Data Transfer Endpoint

     - - Data Management Service

         * Data Storage
         * Data Transfer Endpoint

