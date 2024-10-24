.. _intersect:arch:sos:user:processes:request:

Request Resources
=================

When a user has successfully logged into the intersect system, they may
request resources. Within this process, a resource may be thought of as
either a location or a named process. For example, a URL and hash code
may be thought of as a location resource type. In contrast, Python
scrnnipts and named queries may be thought of as named process resource
types. When a user requests a resource, such as “discover
spectrophotometer instruments,” the system finds a corresponding script
to query an active registry of instrumentation returning the subset of
instrumentation corresponding to spectrophotometers. The script may also
generate custom views of the result sets such as graying out the set of
spectrophotometers that are not operational or currently in use by
someone else.

Preconditions
-------------

-  the user has successfully logged into the system

-  the user has submitted a resource query

-  a registry of resources has been compiled as a collection of NFTs and
   smart contracts describing the sharing state machine

Post-conditions
---------------

-  the resource manager has responded with a result set corresponding to
   the user’s resource query

-  the user has the option to select from the available resources based
   on a variety of filter options such as tag or entity type.
