.. _intersect:arch:ms:classification:infrastructure:capabilities:general_availability:

Capability - Utility :: Availability Status
-------------------------------------------

:Description:
   Provides inspection and control of the availability status of a
   service. **NOTE:** All services are expected to provide this
   capability.

:Version:
   0.1 - Initial capability definition.

:Data Definitions:
   ``AvailabilityStatus``

:Interactions:
   - Asynchronous: ``AvailabilityStatusChange``
   - Command: ``SetAvailabilityStatus()``
   - Request-Reply: ``GetAvailabilityStatus()``

- *Data Definition* - ``AvailabilityStatus``

      * ``uuid`` (``UUID``) : The UUID of the entity reporting its status.
      * ``currentStatus`` (``String``) : The current status.
      * ``previousStatus`` (``String``) : The previous status.
      * ``statusDescription`` (``String``) : Additional information
        related to the current status (e.g., why a status change occurred).

- *Asynchronous Status* - ``AvailabilityStatusChange``

      + Purpose: Notification of changes to availability status.

      + Event Data:

         * ``status`` (``AvailabilityStatus``) : The current
           availability status information.

- *Command* - ``SetAvailabilityStatus()``

      + Purpose: Update the status using the given parameters. On success,
        triggers the ``AvailabilityStatusChange`` event.

      + Command Data:

         * ``status`` (``String``) : The new status (e.g.,
           "AVAILABILITY_UNKNOWN", "AVAILABLE", "PARTIAL_AVAILABILITY",
           or "UNAVAILABLE").

         * ``statusDescription`` (``String``) : *[Optional]* A
           description of the reason for the status change.

- *Request-Reply* - ``GetAvailabilityStatus()``

      + Purpose: Request the current availability status.

      + Request Data: None

      + Reply Data:

         * ``status`` (``AvailabilityStatus``) : The current
           availability status information.
