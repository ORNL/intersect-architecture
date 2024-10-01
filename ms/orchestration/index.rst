.. _intersect:arch:ms:orchestrate:

Orchestration of INTERSECT Microservices
########################################

Orchestration of microservices is concerned with how microservices work
together to accomplish the goals of a specific application use case.
Some application use cases involve a sequence of interactions with
several different microservices, where each interaction may depend upon
completion of a prior interaction. The dependencies may be a simple linear
sequence where the data included in the response from the previous request
is used in the next interaction. The dependencies can also be complex, such
as when data from multiple responses are combined to form the input data
for a subsequent interaction, or when some subset of the interactions are
actually independent and can be processed concurrently.

To maintain the benefits for independence between microservices, the
application logic that defines dependencies between interactions should
be maintained by an entity external to the microservices. Workflow
management software is often employed to track control and/or data
dependencies between tasks, and thus may be suitable for orchestration
of microservice interactions.


.. toctree::
   :maxdepth: 2

   ms-orchestrate-patterns
