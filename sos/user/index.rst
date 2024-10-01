.. _intersect:arch:sos:user:

User View
---------

The user view is a representation of a system of systems that illustrates
different user's interactions with the system. It does not include interactions
between systems, subsystems or services themselves. This view highlights the
required user facing functionality, such as:

   - A user applying for an account
  
   - A user logging into their account

   - A user submitting a campaign to run in an autonomous laboratory

   - Notifications with information needed by the user

   - Dashboards, showing information in the context of specific
     :ref:`intersect:arch:sos:user:roles`

Details about data flows, communication, and any interaction between systems,
subsystems or services are not part of this view. This includes any activity that
is not observed by the system, such as:

   - A user's physical interaction with an instrument, including connecting
     cables, turning on/off equipment, and loading/unloading a sample
     
   - Manually resetting or calibrating an instrument or manually adjusting
     certain parameters, like the magnification on a microscope.

   - Jobs running on a shared computational resource that are not part of
     the system, e.g., a climate simulation run on a supercomputer without
     the use of :term:`INTERSECT`
     
   - System monitoring and diagnostics, including for cypersecurity,
     performed by an institution operating a resource, such as a supercomputer,
     wheer sharing such sensitive information in a federated ecoisystem is not
     permitted

The user view details :ref:`intersect:arch:sos:user:roles`,
corresponding conceptual :ref:`intersect:arch:sos:user:interfaces`, and conceptual :ref:`intersect:arch:sos:user:processes` which make use of those interfaces.

.. toctree::
   :maxdepth: 1
   :name: intersect:arch:sos:user:toc
   :caption: Components of the User View

   roles
   interfaces/index
   processes/index
   
