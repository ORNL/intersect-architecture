.. _intersect:arch:ms:classification:infrastructure:capabilities:system_registrar:

Capability - System Management :: Systems Registrar
---------------------------------------------------

:Description:
   Provides system, subsystem, service, and resource registration and
   name-based lookup of assigned UUIDs.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends:

      + :ref:`intersect:arch:ms:classification:infrastructure:capabilities:general_uuid_gen`

   - Requires: None

:Interactions:
   - Asynchronous: ``SubsystemRegistration``, ``SystemRegistration``,
     ``SystemResourceRegistration``, ``SystemServiceRegistration``
   - Command: None
   - Request-Reply: ``GetSystemUUID()``, ``GetSubsystemUUID()``,
     ``GetSystemResourceUUID()``, ``GetSystemServiceUUID()``,
     ``RegisterSubsystem()``, ``RegisterSystem()``,
     ``RegisterSystemResource()``, ``RegisterSystemService()``

- *Asynchronous Status* - ``SystemRegistration``

      + Purpose: Notification of new system registrations.

      + Event Data:

         *  ``systemId`` (``UUID``) : The assigned UUID for the system.

         *  ``systemName`` (``String``) : The name of the system.

         *  ``organizationName`` (``String``) : The name of the
            organization that owns the system.

         *  ``facilityName`` (``String``) : *[Optional]* The name of the
            user facility or sub-organization that manages operation of
            the system.

- *Asynchronous Status* - ``SubsystemRegistration``

      + Purpose: Notification of new subsystem registrations.

      + Event Data:

         *  ``systemId`` (``UUID``) : The parent system UUID.

         *  ``subsystemId`` (``String``) : The assigned UUID of the
            subsystem.

         *  ``subsystemName`` (``String``) : The name of the subsystem.

- *Asynchronous Status* - ``SystemResourceRegistration``

      + Purpose: Notification of new system resource registrations.

      + Event Data:

         *  ``systemId`` (``UUID``) : The parent system UUID.

         *  ``resourceId`` (``UUID``) : The assigned system resource
            UUID.

         *  ``resourceName`` (``String``) : The name of the system
            resource.

- *Asynchronous Status* - ``SystemServiceRegistration``

      + Purpose: Notification of new system service registrations.

      + Event Data:

         *  ``systemId`` (``UUID``) : The parent system UUID.

         *  ``subsystemId`` (``UUID``) : The subsystem UUID, or an
            ``INVALID_UUID`` value (e.g., all zeroes) if the service is
            not associated to a subsystem.

         *  ``serviceId`` (``UUID``) : The assigned system service UUID.

         *  ``serviceName`` (``String``) : The name of the system
            service.

- *Request-Reply* - ``RegisterSystem()``

      + Purpose: Register a new system with given ``systemName``,
        ``organizationName``, and optional ``facilityName``. Successful
        registration will trigger generation of the
        ``SystemRegistration`` event.
        :numref:`intersect:arch:ms:classification:infrastructure:system:registration:system`
        provides an example orchestration sequence demonstrating the
        use of this method.

      + Request Data:

         *  ``systemName`` (``String``) : The name of the system.

         *  ``organizationName`` (``String``) : The name of the
            organization that owns the system.

         *  ``facilityName`` (``String``) : *[Optional]* The name of the
            user facility or sub-organization that manages operation of
            the system.

         *  ``systemSecret`` (``Bytes``) : *[Optional]* A system secret
            for use in verifying registrations of system components.

         *  ``requestedId`` (``UUID``) : *[Optional]* The requested UUID
            for the system.

      + Reply Data:

         *  ``systemId`` (``UUID``) : The assigned UUID for the system,
            or an ``INVALID_UUID`` value (e.g., all zeroes) if the
            registration failed.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the system could not be successfully
            registered.

- *Request-Reply* - ``GetSystemUUID()``

      + Purpose: Get the assigned UUID for the given ``systemName``,
        ``organizationName``, and optional ``facilityName``.

      + Request Data:

         *  ``systemName`` (``String``) : The name of the system.

         *  ``organizationName`` (``String``) : The name of the
            organization that owns the system.

         *  ``facilityName`` (``String``) : *[Optional]* The name of the
            user facility or sub-organization that manages operation of
            the system.

      + Reply Data:

         *  ``systemId`` (``UUID``) : The assigned UUID for the system,
            or an ``INVALID_UUID`` value (e.g., all zeroes) if the
            lookup failed.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the system lookup failed.

