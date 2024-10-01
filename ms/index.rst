.. _intersect:arch:ms:

Microservices Architecture
##########################

*Microservices architecture* is a design methodology for structuring a
distributed application as a networked collection of loosely-coupled
services that are independently developed, maintained, and operated.
Each *microservice* provides a well-defined set of functions that is
domain-scoped to ensure separation of concerns between differing
microservices, avoid duplicate functionality, and encourage reuse. The
supported functions are defined by the *microservice contract*, which
describes the purpose for each service function and associated data
(e.g., request parameters and response types). A microservice may have
several different implementations, where each implementation provides
the same contract but uses different underlying technologies or supports
a particular deployment environment. Where multiple implementations
exist, an application can choose the implementation most suitable for
its environment or application needs. A microservice may be
self-contained such that all its functions can be serviced directly, or
it may have external dependencies on other microservices that are needed
to service one or more functions.

Microservices architecture is not prescriptive, but rather offers design
guidelines and patterns for decomposing monolithic applications or
systems into independent services, and for constructing new applications
or systems through composition of independent services. A common and
recommended approach for decomposition is through domain-driven design.
In domain-driven design the *domain* corresponds to a particular subject
area, and a subject matter expert (:term:`SME`) helps to define the 
activities relevant to the domain, known as the domain's bounded context. 
An abstract conceptual model of the domain is then constructed that captures 
the important technical aspects of interactions with the domain. The domain 
model is also used to establish shared context when composing complex systems 
from different domains. In microservices architecture, the domain model forms
the basis for defining the functions comprising the microservice contract.

Microservices are currently in wide use for cloud computing
applications. There are two predominant communication architectures used
for interactions between microservices: *client-server* and
*asynchronous messages*. In client-server microservice communication,
each interaction uses a synchronous *request-response* sequence, where
one microservice (the client) issues a request of a specific type to
another microservice (the server), who then handles the request and
sends a specific response type based on the results of handling the
request. Typical response types include formatted data that was
requested (e.g., user account details or service status) or error codes.
In microservice communication based on asynchronous messages, a
microservice (the producer) publishes messages to a specific topic (or
channel) and other microservices (the consumers) subscribe to the topic
in order to register as interested parties for messages on that topic.
Messages may represent service requests (e.g., control commands or
information queries) or describe the occurrence of an event (e.g., a
service action or state change). Due to the latter, asynchronous
messaging is also commonly referred to as an event-based or event-driven
communication architecture. This *publish-subscribe* mechanism enables
one-to-many communications without the producer having to individually
send messages to each consumer. Typically, a separate entity known as
the *message broker* tracks the set of topics and the consumers
subscribed to each topic, and is responsible for ensuring the delivery
of topic messages to subscribers. Publish-subscribe also supports
asynchronous request-response communication by using separate topics for
requests and responses.

In response to these two common microservice communication
architectures, two community-driven specification standards have evolved
to document a microservice's contract. Both standards intend to provide
a programming language-agnostic method for API definition that is
understandable to both humans and machines, which enables a wide variety
of automated tooling for code development, testing, and documentation.
The OpenAPI Specification :cite:`OpenAPI-spec:v3` targets
client-server microservices that provide a :term:`REST` API accesible 
via :term:`HTTP`.
The AsyncAPI Specification :cite:`AsyncAPI-spec:v2` targets
microservices based on asynchronous messaging and supports a wide
variety of messaging protocols. AsyncAPI was originally derived from
OpenAPI and thus shares much terminology. In some cases, AsyncAPI
directly supports referencing components of OpenAPI specifications such
as data schemas.

.. toctree::
   :maxdepth: 2

   use
   interaction
   classification/index
   orchestration/index
   deployment/index
