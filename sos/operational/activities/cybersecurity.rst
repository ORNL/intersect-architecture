.. _intersect:arch:sos:operational:activities:cybersecurity:

Cybersecurity
=============

Computing security considerations for INTERSECT operations.

.. _intersect:arch:sos:operational:activities:cybersecurity:descr:

Cybersecurity services for INTERSECT are designed primarily to serve
two purposes:

- Ensure that only registered INTERSECT participants are allowed to
  access INTERSECT capabilities and resources (*authentication*).
- Ensure that registered INTERSECT participants are only allowed to
  access particular INTERSECT capabilities and resources
  (*authorization*).


Authentication
--------------

Authentication of a user verifies that the user is known to a system. This knowledge can
be represented in several different forms: a list of users (such as in the historical
/etc/passwd structure for UNIX-like systems), some form of database, or an assertion by
another trusted entity that a user is known.

INTERSECT applications do not exist in a vacuum; they will be deployed in a computing
environment with many different administrative domains and potentially as many identity
providers. INTERSECT applications must interact with this collection of provider domains,
but INTERSECT also acts as its own identity provider. The INTERSECT Architecture Data
Model (see :ref:`intersect:arch:sos:data:erdm`) defines *User* and *User Profile* entities
which will be maintained through INTERSECT administrative interfaces.

Because of this, authentication actions for INTERSECT will have at least two steps:
verifying that a user is known to INTERSECT, and verifying a user's existence from one or
more identity providers. This second action may be a verification against a computing
facility's "native" system (such as that operated by OLCF) or a federated identity
provider such as PingFederate.

Authentication against INTERSECT will consist of at least verification that supplied user
credentials exist in the ``User`` table (see :ref:`intersect:arch:sos:data:erdm:detail`).

Authorization
-------------

Once a user is verified to be known to a system, authorization determines which of a set
of resources the user is allowed to access (and what kind of access to those resources is
allowed). INTERSECT resources are organized as microservices (:ref:`intersect:arch:ms`),
which in the INTERSECT system-of-systems architecture can be arbitrarily combined. The
INTERSECT microservices architecture provides a rich set of infrastructure and experiment
services. A combined set of these microservices will constitute a collective *resource*
characterized by the closure of the set of capabilities. Resources may represent a
collection of microservices, a physical instrument represented in the INTERSECT ecosystem
by an arrangement of adapters and controllers, or other not-yet-defined entities. 

In order to authorize access to these resources, INTERSECT applications will identify and
register them with INTERSECT administrative facilities. The ``Resource`` and ``Campaign``
tables, among others, in the :term:`INTERSECT` :ref:`intersect:arch:sos:data:erdm` will host this
information. The ``Approved User Resources`` table will control whether a user is
authorized to access a resource.



Tokens and Capabilities
-----------------------

INTERSECT applications request and provide services via HTTP. As such, the authentication
and authorization state for a user must be available for any given HTTP request. To avoid
frequent interrogation of the INTERSECT data model, tokens will be generated by the
authorization mechanism and included with each HTTP request. Each token will represent an
authorization state for a given user and given resource (set of capabilities).

A user-facing INTERSECT application may manage multiple tokens on behalf of its
users. Invocation of an INTERSECT microservice API will require that a token specifying
the authorization of that user to call that API be included with the HTTP
request. INTERSECT tokens may have associated a "time-to-live", after which a fresh token
must be obtained through authentication and authorization.

Tokens will also provide a vehicle for delegating authorization decisions to instrument
adapters or other INTERSECT components which must interact with foreign user databases or
specialized configurations.

Managing multiple tokens in INTERSECT applications will likely be a challenge and will
require coordination with cybersecurity designers and developers from host organizations
(in the native ORNL case, OLCF). Multipe design approaches are possible. An application
may be required to present all tokens for all composed systems and services on each
request, so that they may be examined by the service being called. The number and
diversity of composed services, each with a token granted representing access to
capabilities of the service, will likely make this simple approach
impractical. "Wallet"-style approaches provide an indirection to an escrowed collection of
tokens which eliminates the need to supply a collection of tokens at each service
invocation, at the cost of some increased complexity. Other solutions may include being
able to compose tokens for related services, making such composed tokens verifiable
without requiring an indirection. 


External Availability of INTERSECT Resources
--------------------------------------------

Several efforts :cite:`IRI:2023` are underway at DOE computing facilities to mediate access by external
users to platforms, hardware, and software services operated by those facilities. Under
such arrangements, computational jobs may be scheduled in concert across multiple separate
installations. This capability will enable more efficient use of both large-scale compute
resources as well as specialized scientific laboratories such as those addressed by
INTERSECT.

Any such system which makes INTERSECT resources and applications available outside OLCF
will need to provide a suitable mapping between their authentication and authorization
mechanisms and those of INTERSECT. If a token-based system is implemented, future versions
of the INTERSECT architecture may grant INTERSECT-native token-based access to resources
when presented with external tokens from known and trusted sources. A more complex but
flexible system would introduce federated token management, in which "foreign" tokens
could be validated independently and then used directly or translated for access to
INTERSECT resources and applications. Application programming interfaces at the perimeter
of faciltiies such as OLCF would then have to expose specialized endpoints to make
federated operation possible.

As noted above, this is an area of active research and INTERSECT applications will likely
have to await more maturity in the various proposed solutions.


Data Security
-------------

Protection for data is not explicitly specified by the INTERSECT Architecture. Other
concurrent efforts such as the INTERSECT Scientific Data Layer may define explicit data
checksumming or encryption requirements.

Malware
-------

In an extensible, composable system like INTERSECT, the issue of malicious code should be
considered. The current INTERSECT Architecture design anticipates that all code which
would participate in a composed application will be written by trusted staff and subject
to internal code review practices. However, many edge instruments which may become part of
INTERSECT applications (through construction of adapter components) may contain code whose
supply chain provenance is uncertain and which cannot be examined for safety. 


.. _intersect:arch:sos:operational:activities:cybersecurity:policy:

Policy Challenges
-----------------

Compute: One-time password requirement
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Description**: Some facilities require all users to use a one-time password for authentication.

**Issue**: Difficult to automate because user input is required

**Example**: OLCF SecureID/RSA token for user logins via SSH

**Source**: See OLCF Computing Policy (version 12.10), *Authentication and Authorization*, [https://docs.olcf.ornl.gov/accounts/olcf_policy_guide.html#authentication-and-authorization]

Compute: Process Run as User
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Description**; The process must run with the user ID of the user to ensure proper permissions are maintained. In some instances a dedicated "project user" can be used to limit execution to a specific user ID that is dedicated to a single project.

**Issue**: Requires a "project user" to be created; eliminates general "service users" for running tasks; requires users to have an account on all resources.

**Example**: OLCF users must run all of their tasks as their RATS-assigned ``uid``. A slight exception is when using OLCF's Slate (OpenShift) system, on which jobs run for a project may execute via a dedicated per-project account (e.g., ``proj123``); this avoids the possibility of a user on different projects accidentally accessing something for the wrong project.

**Source**: See OLCF Computing Policy (Version 12.10), *Authentication and Authorization*, https://docs.olcf.ornl.gov/accounts/olcf_policy_guide.html#authentication-and-authorization.

