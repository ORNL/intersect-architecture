.. _`intersect:arch:ms:capability:infrastructure:system_mgmt:sys_info_catalog`:

Capability - System Management :: System Information Catalog
------------------------------------------------------------

:Description:
   Provides subsystem, service, and resource information for a single
   parent system. Maintains system relationships as shown in
   :numref:`fig:intersect:arch:ms:class:infrastructure:system_er_model`.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends: None
   - Requires:

      + :ref:`intersect:arch:ms:capability:infrastructure:data_info:er_catalog`

:Interactions:
   - Asynchronous: None
   - Command: ``CreateSubsystem()``, ``CreateSystemResource()``, ``CreateSystemService()``
   - Request-Reply: ``GetSubsystemIds()``, ``GetSubsystemInformation()``,
     ``GetSubsystemNames()``, ``GetSystemResourceIds()``,
     ``GetSystemResourceInformation()``, ``GetSystemResourceNames()``,
     ``GetSystemServiceIds()``, ``GetSystemServiceInformation()``,
     ``GetSystemServiceNames()``, ``GetSystemServicesByCapability()``,
     ``GetSystemServicesByResource()``

- *Command* - ``CreateSystemResource()``

      + Purpose: Creates a new resource of the parent system. Successful
        creation will result in the creation of a ``SystemResource``
        entity with the given information and a relationship to the new
        entity with the parent system.
        :numref:`fig:intersect:arch:ms:sequences:systems:registration:resource`
        provides an example orchestration sequence demonstrating the
        use of this method.

      + Command Data:

         *  ``resourceDescription`` (``String``) : A user-friendly
            description of the resource.

         *  ``resourceId`` (``UUID``) : The UUID of the resource.

         *  ``resourceName`` (``String``) : A user-friendly name for the
            resource.

         *  ``resourceLabels`` (``List<String>``) : *[Optional]* A list of
            ``String`` labels for the resource.

         *  ``resourceProperties`` (``List< KeyVal<String> >``) :
            *[Optional]* A list of key-value ``String`` pairs for the
            resource’s properties.

- *Command* - ``CreateSystemService()``

      + Purpose: Creates a new service of the parent system or an existing
        subsystem. Successful creation will result in the creation of a
        ``SystemService`` entity with the given information and
        relationships to the new entity with the parent system or
        subsystem, provided capabilities, and any associated resources.
        :numref:`fig:intersect:arch:ms:sequences:systems:registration:service`
        provides an example orchestration sequence demonstrating the
        use of this method.

      + Command Data:

         *  ``serviceDescription`` (``String``) : A user-friendly
            description of the service.

         *  ``serviceId`` (``UUID``) : The UUID of the service.

         *  ``serviceName`` (``String``) : A user-friendly name for the
            service.

         *  ``serviceCapabilities`` (``List<String>``) : A list of names
            for the microservice capabilities provided by the service.

         *  ``subsystemId`` (``UUID``) : *[Optional]* The UUID of the
            subsystem in which this service exists.

         *  ``serviceLabels`` (``List<String>``) : *[Optional]* A list of
            ``String`` labels for the service.

         *  ``serviceProperties`` (``List< KeyVal<String> >``) :
            *[Optional]* A list of key-value ``String`` pairs for the
            service’s properties.

         *  ``serviceResources`` (``List<UUID>``) : *[Optional]* A list of
            system resources used by the service.

- *Command* - ``CreateSubsystem()``

      + Purpose: Creates a new subsystem of the parent system. Successful
        creation will result in the creation of a ``System`` entity
        with the given information and relationships to the new entity
        with the parent system and any associated resources.

      + Command Data:

         *  ``subsystemDescription`` (``String``) : A user-friendly
            description of the subsystem.

         *  ``subsystemId`` (``UUID``) : The UUID of the subsystem.

         *  ``subsystemName`` (``String``) : The name of the subsystem.

         *  ``subsystemLabels`` (``List<String>``) : *[Optional]* A list
            of ``String`` labels for the entity.

         *  ``subsystemProperties`` (``List< KeyVal<String> >``) :
            *[Optional]* A list of key-value ``String`` pairs for the
            entity’s properties.

         *  ``subsystemResources`` (``List<UUID>``) : *[Optional]* A list
            of system resources associated with the subsystem.

