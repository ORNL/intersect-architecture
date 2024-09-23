
.. _`intersect:arch:sos:user:processes:trigger`:

Trigger Workflow
================

The scheduler is analogous to a game loop. A continually monitors a
priority queue of incoming resource bundled jobs and active workflows.
Its job is largely to decide when and where a workflow should run and if
it should be killed. Within this loop, the scheduler is monitoring the
incoming job queue. It pops the lead entry off the queue and places it
in a dictionary keyed by trigger time. Each time the loop within the
scheduler cycles, it evaluates the sorted list of keys to choose the
next available slot in which to run a workflow. When the scheduler’s
clock time is greater than the minimum of the sorted keys, the minimum
sorted key is queried from the dictionary to retrieve the corresponding
resource bundled job. At this point, a new workflow is initialized with
the corresponding resources. The new workflow is started and a pointer
to the new workflow is added to the active workflows registry.

Preconditions
-------------

-  The scheduler has received a valid resource bound job on its incoming
   jobs queue

-  All resources for overlapping periods of time are mutually exclusive

Post-conditions
---------------

-  The resource bundled job has been stored within the scheduler’s
   incoming jobs registry to be available when the schedulers clock
   triggers the workflow start.

-  The instantiated workflow is stored within the active workflows
   within the scheduler.

-  Scheduler events have been associated with the newly created workflow
   so they may be reported

