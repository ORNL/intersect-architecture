.. _intersect:arch:ms:class:infrastructure:general:

Microservice Capabilities with General Utility
==============================================

Microservice capabilities providing general utility are defined to capture
functionality that is useful to support a wide range of infrastructure or
experiment-specific services. They are not intended to exist as stand-alone
services.

To enable uniform management of INTERSECT services, a few of
the general utility capabilities are expected to be provided by every
deployed service. These capabilities include *Parameter Configuration*, 
*Availability Status*, and *Controller Status*. 

The *Parameter Configuration* capability (see 
:ref:`intersect:arch:ms:capability:infrastructure:utility:param_config`) 
enables each service and its constituent capabilities to expose parameters 
that affect their behavior.

The *Availability Status* capability (see 
:ref:`intersect:arch:ms:capability:infrastructure:utility:avail_status`) 
provides service availability status information to other
services in an INTERSECT ecosystem.

The *Controller Status* capability (see 
:ref:`intersect:arch:ms:capability:infrastructure:utility:control_status`) 
manages the primary and secondary controllers for a service.
The primary controller of a given service is typically the INTERSECT service
responsible for control actions such as deploying that service, making 
runtime changes to its configuration, and monitoring its availability.
The secondary controller of a given service is a service that is granted
temporary control privileges, such as exclusive access for a period of time.
Secondary control is often necessary for services that provide adapters for
exclusive system resources that are not easily time-shared among multiple 
clients.

.. _`intersect:arch:ms:capability:infrastructure:utility`:

Capability Definitions for General Service Utilities
----------------------------------------------------

.. toctree::
   :maxdepth: 1

   capabilities/general-availability.rst
   capabilities/general-controller.rst
   capabilities/general-param-config.rst
   capabilities/general-uuid-gen.rst
