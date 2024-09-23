.. _intersect:arch:sos:logical:systems:ors:

Orchestration System
--------------------

:ref:`intersect:arch:sos:logical:systems:ors:tasks` are used to abstract the
activities within the :term:`INTERSECT` federated ecosystem. The
:term:`Orchestration System (OrS)<OrS>` facilitates the interaction between
systems, subsystems and services by managing the needed
:ref:`intersect:arch:sos:logical:systems:ors:tasks` using
:ref:`intersect:arch:sos:logical:systems:ors:workflows`. The :term:`OrS`
places and schedules the execution of
:ref:`intersect:arch:sos:logical:systems:ors:tasks` on the respective
:ref:`intersect:arch:sos:logical:systems` they need to be executed. It relies
on the :ref:`intersect:arch:sos:logical:systems:ims` for gathering availability
status information, allocating compute resources, and execution.

.. todo::

   Provide more detailed informationabout the services and microservice
   capabilities in the :term:`OrS`.

..
   The :term:`OrS` has
   the following services and microservice capabilities (mapping the
   :ref:`intersect:arch:sos` to the :ref:`intersect:arch:ms`):

   - Service 1

     - Microservice 1

     - Microservice 2
  
   - Service 2

     - Microservice 1

     - Microservice 2

.. toctree::
   :maxdepth: 1
   :name: intersect:arch:sos:logical:systems:ors:toc
   :caption: Components of the Orchestration System

   ors/tasks
   ors/workflows

.. admonition:: Minimum requrement
   :name: intersect:arch:sos:logical:systems:ors:minimum

   At minimum, there must be one and only one :term:`OrS` in an
   :term:`INTERSECT` federated ecosystem, as the :term:`OrS` spans over the
   infrastructure systems within the same :term:`INTERSECT` federated
   ecosystem. Individual services of the :term:`OrS` may be distributed
   across infrastructure systems as needed, where some services may only exist
   once.

.. admonition:: Optional requrement
   :name: intersect:arch:sos:logical:systems:ors:optional

   Optionally, multiple :term:`INTERSECT` federated ecosystems may exist that
   operate either completely indepenently from each other or collaborate with
   each other, but each :term:`INTERSECT` federated ecosystem has only one (its
   own) :term:`OrS`.

.. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Old Content - Needs to be reworked!
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
   The :term:`Orchestration System (OrS)<OrS>` facilitates the interaction between
   the different actors, such as instrument adapters and compute services, that
   are part of a campaign. A service instance is started by an infrastructure
   service (i.e., launch service). Alternatively, a user may start an orchestrator
   instance manually. If the :term:`OrS` manages the creation of the orchestrator
   instance. The startup is triggered by an event (command). The event can come
   from a scheduling service or a :term:`HMI`.
   
   During the creation of the campaign environment, the orchestrator will connect
   to the individual instruments and services and configure them for the
   experiments, or start services required by the campaign if they do not already
   exist.
   
   .. admonition:: Example
   
      .. figure:: ors/tasks.png
         :name: intersect:arch:sos:logical:systems:ors:tasks_old
         :align: center
         :width: 600
   
         Tasks
   
   .. admonition:: Example
   
      .. code-block::
   
         a = initInstrument(‘a.infrastructure.intersect.example.tld’)
         b = initInstrument(‘b.infrastructure.intersect.example.tld’)
         c = initInstrument(‘c.infrastructure.intersect.example.tld’)
   
         da = a.takePicture(config)
         % intersect.move(from: da.filepath, to: b)
         da2 = b.analyze(da)
         % intersect.move(from: da2.filepath, to: c)
         c.store(da2)
   
   .. admonition:: Example
   
      .. figure:: ors/example1.png
         :name: intersect:arch:sos:logical:systems:ors:example1
         :align: center
         :width: 800
   
         Example 1
   
   .. admonition:: Example
   
      .. figure:: ors/example2.png
         :name: intersect:arch:sos:logical:systems:ors:example2
         :align: center
         :width: 800
   
         Example 2
   
   .. todo::
   
     - Improve the diagrams
     - Add sequence diagram
     - Link to the sequence diagram
   
   
   Orchestrator:
   
   An Orchestrator is a dynamic service with (at least) one service instance for
   each campaign. The orchestrator is controlling the execution of the campaign,
   or a subset of the campaign. It can be compared to the controller in the
   :ref:`intersect:arch:pat`. Once the service is started up, it will initialize
   the campaign. Initialization consists of fetching the campaign configuration
   and creation of the campaign environment. An Orchestrator instance has the
   following states:
   
   Initializing
      The Orchestrator is initializing the Campaign Environment
   
   Running
      The Campaign is running, and the Orchestrator is busy
   
   Finalizing
      The Orchestrator is cleaning up the Campaign Environment
   
   Options:
   
   - Local orchestration
   
       - Orchestrator is running on a local resource (i.e., the instrument control computer)

   - Remote orchestration

       - The orchestrator is running remote (i.e., in a hosted [^SO_1] container)

   - Distributed?

       - Multiple orchestrators coordinate a campaign

   - Automated

       - A campaign is scheduled for execution and the experiment plan is executed automatically

   - Interactive
       - The campaign is started, and possibly controlled, by a scientist or operator
   
