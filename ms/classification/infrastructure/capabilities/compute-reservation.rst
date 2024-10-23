.. _intersect:arch:ms:classification:infrastructure:capabilities:compute_reservation:

Capability - Compute :: Compute Queue Reservation
---------------------------------------------------------

:Description:
   Interact with batch queueing systems to reserve dedicated compute
   system access, either at a specified time or by some deadline.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends:

      + :ref:`intersect:arch:ms:classification:infrastructure:capabilities:compute_queue`

   - Requires: None

:Interactions:
   - Asynchronous: ``ReservationStatusChange``
   - Command: ``CancelReservation()``
   - Request-Reply: ``CreateReservation()``, ``CreateDeadlineReservation()``,
     ``GetReservationStatus()``, ``SubmitJobToReservation()``

- *Asynchronous Status* - ``ReservationStatusChange``

      + Purpose: Notification of batch queue reservation status changes.

      + Event Data:

         *  ``reservationId`` (``String``) : The batch queue reservation
            identifier.

         *  ``reservationStatus`` (``String``) : The batch queue
            reservation status information for the given
            ``reservationId`` (e.g., "RESERVATION_GRANTED",
            "RESERVATION_ACTIVE", or "RESERVATION_ENDED").

- *Command* - ``CancelReservation()``

      + Purpose: Cancel a batch queue reservation. Only valid for reservations
        with ``reservationStatus`` of "RESERVATION_GRANTED".

      + Command Data:

         *  ``reservationId`` (``String``) : The batch queue reservation
            identifier.

- *Request-Reply* - ``CreateReservation()``

      + Purpose: Create a batch queue reservation at a specific time.

      + Request Data:

         *  ``queueId`` (``String``) : The identifier for the batch
            queue.

         *  ``hostCount`` (``Integer``) : The number of compute hosts to
            reserve.

         *  ``wallTime`` (``TimeDuration``) : The requested walltime for
            the reservation.

         *  ``startTime`` (``Timestamp``) : The requested start time for
            the reservation.

      + Reply Data:

         *  ``reservationId`` (``String``) : The batch queue reservation
            identifier.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested batch queue reservation could
            not be granted.

- *Request-Reply* - ``CreateDeadlineReservation()``

      + Purpose: Create a batch queue reservation that should end no later than
        a specified time deadline.

      + Request Data:

         *  ``queueId`` (``String``) : The identifier for the batch
            queue.

         *  ``hostCount`` (``Integer``) : The number of compute hosts to
            reserve.

         *  ``wallTime`` (``TimeDuration``) : The requested walltime for
            the reservation.

         *  ``deadlineTime`` (``Timestamp``) : The requested deadline
            time for the end of the reservation.

      + Reply Data:

         *  ``reservationId`` (``String``) : The batch queue reservation
            identifier.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested batch queue reservation could
            not be granted.

- *Request-Reply* - ``GetReservationStatus()``

      + Purpose: Request the current reservation status.

      + Request Data:

         *  ``reservationId`` (``String``) : The batch queue reservation
            identifier.

      + Reply Data:

         *  ``reservationStatus`` (``String``) : The batch queue
            reservation status information for the given
            ``reservationId`` (e.g., "RESERVATION_GRANTED",
            "RESERVATION_ACTIVE", or "RESERVATION_ENDED").

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested batch queue reservation status
            could not be returned for the given ``reservationId``.

- *Request-Reply* - ``SubmitJobToReservation()``

      + Purpose: Submit a job script to a particular batch queue reservation.

      + Request Data:

         *  ``reservationId`` (``String``) : The batch queue reservation
            identifier.

         *  ``jobScript`` (``Filepath``) : The file name of the job
            script.

         *  ``submitArgs`` (``List< KeyVal<String> >``) : A list of
            key-value parameters for use as arguments to the batch job
            queueing system submission command. The parameter names may
            vary across batch job queueing systems.

      + Reply Data:

         *  ``jobId`` (``String``) : The identifier for the submitted
            job.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the job could not be submitted to the given
            ``reservationId``.
