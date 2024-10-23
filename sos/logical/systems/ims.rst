.. _intersect:arch:sos:logical:systems:ims:

Infrastructure Management System
--------------------------------

Infrastructure systems are tangible and supported by physical hardware. For
example, an instrument control computer and a virtual machine running on a
physical computer are individual infrastructure systems. The
:term:`Infrastructure Management System (IMS)<IMS>` is responsible for
managing infrastructure systems. Its services provide the core capabilities
needed to permit infrastructure systems to participate in the :term:`INTERSECT`
federated ecosystem and to provide services that are part of the other logical
systems: :ref:`intersect:arch:sos:logical:systems:ums`,
:ref:`intersect:arch:sos:logical:systems:ors`,
:ref:`intersect:arch:sos:logical:systems:dms`,
:ref:`intersect:arch:sos:logical:systems:cms`, and
:ref:`intersect:arch:sos:logical:systems:cs`. The :term:`IMS` has the following
services and microservice capabilities (mapping the :ref:`intersect:arch:sos`
to the :ref:`intersect:arch:ms`):

- Domain Registrar Service

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:system_registrar`: *Create and lookup the :term:`UUID` for a system, subsystem, service, and resource*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:general_controller`: *Read controller status information*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:general_availability`: *Read availability status information*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:general_param_config`: *Read and update service configuration paramaters*

- System Management Service

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:system_manager`: *Register a service with a system or subsystem; enable/disable and aggregate status information for systems, subsystems, services, and resources*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:system_info_catalog`: *Create a system, subsystem, service, or resource and read system, subsystem, service, or resource :term:`UUID`\ s, names, and other information*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:data_er_catalog`: *Maintains names, descriptions, properties, and labels for systems, subsystems, services, and resources*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:general_controller`: *Read controller status information*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:general_availability`: *Read availability status information*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:general_param_config`: *Read and update service configuration paramaters*

- Compute Service

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:compute_allocation`: *Allocate immediate access to compute resources for a specified period of time*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:compute_application`: *Execute a packaged application on a computing resource*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:compute_container`: *Execute a containerized application on a computing resource*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:compute_host`: *Executes an arbitrary host command on a computing resource*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:compute_queue`: *Run compute jobs and monitor job and queue status*
  
  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:compute_reservation`: *Reserve dedicated compute resources access*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:general_controller`: *Read controller status information*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:general_availability`: *Read availability status information*

  - :ref:`intersect:arch:ms:classification:infrastructure:capabilities:general_param_config`: *Read and update service configuration paramaters*

.. admonition:: Minimum requrement
   :name: intersect:arch:sos:logical:systems:ims:minimum

   At minimum, there must be one and only one :term:`IMS` in an
   :term:`INTERSECT` federated ecosystem, as the :term:`IMS` spans over all
   infrastructure systems within the same :term:`INTERSECT` federated
   ecosystem. Individual services of the :term:`IMS` may be distributed
   across infrastructure systems as needed, where some services may only exist
   once.

.. admonition:: Optional requrement
   :name: intersect:arch:sos:logical:systems:ims:optional

   Optionally, multiple :term:`INTERSECT` federated ecosystems may exist that
   operate either completely indepenently from each other or collaborate with
   each other, but each :term:`INTERSECT` federated ecosystem has only one (its
   own) :term:`IMS`.

.. toctree::
   :maxdepth: 1
   :name: intersect:arch:sos:logical:systems:ims:toc
   :caption: Components of the Infrastructure Management System

   ims/naming

