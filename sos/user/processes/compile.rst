.. _intersect:arch:sos:user:processes:compile:

Compile DAG
===========

After a user has requested resources, resources may be paired with
federated recipes or constructed in two new user-defined directed
acyclic graphs (DAGs). These graph structures represent a flowchart that
describes how data moves from logical component to logical component
until the work is completed and data is stored in some destination.
Great examples of this are NodeRed, GNU Radio, and Apache Airflow. The
DAG data structure may be thought of as a symbolic representation of the
work to be done. However, for actual work to be performed, this logical
structure must be instantiated against physical components such as
computational nodes and instrumentation. To compile a DAG, the symbolic
representation is sent to an interpreter to build a job.

Preconditions
-------------

-  the user is logged into the system

-  the user has performed a resource query

-  optionally the user has queried an appropriate federated recipe and
   potentially adapted it for their particular use case

-  optionally, the user has constructed a new DAG from scratch

Post-conditions
---------------

-  The DAG is passed to the interpreter to change the representation
   from a symbolic version to a job which has the effect of allocating
   the resources such that for some scheduled allotment of time all
   resources have been mutexed so that only the current user is capable
   of accessing them without a manual override.

-  A smart contract has been compiled corresponding to the set of
   resources and the project has been billed for their use.