- *Request-Reply* - ``RegisterSubsystem()``

      + Purpose: Register a new subsystem of the given parent system. Successful
        registration will trigger generation of the
        ``SubsystemRegistration`` event.

      + Request Data:

         *  ``subsystemName`` (``String``) : The name of the subsystem.

         *  ``systemId`` (``UUID``) : The UUID of the parent system.

         *  ``systemSecret`` (``Bytes``) : *[Optional]* Secret key for the
            system for use in verifying registrations of system
            components.

         *  ``requestedId`` (``UUID``) : *[Optional]* The requested UUID
            for the subsystem.

      + Reply Data:

         *  ``subsystemId`` (``UUID``) : The assigned UUID for the
            subsystem, or an ``INVALID_UUID`` value (e.g., all zeroes)
            if the registration failed.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the subsystem could not be successfully
            registered.

- *Request-Reply* - ``GetSubsystemUUID()``

      + Purpose: Get the assigned UUID for the given ``subsystemName``.

      + Request Data:

         *  ``systemId`` (``UUID``) : The UUID of the parent system.

         *  ``subsystemName`` (``String``) : The name of the subsystem.

      + Reply Data:

         *  ``subsystemId`` (``UUID``) : The assigned UUID for the
            subsystem, or an ``INVALID_UUID`` value (e.g., all zeroes)
            if the lookup failed.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the subsystem lookup failed.

- *Request-Reply* - ``RegisterSystemResource()``

      + Purpose: Register a new resource within the given parent system.
        Successful registration will trigger generation of the
        ``SystemResourceRegistration`` event.
        :numref:`intersect:arch:ms:classification:infrastructure:system:registration:resource`
        provides an example orchestration sequence demonstrating the
        use of this method.

      + Request Data:

         *  ``resourceName`` (``String``) : The name of the system
            resource.

         *  ``systemId`` (``UUID``) : The UUID of the parent system.

         *  ``systemSecret`` (``Bytes``) : *[Optional]* Secret key for the
            system for use in verifying registrations of system
            components.

         *  ``requestedId`` (``UUID``) : *[Optional]* The requested UUID
            for the resource.

      + Reply Data:

         *  ``resourceId`` (``UUID``) : The assigned UUID for the system
            resource, or an ``INVALID_UUID`` value (e.g., all zeroes) if
            the registration failed.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the system resource could not be successfully
            registered.

- *Request-Reply* - ``GetSystemResourceUUID()``

      + Purpose: Get the assigned UUID for the given ``resourceName``,.

      + Request Data:

         *  ``systemId`` (``UUID``) : The UUID of the parent system.

         *  ``resourceName`` (``String``) : The name of the system
            resource.

      + Reply Data:

         *  ``resourceId`` (``UUID``) : The assigned UUID for the system
            resource, or an ``INVALID_UUID`` value (e.g., all zeroes) if
            the lookup failed.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the system resource lookup failed.

- *Request-Reply* - ``RegisterSystemService()``

      + Purpose: Register a new service within the given parent system, with
        optional association to a given subsystem. Successful
        registration will trigger generation of the
        ``SystemServiceRegistration`` event.
        :numref:`intersect:arch:ms:classification:infrastructure:system:registration:service`
        provides an example orchestration sequence demonstrating the
        use of this method.

      + Request Data:

         *  ``serviceName`` (``String``) : The name of the system
            service (e.g., ``<hostname>.<pid>``).

         *  ``systemId`` (``UUID``) : The UUID of the parent system.

         *  ``subsystemId`` (``UUID``) : *[Optional]* The UUID of the
            associated subsystem.

         *  ``systemSecret`` (``Bytes``) : *[Optional]* Secret key for the
            system for use in verifying registrations of system
            components.

         *  ``requestedId`` (``UUID``) : *[Optional]* The requested UUID
            for the service.

      + Reply Data:

         *  ``serviceId`` (``UUID``) : The assigned UUID for the system
            service, or an ``INVALID_UUID`` value (e.g., all zeroes) if
            the registration failed.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the system service could not be successfully
            registered.

- *Request-Reply* - ``GetSystemServiceUUID()``

      + Purpose: Get the assigned UUID for the given ``serviceName``.

      + Request Data:

         *  ``systemId`` (``UUID``) : The UUID of the parent system.

         *  ``subsystemId`` (``UUID``) : *[Optional]* The UUID of the
            associated subsystem.

         *  ``serviceName`` (``String``) : The name of the system
            service.

      + Reply Data:

         *  ``serviceId`` (``UUID``) : The assigned UUID for the system
            service, or an ``INVALID_UUID`` value (e.g., all zeroes) if
            the lookup failed.

         *  ``errorMsg`` (``String``) :*[Optional]* An error message
            describing why the system service lookup failed.