- *Request-Reply* - ``GetSubsystemInformation()``

      + Purpose: Get the full set of system catalog information for the given
        ``subsystemId`` or ``subsystemName``.

      + Request Data:

         *  ``subsystemId`` (``UUID``) : The UUID of the subsystem.

         *  ``subsystemName`` (``String``) : The name of the subsystem.

      + Reply Data:

         *  ``subsystemInfo`` (``CatalogEntityInformation``) : The
            catalog information for the subsystem.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the lookup failed.

- *Request-Reply* - ``GetSubsystemIds()``

      + Purpose: Get a list of subsystem UUIDs for the parent system.

      + Reply Data:

         *  ``subsystemIds`` (``List<UUID>``) : The list of subsystem
            UUIDs.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the lookup failed.

- *Request-Reply* - ``GetSubsystemNames()``

      + Purpose: Get a list of subsystem names for the parent system.

      + Reply Data:

         *  ``subsystemNames`` (``List<String>``) : The list of
            subsystem names.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the lookup failed.

- *Request-Reply* - ``GetSystemResourceInformation()``

      + Purpose: Get the full set of system catalog information for the given
        ``resourceId`` or ``resourceName``.

      + Request Data:

         *  ``resourceId`` (``UUID``) : The UUID of the resource.

         *  ``resourceName`` (``String``) : The name of the resource.

      + Reply Data:

         *  ``resourceInfo`` (``CatalogEntityInformation``) : The
            catalog information for the resource.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the lookup failed.

- *Request-Reply* - ``GetSystemResourceIds()``

      + Purpose: Get a list of resource UUIDs for the parent system or given
        ``subsystemName``.

      + Request Data:

         *  ``subsystemName`` (``String``) : *[Optional]* The name of the
            subsystem.

      + Reply Data:

         *  ``resourceIds`` (``List<UUID>``) : The list of system
            resource UUIDs.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the lookup failed.

- *Request-Reply* - ``GetSystemResourceNames()``

      + Purpose: Get a list of resource names for the parent system or given
        ``subsystemName``.

      + Request Data:

         *  ``subsystemName`` (``String``) : *[Optional]* The name of the
            subsystem.

      + Reply Data:

         *  ``resourceNames`` (``List<String>``) : The list of system
            resource names.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the lookup failed.

- *Request-Reply* - ``GetSystemServiceInformation()``

      + Purpose: Get the full set of system catalog information for the given
        ``serviceId`` or ``serviceName``.

      + Request Data:

         *  ``serviceId`` (``UUID``) : The UUID of the service.

         *  ``serviceName`` (``String``) : The name of the service.

      + Reply Data:

         *  ``serviceInfo`` (``CatalogEntityInformation``) : The catalog
            information for the service.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the lookup failed.

- *Request-Reply* - ``GetSystemServiceIds()``

      + Purpose: Get a list of service UUIDs for the parent system or the given
        ``subsystemName``.

      + Request Data:

         *  ``subsystemName`` (``String``) : *[Optional]* The name of the
            subsystem.

      + Reply Data:

         *  ``serviceIds`` (``List<UUID>``) : The list of system service
            UUIDs.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the lookup failed.

- *Request-Reply* - ``GetSystemServiceNames()``

      + Purpose: Get a list of service names for the parent system or the given
        ``subsystemName``.

      + Request Data:

         *  ``subsystemName`` (``String``) : *[Optional]* The name of the
            subsystem.

      + Reply Data:

         *  ``serviceNames`` (``List<String>``) : The list of system
            service names.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the lookup failed.

- *Request-Reply* - ``GetSystemServicesByCapability()``

      + Purpose: Get a list of UUIDs for services in the parent system or given
        ``subsystemName`` that provide the microservice capability with
        given ``capabilityName``.

      + Request Data:

         *  ``capabilityName`` (``String``) : The name of the desired
            capability.

         *  ``subsystemName`` (``String``) : *[Optional]* The name of the
            subsystem.

      + Reply Data:

         *  ``serviceIds`` (``List<UUID>``) : The list of matching
            system service UUIDs.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the lookup failed.

- *Request-Reply* - ``GetSystemServicesByResource()``

      + Purpose: Get a list of UUIDs for services in the parent system or given
        ``subsystemName`` that use the resource with given ``resourceName``.

      + Request Data:

         *  ``resourceName`` (``String``) : The name of the resource.

         *  ``subsystemName`` (``String``) : *[Optional]* The name of the
            subsystem.

      + Reply Data:

         *  ``serviceIds`` (``List<UUID>``) : The list of matching
            system service UUIDs.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the lookup failed.
