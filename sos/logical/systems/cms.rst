.. _intersect:arch:sos:logical:systems:cms:

Campaign Management System
--------------------------

A :term:`campaign` is a scientific endeavor that may consist of one or more
experiments that may take place sequentially or in parallel to answer a
broader overarching scientific question. The :term:`Campaign Management System
(CMS)<CMS>` enables the orchestration of such :term:`campaign`\ s using other
logical systems, such as the :ref:`intersect:arch:sos:logical:systems:ors`,
using :term:`campaign` templates and recipes. The :term:`CMS` has the following
services and microservice capabilities (mapping the :ref:`intersect:arch:sos`
to the :ref:`intersect:arch:ms`):

- Campaign Template Service

  - Campaign Template Management Capability: *Create, read, update, and delete campaign template*

- Campaign Template Catalog Service

  - Campaign Template Catalog Capability: *Find a campaign template in the catalog*

- Campaign Service

  - Campaign Management Capability: *Create, read, update, start. stop, and delete campaign*

- Campaign Catalog Service

  - Campaign Catalog Capability: *Find a campaign in the catalog*

.. admonition:: Minimum requrement
   :name: intersect:arch:sos:logical:systems:cms:minimum

   At minimum, there must be one and only one :term:`CMS` in an
   :term:`INTERSECT` federated ecosystem, as the :term:`CMS` spans over the
   infrastructure systems within the same :term:`INTERSECT` federated
   ecosystem. Individual services of the :term:`CMS` may be distributed
   across infrastructure systems as needed, where some services may only exist
   once.

.. admonition:: Optional requrement
   :name: intersect:arch:sos:logical:systems:cms:optional

   Optionally, multiple :term:`INTERSECT` federated ecosystems may exist that
   operate either completely indepenently from each other or collaborate with
   each other, but each :term:`INTERSECT` federated ecosystem has only one (its
   own) :term:`CMS`.
