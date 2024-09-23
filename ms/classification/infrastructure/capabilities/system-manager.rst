.. _`intersect:arch:ms:capability:infrastructure:system_mgmt:sys_manager`:

Capability - System Management :: System Manager
------------------------------------------------

:Description:
   Provides interfaces for aggregate control and status of all
   subsystems, resources, and services for a single parent system. Uses
   the *Availability Status* capability of each system service.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends: None
   - Requires:

      + :ref:`intersect:arch:ms:capability:infrastructure:system_mgmt:sys_info_catalog`
      + :ref:`intersect:arch:ms:capability:infrastructure:utility:avail_status`

:Interactions:
   - Asynchronous: ``SystemStatusChange``
   - Command: ``EnableResource()``, ``EnableService()``,
     ``EnableSystem()``, ``EnableSubsystem()``,
     ``DisableResource()``, ``DisableService()``,
     ``DisableSubsystem()``, ``DisableSystem()``,
   - Request-Reply: ``GetResourceStatus()``, ``GetServiceStatus()``,
     ``GetSubsystmeStatus()``, ``GetSystemStatus()``, ``RegisterService()``
   
- *Asynchronous Status* - ``SystemStatusChange``

      + Purpose: Notification of changes to system status.

      + Event Data:

         *  ``systemId`` (``UUID``) : The UUID of the system.

         *  ``currentStatus`` (``String``) : The current system status.

         *  ``changeDescription`` (``String``) : A description of the
            last status change.

         *  ``changeTime`` (``Timestamp``) : A timestamp for the last
            status change.

         *  ``priorStatus`` (``String``) : *[Optional]* The prior system
            status.

         *  ``subsystemId`` (``UUID``) : *[Optional]* The UUID of the
            subsystem, if applicable.

         *  ``resourceId`` (``UUID``) : *[Optional]* The UUID of the
            resource, if applicable.

         *  ``serviceId`` (``UUID``) : *[Optional]* The UUID of the
            service, if applicable.

- *Command* - ``EnableResource()``

      + Purpose: Enable the target resource identified by ``resourceId`` or
        ``resourceName`` in the parent system. Any services or
        subsystems associated with the resource will have their status
        updated accordingly.

      + Command Data:

         *  ``resourceId`` (``UUID``) : *[Optional]* The UUID of the
            resource.

         *  ``resourceName`` (``String``) : *[Optional]* The name of the
            resource.

         *  ``statusNote`` (``String``) : *[Optional]* An optional short
            description to use when updating the resource status.

- *Command* - ``DisableResource()``

      + Purpose: Disable the target resource identified by ``resourceId`` or
        ``resourceName`` in the parent system. Any services or
        subsystems associated with the resource will have their status
        updated accordingly.

      + Command Data:

         *  ``resourceId`` (``UUID``) : *[Optional]* The UUID of the
            resource.

         *  ``resourceName`` (``String``) : *[Optional]* The name of the
            resource.

         *  ``statusNote`` (``String``) : *[Optional]* An optional short
            description to use when updating the resource status.

- *Command* - ``EnableService()``

      + Purpose: Enable the target service identified by ``serviceId`` or
        ``serviceName`` in the parent system. If the service is
        associated with a subsystem, its status will be updated
        accordingly.

      + Command Data:

         *  ``serviceId`` (``UUID``) : *[Optional]* The UUID of the
            service.

         *  ``serviceName`` (``String``) : *[Optional]* The name of the
            service.

         *  ``statusNote`` (``String``) : *[Optional]* An optional short
            description to use when updating the service status.

- *Command* - ``DisableService()``

      + Purpose: Disable the target service identified by ``serviceId`` or
        ``serviceName`` in the parent system. If the service is
        associated with a subsystem, its status will be updated
        accordingly.

      + Command Data:

         *  ``serviceId`` (``UUID``) : *[Optional]* The UUID of the
            service.

         *  ``serviceName`` (``String``) : *[Optional]* The name of the
            service.

         *  ``statusNote`` (``String``) : *[Optional]* An optional short
            description to use when updating the service status.

