.. _`intersect:arch:ms:capability:infrastructure:computing:allocation`:

Capability - Compute :: Compute Allocation
--------------------------------------------------

:Description:
   Interact with computing systems to allocate immediate access to a set
   of compute hosts for a specified period of time.
   :numref:`fig:intersect:arch:ms:sequences:compute:resource:allocation`
   shows an example orchestration seqence for on-demand allocation of
   computing resources.
   :numref:`fig:intersect:arch:ms:sequences:compute:resource:run`
   shows an example orchestration seqence for running an application
   program within an allocation of computing resources.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends: None
   - Requires: None

:Interactions:
   - Asynchronous: ``ComputeAllocationStatusChange``, ``ComputeRunStatusChange``
   - Command: ``ReleaseAllocation()``, ``RunInAllocation()``
   - Request-Reply: ``CreateAllocation()``, ``GetAllocationDetails()``,
     ``GetAllocationInfo()``, ``GetAllocationStatus()``,
     ``GetRunDetails()``, ``GetRunStatus()``

- *Asynchronous Status* - ``ComputeAllocationStatusChange``

      + Purpose: Notification of compute system allocation status changes.

      + Event Data:

         *  ``allocationId`` (``String``) : The compute system
            allocation identifier.

         *  ``allocationStatus`` (``String``) : The compute system
            allocation status information for the given ``allocationId``
            (e.g., "ALLOCATION_ACTIVE", "ALLOCATION_ENDED", or
            "ALLOCATION_EXPIRED").

         *  ``statusDetails`` (``String``) : *[Optional]* Additional
            information further detailing the current status.

- *Asynchronous Status* - ``ComputeRunStatusChange``

      + Purpose: Notification of compute system allocation status changes.

      + Event Data:

         *  ``allocationId`` (``String``) : The identifier of the
            compute system allocation containing the run.

         *  ``runName`` (``String``) : The name of the run.

         *  ``runStatus`` (``String``) : The compute system run status
            information for the given ``runName`` (e.g.,
            "RUN_IN_PROGRESS", "RUN_FAILED", or "RUN_COMPLETED").

         *  ``statusDetails`` (``String``) : *[Optional]* Additional
            information further detailing the current status.

- *Command* - ``ReleaseAllocation()``

      + Purpose: Release an existing compute system allocation.

      + Command Data:

         *  ``allocationId`` (``String``) : The compute system
            allocation identifier.

- *Command* - ``RunInAllocation()``

      + Purpose: Run a program using the given run options and program arguments
        within an existing compute system allocation.

      + Command Data:

         *  ``runName`` (``String``) : The name for the run.

         *  ``allocationId`` (``String``) : The compute system
            allocation identifier.

         *  ``runOptions`` (``List<String>``) : The run options for the
            compute resource manager. The format of the provided options
            is unspecified and may vary across compute resource
            managers.

         *  ``programArgs`` (``List<String>``) : The full program
            arguments. The first argument in the list should be the
            local file path to the program executable.

- *Request-Reply* - ``CreateAllocation()``

      + Purpose: Create a compute system allocation.

      + Request Data:

         *  ``hostCount`` (``Integer``) : The number of compute hosts to
            allocate.

         *  ``wallTime`` (``TimeDuration``) : The requested walltime for
            the allocation.

         *  ``featureMatchCriteria`` (``List< KeyVal<String> >``) : An
            optional list of key-value parameters to use in selection of
            compute system hosts with desired features.

      + Reply Data:

         *  ``allocationId`` (``String``) : The compute system
            allocation identifier.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested allocation could not be
            granted.

- *Request-Reply* - ``GetAllocationDetails()``

      + Purpose: Request detailed allocation information as a list of key-value
        pairs for the given allocation, such as the allocation start
        and end times and resources included within the allocation. The
        format of the keys and values in the returned information is
        unspecified and may vary across computing systems.

      + Request Data:

         *  ``allocationId`` (``String``) : The compute system
            allocation identifier.

      + Reply Data:

         *  ``allocationDetails`` (``List< KeyVal<String> >``) : The
            detailed allocation information for the given
            ``allocationId``.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested compute system allocation
            information could not be returned for the given
            ``allocationId``.

- *Request-Reply* - ``GetAllocationInfo()``

      + Purpose: Request summary information for the given allocation, such as
        the set of allocated compute hosts and their features. The
        format of the returned information is unspecified and may vary
        across computing systems.

      + Request Data:

         *  ``allocationId`` (``String``) : The compute system
            allocation identifier.

      + Reply Data:

         *  ``allocationInfo`` (``String``) : The summary allocation
            information for the given ``allocationId``.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested compute system allocation
            information could not be returned for the given
            ``allocationId``.

- *Request-Reply* - ``GetAllocationStatus()``

      + Purpose: Request current status for the given allocation.

      + Request Data:

         *  ``allocationId`` (``String``) : The compute system
            allocation identifier.

      + Reply Data:

         *  ``allocationStatus`` (``String``) : The compute system
            allocation status information for the given ``allocationId``
            (e.g., "ALLOCATION_ACTIVE", or "ALLOCATION_ENDED").

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested compute system allocation
            status could not be returned for the given ``allocationId``.

- *Request-Reply* - ``GetRunDetails()``

      + Purpose: Request detailed information as a list of key-value pairs for
        the run associated with the given name. The format of the keys
        and values in the returned information is unspecified and may
        vary across computing systems.

      + Request Data:

         *  ``runName`` (``String``) : The name of the run.

      + Reply Data:

         *  ``runDetails`` (``List< KeyVal<String> >``) : The detailed
            run information for the given ``runName``.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested compute system run information
            could not be returned for the given ``runName``.

- *Request-Reply* - ``GetRunStatus()``

      + Purpose: Request current status for the run associated with the given
        name.

      + Request Data:

         *  ``runName`` (``String``) : The name of the run.

      + Reply Data:

         *  ``runStatus`` (``String``) : The compute system
            alloruncation status information for the given ``runName``
            (e.g., "RUN_IN_PROGRESS", "RUN_FAILED", or "RUN_COMPLETED").

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested compute system run status could
            not be returned for the given ``runName``.
