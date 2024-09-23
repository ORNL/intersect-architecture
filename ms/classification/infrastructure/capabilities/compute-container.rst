.. _`intersect:arch:ms:capability:infrastructure:computing:container_execution`:

Capability - Compute :: Container Execution
---------------------------------------------------

:Description:
   Executes a containerized application on a computing system.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends:

      + :ref:`intersect:arch:ms:capability:infrastructure:utility:param_config`

   - Requires:

      + :ref:`intersect:arch:ms:capability:infrastructure:computing:allocation` **OR**
        :ref:`intersect:arch:ms:capability:infrastructure:computing:batch_queue`

:Interactions:
   - Asynchronous: ``ContainerExecutionStatusChange``, ``ContainerImageAvailable``,
     ``ContainerImageRemoval``
   - Command: ``BuildContainerImage()``, ``RemoveContainerImage()``
   - Request-Reply: ``RunContainer()``, ``RunContainerFromImage()``,
     ``GetContainerExecutionStatus()``

- *Asynchronous Status* - ``ContainerExecutionStatusChange``

      + Purpose: Notification of container application execution status changes.

      + Event Data:

         *  ``runId`` (``String``) : The client’s identifier for the
            container application’s execution.

         *  ``execStatus`` (``String``) : The execution status
            information for the given ``runId`` (e.g.,
            "EXECUTION_IN_PROGRESS", "EXECUTION_COMPLETED", or
            "EXECUTION_FAILED").

- *Asynchronous Status* - ``ContainerImageAvailable``

      + Purpose: Notification of container image availability.

      + Event Data:

         *  ``imageName`` (``String``) : The name of the container build
            image.

- *Asynchronous Status* - ``ContainerImageRemoval``

      + Purpose: Notification of container image removal.

      + Event Data:

         *  ``imageName`` (``String``) : The name of the container build
            image.

- *Command* - ``BuildContainerImage()``

      + Purpose: Build and store for later use a container image with given
        ``imageName`` using the given image and build parameters. If
        the image is built successfully, will trigger the
        ``ContainerImageAvailable`` event.

      + Command Data:

         *  ``imageName`` (``String``) : The name to use for the
            container image.

         *  ``imageSpec`` (``String``) : The build context for the
            container image (e.g., a local file path or URL).

         *  ``imageFile`` (``String``) : *[Optional]* The file name
            relative to the build context that contains the image build
            commands.

         *  ``buildParameters`` (``List< KeyVal<String> >``) :
            *[Optional]* A list of key-value parameters to control build
            behavior. The parameter names may vary across container
            environments and may be queried via the *Parameter
            Configuration* capability.

- *Command* - ``RemoveContainerImage()``

      + Purpose: Remove a previously built container image with given
        ``imageName``. If the image is successfully removed, will
        trigger the ``ContainerImageRemoval`` event.

      + Command Data:

         *  ``imageName`` (``String``) : The name to use for the
            container image.

- *Request-Reply* - ``RunContainer()``

      + Purpose: Build and run the container application using the given image,
        build, and run parameters. The image is not stored for later
        use. The reply should be delayed until a build or run error is
        encountered, or until the container has been successfully
        launched.

      + Request Data:

         *  ``runId`` (``String``) : The client’s identifier for the
            container application’s execution.

         *  ``imageSpec`` (``String``) : The build context for the
            container image (e.g., a local file path or URL).

         *  ``imageFile`` (``String``) : *[Optional]* The file name
            relative to the build context that contains the image build
            commands.

         *  ``buildParameters`` (``List< KeyVal<String> >``) :
            *[Optional]* A list of key-value parameters to control build
            behavior. The parameter names may vary across container
            environments and may be queried via the *Parameter
            Configuration* capability.

         *  ``runParameters`` (``List< KeyVal<String> >``) : *[Optional]*
            A list of key-value parameters to control container
            execution behavior. The parameter names may vary across
            container environments and may be queried via the *Parameter
            Configuration* capability.

      + Reply Data:

         *  ``buildErrorMsg`` (``String``) : *[Optional]* An error message
            describing why the container image could not be built.

         *  ``runErrorMsg`` (``String``) : *[Optional]* An error message
            describing why the container application could not be
            launched.

- *Request-Reply* - ``RunContainerFromImage()``

      + Purpose: Run the container application using the given ``imageName`` and
        run parameters.

      + Request Data:

         *  ``runId`` (``String``) : The client’s identifier for the
            container application’s execution.

         *  ``imageName`` (``String``) : The name of the container image
            to use.

         *  ``runParameters`` (``List< KeyVal<String> >``) : *[Optional]*
            A list of key-value parameters to control container
            execution behavior. The parameter names may vary across
            container environments and may be queried via the *Parameter
            Configuration* capability.

      + Reply Data:

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the container application could not be
            launched.

- *Request-Reply* - ``GetContainerExecutionStatus()``

      + Purpose: Request the current execution status for the given ``runId``.

      + Request Data:

         *  ``runId`` (``String``) : The client’s identifier for the
            container application’s execution.

      + Reply Data:

         *  ``execStatus`` (``String``) : The execution status
            information for the given ``runId`` (e.g.,
            "EXECUTION_IN_PROGRESS", "EXECUTION_COMPLETED", or
            "EXECUTION_FAILED").

         *  ``failureMsg`` (``String``) : *[Optional]* When the container
            execution has failed, an error message describing any
            available details of the failure.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested execution status could not be
            returned for the given ``runId``.
