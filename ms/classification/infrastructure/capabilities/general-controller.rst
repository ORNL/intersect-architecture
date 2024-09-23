.. _`intersect:arch:ms:capability:infrastructure:utility:control_status`:

Capability - Utility :: Controller Status
-----------------------------------------

:Description:
   Provides inspection and control of the controller status of a system
   or service. **NOTE:** All services are expected to provide this
   capability.

:Version:
   0.1 - Initial capability definition.

:Data Definitions:
   ``ControllerStatus``

:Interactions:
   - Asynchronous: ``ControllerStatusChange``
   - Command: ``ReleaseSecondaryControl()``, ``SetPrimaryController()``
   - Request-Reply: ``AcquireSecondaryControl()``, ``GetControllerStatus()``

- *Data Definition* - ``ControllerStatus``

      * ``uuid`` (``UUID``) : The UUID of the entity reporting its status.
      * ``primaryController`` (``UUID``) : The UUID of the primary controller.
      * ``secondaryController`` (``UUID``) : The UUID of the secondary controller.
      * ``statusDescription`` (``String``) : Additional information related to
        the current controller change event.

- *Asynchronous Status* - ``ControllerStatusChange``

      + Purpose: Notification of changes to controller status.

      + Event Data:

         * ``status`` (``ControllerStatus``) : The current controller
           status information.

- *Command* - ``SetPrimaryController()``

      + Purpose: Change the primary controller to the given ``primaryUUID``. On
        success, triggers the ``ControllerStatusChange`` event.

      + Command Data:

         * ``primaryUUID`` (``UUID``) : The UUID of the new primary controller.
         * ``controllerSecret`` (``Bytes``) : A secret for use in validating
           primary control changes.
         * ``description`` (``String``) : *[Optional]* Additional information
           for use in generating the ``ControllerStatusChange`` event.

- *Command* - ``ReleaseSecondaryControl()``

      + Purpose: Release secondary control permission for the given ``secondaryUUID``.
        On success, triggers the ``ControllerStatusChange`` event.

      + Command Data:

         * ``secondaryUUID`` (``UUID``) : The UUID of the new secondary
           controller.
         * ``controllerSecret`` (``Bytes``) : A secret for use in validating
           secondary control changes.
         * ``description`` (``String``) : *[Optional]* Additional information
           for use in generating the ``ControllerStatusChange`` event.

- *Request-Reply* - ``AcquireSecondaryControl()``

      + Purpose: Request that the given ``secondaryUUID`` be given secondary
        control permission. On success, triggers the ``ControllerStatusChange``
        event.

      + Request Data:

         * ``secondaryUUID`` (``UUID``) : The UUID of the new secondary
           controller.
         * ``controllerSecret`` (``Bytes``) : A secret for use in
           validating secondary control changes.
         * ``description`` (``String``) : *[Optional]* Additional information
           for use in generating the ``ControllerStatusChange`` event.

      + Reply Data:

         * ``errorMsg`` (``String``) : *[Optional]* An error message
           describing why secondary control permission could not be
           granted.

- *Request-Reply* - ``GetControllerStatus()``

      + Purpose: Request the current controller status.

      + Request Data: None

      + Reply Data:

         * ``status`` (``ControllerStatus``) : The current controller
           status information.
