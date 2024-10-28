.. _intersect:arch:sos:user:processes:submit:

Submit Job
==========

After a DAG has been compiled into a schedulable job, the job may be
submitted to an orchestrator. At this point, all configuration metadata
is bundled with completely resolved resource entities (this is the
difference between having placeholders or relative paths with
unambiguous absolute paths or static values). Within the orchestrator,
the job is queued in a registry to be submitted to the scheduler for
execution. At this point, the user or an administrator has the
capability of canceling the job. This is analogous to a printer queue
where a job is submitted, and a user can open a corresponding device
manager program to manually cancel the job.

Preconditions
-------------

-  The user is logged into the system

-  There are no errors in the symbolic representation of the DAG

-  All configuration metadata is present and bundled with the job

Post-conditions
---------------

-  All resource placeholders such as NFTs are replaced with connection
   criteria, URLs, port mappings, micro-services, etc.

-  All configuration data has been bundled such as the creation of
   immutable docker volumes that may be attached to the job

-  All absolute paths have been tested such as a ping to assert
   connectivity

-  All corresponding trigger time has been associated with the job
   within the orchestrator

Notes
-----

-  Any errors will dequeue the job and post notifications to both an
   administrator and the user

-  Consistent failures on a particular resource will cause status
   changes to the NFT such as a reliability attribute
