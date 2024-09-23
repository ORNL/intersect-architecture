.. _intersect:arch:ms:orchestrate:patterns:retry_recovery:

Retry and Recovery from Errors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Orchestration methods for managing complex dependencies between microservice
interactions should be resilient to transient or permanent error conditions
in the services or their associated resources.
In this context, we are concerned with error conditions arising during
periods of normal service availability, rather than operational failure
scenarios that require service failover or restart.

Adapters for resources or external services are a common source of
microservices in :term:`INTERSECT`.
With such microservices, a single microservice interaction may involve one
or more operations on the external service or resource.
Failures encountered during these operations, such as communication failures,
resource or service exhaustion, or any other situation that prevents
successful operations, are expected to be properly handled by the adapter
implementation and reported as interaction errors to microservice clients
via responses to requests or asynchronous status or event messages.

A widely-used method for handling both transient microservice interaction
errors and external operation failures is the **Retry** pattern
:cite:`Microsoft:Azure:Patterns:Retry`.
In this pattern, an action is retried after experiencing an error or failure
in anticipation of eventual success.
Often, the **Retry** pattern involves the use of two parameters: a retry
count and a retry delay.
The retry count is the maximum number of failed attempts before
the failure condition is treated as permanent.
The retry delay is the interval between successive action attempts.
Some implementations of this pattern may utilize a progressive delay
(e.g., exponential backoff) to increase the delay for each observed failure.

When an application-level task requires several interdependent
interactions with differing microservices, additional state tracking
is required to orchestrate the interactions in the presence of errors.
Because a task represents a single logical piece of work performed by the
application, successful task completion depends on successful
completion of all the component interactions.
If any of those interactions cannot be completed due to an error
condition, then the task should be considered failed as well.
Additionally, where possible, the orchestration should attempt to
recover from any interactions already completed to ensure a consistent
application understanding of the state of the ecosystem.
Recovery actions may include such things as releasing allocated
resources or removing items added to shared data and information stores.
One approach focused on enabling such state tracking and recovery is the
**Scheduler-Agent-Supervisor** pattern :cite:`Microsoft:Azure:Patterns:SAS`.
In this pattern, a *Scheduler* orchestrates task interactions with *Agents*
and records the state of each interaction in a database shared with a
*Supervisor*.
The *Supervisor* monitors the database for incomplete or failed interactions
and decides when to initiate retry or recovery actions by making requests
of the *Scheduler*.
Solutions implementing this pattern may combine the functionality of the
*Scheduler* and *Supervisor* within the same orchestration process.
However, a potential benefit of decoupling those roles comes when
orchestration activities are spread across several distributed *Schedulers*
each managing tasks involving only their local *Agents*.
In such distributed orchestration scenarios, a separate *Supervisor* that
tracks the state of all *Schedulers* is warranted.