- *Command* - ``EnableSubsystem()``

      + Purpose: Enable all services in the target subsystem identified by
        ``subsystemId`` or ``subsystemName``.

      + Command Data:

         *  ``subsystemId`` (``UUID``) : *[Optional]* The UUID of the
            subsystem.

         *  ``subsystemName`` (``String``) : *[Optional]* The name of the
            subsystem.

         *  ``statusNote`` (``String``) : *[Optional]* An optional short
            description to use when updating the status of the subsystem
            services.

- *Command* - ``DisableSubsystem()``

      + Purpose: Disable all services in the target subsystem identified by
        ``subsystemId`` or ``subsystemName``.

      + Command Data:

         *  ``subsystemId`` (``UUID``) : *[Optional]* The UUID of the
            subsystem.

         *  ``subsystemName`` (``String``) : *[Optional]* The name of the
            subsystem.

         *  ``statusNote`` (``String``) : *[Optional]* An optional short
            description to use when updating the status of the subsystem
            services.

- *Command* - ``EnableSystem()``

      + Purpose: Enable all subsystems, services, and resources in the parent system.

      + Command Data:

         *  ``statusNote`` (``String``) : *[Optional]* An optional short
            description to use when updating the system status.

- *Command* - ``DisableSystem()``

      + Purpose: Disable all subsystems, services, and resources in the parent system.

      + Command Data:

         *  ``statusNote`` (``String``) : *[Optional]* An optional short
            description to use when updating the system status.

- *Request-Reply* - ``RegisterService()``

      + Purpose: Registers a new service with the target system and an optional subsystem.
        :numref:`fig:intersect:arch:ms:sequences:systems:registration:service`
        provides an example orchestration sequence demonstrating the
        use of this method.

      + Request Data:

         *  ``serviceName`` (``String``) : A user-friendly name for the
            service.

         *  ``serviceDescription`` (``String``) : A user-friendly
            description of the service.

         *  ``serviceCapabilities`` (``List<String>``) : A list of names
            for the microservice capabilities provided by the service.

         *  ``subsystemId`` (``UUID``) : *[Optional]* The UUID of the
            subsystem in which this service exists.

         *  ``serviceResources`` (``List<UUID>``) : *[Optional]* A list of
            system resources used by the service.

         *  ``serviceLabels`` (``List<String>``) : *[Optional]* A list of
            ``String`` labels for the service.

         *  ``serviceProperties`` (``List< KeyVal<String> >``) :
            *[Optional]* A list of key-value ``String`` pairs for the
            service’s properties.

      + Reply Data:

         *  ``serviceUUID`` (``String``) : The UUID assigned to the
            service by the system.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the service could not be registered.

- *Request-Reply* - ``GetResourceStatus()``

      + Purpose: Get the current status of the target resource identified by
        ``resourceId`` or ``resourceLabelsceName`` in the parent system.

      + Request Data:

         *  ``resourceId`` (``UUID``) : *[Optional]* The UUID of the
            resource.

         *  ``resourceName`` (``String``) : *[Optional]* The name of the
            resource.

      + Reply Data:

         *  ``resourceStatus`` (``String``) : The current status of the
            resource.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the resource status could not be determined.

- *Request-Reply* - ``GetServiceStatus()``

      + Purpose: Get the current status of the target service identified by
        ``serviceId`` or ``serviceName`` in the parent system.

      + Request Data:

         *  ``serviceId`` (``UUID``) : *[Optional]* The UUID of the
            service.

         *  ``serviceName`` (``String``) : *[Optional]* The name of the
            service.

      + Reply Data:

         *  ``serviceStatus`` (``String``) : The current status of the
            service.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the service status could not be determined.

- *Request-Reply* - ``GetSubsystemStatus()``

      + Purpose: Gather and aggregate the status of all services in the
        subsystem identified by ``subsystemId`` or ``subsystemName``.

      + Request Data:

         *  ``subsystemId`` (``UUID``) : *[Optional]* The UUID of the
            subsystem.

         *  ``subsystemName`` (``String``) : *[Optional]* The name of the
            subsystem.

      + Reply Data:

         *  ``subsystemStatus`` (``String``) : The aggregate status of
            the subsystem.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the subsystem status could not be determined.

- *Request-Reply* - ``GetSystemStatus()``

      + Purpose: Gather and aggregate the status of all services and subsystems
        in the parent system.

      + Reply Data:

         *  ``systemStatus`` (``String``) : The aggregate status of the
            subsystem.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the aggregate status could not be determined.
