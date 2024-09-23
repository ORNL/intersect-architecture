
.. _`intersect:arch:sos:user:processes:register-job`:

Register Job
============

When a job’s trigger time has been activated, the orchestrator triggers
to register the job bundle with the scheduler. The job bundle is
interpreted by the scheduler giving it initialization instructions such
as the ability to copy data from some named location to a staging area
or stream data. Additionally, resources are corralled and mutexed by
changing their state within a corresponding smart contract essentially
preventing them from double use or cross communications. At this point
the user is unable to manually cancel a scheduled job, only an
administrator can do so. The job sits pending in the scheduler until its
workflow is triggered.

Preconditions
-------------

-  There are no errors in the symbolic DAG

-  All resources have been pinged to assert their existence and
   functionality

-  An appropriate timeslot has been allocated roughly and associated
   with a trigger time within the orchestrator

-  All configuration data has been bundled and is considered immutable

Post-conditions
---------------

-  A resource bound job is sent to the scheduler when a trigger time has
   been tripped within the orchestrator. This throttles the amount of
   activity on the scheduler (load-balancing).

-  The scheduler receives the resource bound job and assigns an internal
   trigger time to start the job and assigns a job duration specifying
   the maximum allowed run time before the job is killed by the
   scheduler.
