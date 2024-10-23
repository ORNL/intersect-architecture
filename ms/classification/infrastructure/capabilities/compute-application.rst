.. _intersect:arch:ms:classification:infrastructure:capabilities:compute_application:

Capability - Compute :: Application Execution
-----------------------------------------------------

:Description:
   Executes a packaged application on a computing system. A packaged
   application is one that has been previously deployed and configured
   for use on the target computing system. Packaged applications should
   also integrate with INTERSECT Data and Information Management
   services to store and publish any data products or streams.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends:

      + :ref:`intersect:arch:ms:classification:infrastructure:capabilities:general_param_config`

   - Requires:

      + :ref:`intersect:arch:ms:classification:infrastructure:capabilities:compute_allocation` **OR**
        :ref:`intersect:arch:ms:classification:infrastructure:capabilities:compute_queue`

:Interactions:
   - Asynchronous: ``ApplicationExecutionStatusChange``
   - Command: ``RunApplication()``
   - Request-Reply: ``GetApplicationExecutionStatus()``.
     ``GetApplicationDescription()``

- *Asynchronous Status* - ``ApplicationExecutionStatusChange``

      + Purpose: Notification of application execution status changes.

      + Event Data:

         *  ``runId`` (``String``) : The client’s identifier for the
            application run.

         *  ``execStatus`` (``String``) : The execution status
            information for the given ``runId`` (e.g.,
            "EXECUTION_PENDING", "EXECUTION_IN_PROGRESS",
            "EXECUTION_COMPLETED", or "EXECUTION_FAILED").

- *Command* - ``RunApplication()``

      + Purpose: Run the application using the given ``runParameters``.

      + Command Data:

         *  ``runId`` (``String``) : The client’s identifier for the
            application run.

         *  ``runParameters`` (``List< KeyVal<String> >``) : A list of
            key-value parameters to control execution behavior. The
            parameter names may vary across applications and may be
            queried via the *Parameter Configuration* capability.

- *Request-Reply* - ``GetApplicationExecutionStatus()``

      + Purpose: Request the current execution status for the given ``runId``..

      + Request Data:

         *  ``runId`` (``String``) : The client’s identifier for the
            application run.

      + Reply Data:

         *  ``execStatus`` (``String``) : The execution status
            information for the given ``runId`` (e.g.,
            "EXECUTION_PENDING", "EXECUTION_IN_PROGRESS",
            "EXECUTION_COMPLETED", or "EXECUTION_FAILED").

         *  ``failureMsg`` (``String``) : *[Optional]* When the
            application execution has failed, an error message
            describing any available details of the failure.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested execution status could not be
            returned for the given ``runId``.

- *Request-Reply* - ``GetApplicationDescription()``

      + Purpose: Request a textual description of the application. The
        description should include information regarding the intended
        purpose of the application, how it was packaged (e.g.,
        associated source code and versions), and how it was configured
        for the target system.

      + Reply Data:

         *  ``appDescription`` (``String``) : The application
            description text.
