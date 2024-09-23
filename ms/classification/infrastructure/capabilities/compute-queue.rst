.. _`intersect:arch:ms:capability:infrastructure:computing:batch_queue`:

Capability - Compute :: Compute Queue
---------------------------------------------

:Description:
   Interact with batch job queueing systems to run compute jobs and
   monitor job and queue status.
   :numref:`fig:intersect:arch:ms:sequences:compute:resource:job`
   shows an example orchestration seqence for running an application
   program within a batch computing job.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends:

      + :ref:`intersect:arch:ms:capability:infrastructure:utility:param_config`

   - Requires: None

:Interactions:
   - Asynchronous: ``JobStatusChange``, ``QueueStatusChange``
   - Command: ``CancelJob()``, ``HoldJob()``, ``ReleaseJob()``
   - Request-Reply: ``GetJobInfo()``, ``GetJobStatus()``,
     ``GetQueueInfo()``, ``GetQueueStatus()``, ``ListQueues()``,
     ``SubmitJob()``

- *Asynchronous Status* - ``JobStatusChange``

      + Purpose: Notification of job status changes.

      + Event Data:

         *  ``jobId`` (``String``) : The job identifier for the batch
            job.

         *  ``jobStatus`` (``String``) : The job status information for
            the given ``jobId`` (e.g., "JOB_QUEUED", "JOB_HELD",
            "JOB_RUNNING", or "JOB_COMPLETED").

- *Asynchronous Status* - ``QueueStatusChange``

      + Purpose: Notification of queue status changes.

      + Event Data:

         *  ``queueId`` (``String``) : The identifier for the batch
            queue.

         *  ``queueStatus`` (``String``) : The queue status information
            for the given ``queueId`` (e.g., "QUEUE_ENABLED",
            "QUEUE_DISABLED", or "QUEUE_PAUSED").

- *Command* - ``CancelJob()``

      + Purpose: Cancel a batch job. Only valid for jobs with ``jobStatus`` of
        "JOB_QUEUED" or "JOB_RUNNING".

      + Command Data:

         *  ``jobId`` (``String``) : The job identifier for the batch
            job.

- *Command* - ``HoldJob()``

      + Purpose: Place a queue hold on a batch job. Only valid for jobs in the
        "JOB_QUEUED" ``jobStatus``.

      + Command Data:

         *  ``jobId`` (``String``) : The job identifier for the batch
            job.

- *Command* - ``ReleaseJob()``

      + Purpose: Release a queue hold on a batch job. Only valid for jobs in the
        "JOB_HELD" ``jobStatus``.

      + Command Data:

         *  ``jobId`` (``String``) : The job identifier for the batch
            job.

- *Request-Reply* - ``GetJobInfo()``

      + Purpose: Request detailed job information. The format of the returned
        information is unspecified and may vary across batch job
        queueing systems.

      + Request Data:

         *  ``jobId`` (``String``) : The job identifier for the batch
            job.

      + Reply Data:

         *  ``jobInfo`` (``String``) : The detailed job information for
            the given ``jobId``.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested job information could not be
            returned for the given ``jobId``.

- *Request-Reply* - ``GetJobStatus()``

      + Purpose: Request the current job status.

      + Request Data:

         *  ``jobId`` (``String``) : The job identifier for the batch
            job.

      + Reply Data:

         *  ``jobStatus`` (``String``) : The job status information for
            the given ``jobId`` (e.g., "JOB_QUEUED", "JOB_HELD",
            "JOB_RUNNING", or "JOB_COMPLETED").

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested job status could not be
            returned for the given ``jobId``.

- *Request-Reply* - ``GetQueueInfo()``

      + Purpose: Request detailed queue information, such as job resource
        limits. The format of the returned information is unspecified
        and may vary across batch job queueing systems.

      + Request Data:

         *  ``queueId`` (``String``) : The identifier for the batch
            queue.

      + Reply Data:

         *  ``queueInfo`` (``String``) : The detailed queue information
            for the given ``queueId``.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested queue information could not be
            returned for the given ``queueId``.

- *Request-Reply* - ``GetQueueStatus()``

      + Purpose: Request the current queue status.

      + Request Data:

         *  ``queueId`` (``String``) : The identifier for the batch
            queue.

      + Reply Data:

         *  ``queueStatus`` (``String``) : The queue status information
            for the given ``queueId`` (e.g., "QUEUE_ENABLED",
            "QUEUE_DISABLED", or "QUEUE_PAUSED").

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the requested queue status could not be
            returned for the given ``queueId``.

- *Request-Reply* - ``ListQueues()``

      + Purpose: Request the list of batch queues.

      + Request Data:
         None

      + Reply Data:

         *  ``queueIdList`` (``StringList``) : A list of batch queue
            identifiers (i.e., ``queueId``).

- *Request-Reply* - ``SubmitJob()``

      + Purpose: Submit a job script to a particular batch queue.

      + Request Data:

         *  ``queueId`` (``String``) : The identifier for the batch
            queue.

         *  ``jobScript`` (``Filepath``) : The file name of the job
            script.

         *  ``submitArgs`` (``List< KeyVal<String> >``) : A list of
            key-value parameters for use as arguments to the batch job
            queueing system submission command. The parameter names may
            vary across batch job queueing systems, and may be queried
            via the *Parameter Configuration* capability.

      + Reply Data:

         *  ``jobId`` (``String``) : The identifier for the submitted
            job.

         *  ``errorMsg`` (``String``) : *[Optional]* An error message
            describing why the job could not be submitted to the given
            ``queueId``.
