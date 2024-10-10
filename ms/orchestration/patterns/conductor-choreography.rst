.. _intersect:arch:ms:orchestration:patterns:choreography:

Conductor vs. Choreography
~~~~~~~~~~~~~~~~~~~~~~~~~~

Rather than encode the (potentially complex) logic to manage dependencies
between microservice interactions in an application, a common pattern is
to offload this logic to another service which provides a simple
request-response API to the application. This pattern is known as the
**Conductor** (or **Orchestrator**) pattern, as the service manages the
complexity of many microservices similar to an orchestra conductor
managing the performance of many instrumental sections. For RESTful
microservices, the **Conductor** pattern is appropriate for managing
dependent interactions. However, in asynchronous messaging architectures
the **Conductor** pattern introduces additional synchronization and
latency as interaction responses must be delivered to the conductor,
who must then trigger any dependent interactions.

For asynchronous messaging, the **Choreography** pattern is an
alternative that translates interaction dependencies into asynchronous
completion events. For interactions that generate response data, the
completion events must also incorporate that data within the event message.
Dependent interactions can commence upon observation of the completion 
event message for the prior interaction. The benefits of
**Choreography** for completion latency should be weighed against
the need for additional coupling between microservices, as each 
microservice needs to be informed of the dependencies and watch for
the associated completion events.