.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Old Content - Needs to be reworked!
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   The :term:`Infrastructure Management System (IMS)<IMS>` is responsible for
   managing infrastructure systems.
   
   .. admonition:: Example
   
      The :term:`IMS` on a container orchestration infrastructure system consists
      of a resource allocation service and a launcher service. In this scenario,
      the resource allocation service can deploy containers. The launcher service
      can start services in the container. Containers deployed might hook into
      the launcher service, to run a task in a container.
   
      .. figure:: ims/containers.png
         :name: intersect:arch:sos:logical:systems:ims:containers
         :align: center
         :width: 500
   
         Relationship of different systems to provide a container as a compute capability
   
   .. admonition:: Example
   
      The :term:`IMS` on a container orchestration infrastructure system consists
      of a resource allocation service and a launcher service. In this scenario,
      the resource allocation service allocates compute resources using the batch
      system (by submitting a batch job). It may provide functionality to create
      reservations. The launcher service becomes available once the requested
      resources are available.
   
      .. figure:: ims/batch.png
         :name: intersect:arch:sos:logical:systems:ims:batch
         :align: center
         :width: 500
   
         Relationship of different systems to provide a batch job as a compute capability
   
   Node Management Service:
   
   The Node Management Service is responsible to announce the capabilities of a
   node. Additionally, it is responsible to ensure that the node state satisfies
   the node's configuration. Furthermore, it announces the node's status to
   other interested agents.
   
   Launcher Service:
   
   The Launcher Service is responsible of starting up instances of
   :ref:`intersect:arch:sos:logical:systems:ors:tasks`. The service listens for 'Launch'
   events and starts an instance of the required entity. The following types of
   launchers exits:
   
   Launch Task
      Launches a task.
   
   Launch Service
      Launches a service.
   
   Launch Infrastructure System
      Launches the services of an infrastructure system
   
   .. figure:: ims/launcher.png
      :name: intersect:arch:sos:logical:systems:ims:launcher
      :align: center
      :width: 800
   
      General capabilities of the Launcher Service
   
   Resource Allocation Service:
   
   The Resource Allocation Service requests and allocates resources. Resources can
   come from batch scheduled supercomputers, on- or off-premises Cloud computing
   systems, or any other mechanism that can dynamically allocate resources (i.e.,
   function as a service). There are multiple ways to allocate these resources:
   Submit a job and:
   
   - Start an agent/service
   - Start a user defined task
   - Start a predefined workstep
   
   Instrument Controller Service:
   
   Figure :ref:`intersect:arch:sos:logical:systems:ims:instrument_adapter` depicts
   common capabilities for the instrument adapter, which include:
   
   - Provide instrument description
      - Capabilities
      - Configuration options
      - Metadata
      - Data formats
   - Provide status information
   - Respond to request
   
   .. figure:: ./ims/instrument_adapter.png
      :name: intersect:arch:sos:logical:systems:ims:instrument_adapter
      :align: center
      :width: 800
   
      Instrument adapter capabilities
   
   Provide Instrument Description:
   
   Capabilities for instruments are specialized and highly dependent on the type
   of instrument. To support a rich set of instruments, the set of capabilities
   for each instrument need to be advertised. To facilitate this, an instrument
   has to be described. The instrument description has to contain the description
   of the parameters in some form (e.g., parameter name, value range, etc.).
   Capabilities must either be well defined, follow an ontology, or a schema to
   describe the capabilities and the corresponding commands to execute them.
   
   - Command arguments
      - Name and description of the command
      - Mandatory and optional parameters
      - Type of the parameter (i.e. bool, int, string, etc.)
   - Configuration parameters
      - Name and description of the configuration parameters
      - Mandatory and optional parameters
      - Default values
      - Type of the parameter (i.e. bool, int, string, etc.)
   - Metadata of the instrument
      - Name and description of the metadata fields
      - Mandatory and optional metadata
      - Default values
      - Type of the metadata field (i.e. bool, int, string, etc.)
   - Data Asset format
   
   .. note::
   
      The schema can be versioned and make certain descriptions optional for some
      version.
   
   .. admonition:: Example
   
      An example of an instrument description using json.
   
      .. code-block::
   
         @startjson
         {
             "intersect.stem.microscope": {
                 "hasController": "intersect.stem.microscope.controller",
                 "hasConfigurationArguments": []
             },
             "intersect.stem.microscope.argument.1": {
                 "description": "The Description",
                 "type": "Some type"
             },
             "intersect.stem.microscope.argument.2": {
                 "description": "The Description",
                 "type": "Some type"
   
             },
             "intersect.stem.microscope.controller": {
                 "hasCapability": [],
                 "hasConfigurationArguments": [],
                 "hasEndpoint":[]
             },
             "intersect.stem.activity": {
                 "type": "intersect.compute.execute.script.bash"
             },
             "intersect.stem.microscope.capability.configure": {},
             "intersect.stem.microscope.capability.startMeasurement": {},
             "intersect.stem.microscope.controller.argument.1": {},
             "intersect.stem.microscope.controller.argument.2": {},
             "intersect.stem.microscope.controller.endpoint.1": {
                 "type": "MQTT",
                 "ip": "10.10.10.10"
             },
             "intersect.stem.microscope.controller.endpoint.2": {
                 "type": "http",
                 "ip": "10.10.10.10"
             },
             "intersect.campaign.1": {
                 "hasActivity": []
             },
             "intersect.campaign.1.activity.1": {
                 "type": "intersect.stem.microscope.capability.startMeasurement",
                 "taskConfiguration" : {}
             },
             "intersect.campaign.1.task.2": {
                 "type": "intersect.stem.task",
                 "taskConfiguration" : {}
             }
         }
         @endjson

   Authentication and Authorization:

   Provides  authentication and authorization capabilities.

   Options:

   - Container
   
     - The System/Service/Capability is executed in a containerized environment

   - Native

    - The System/Service/Capability is executed natively

    - Native executable in a system process, as a system service

    - Native executable as a script (bash, python, etc.)
