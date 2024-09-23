.. _intersect:arch:pat:catalog:architectural:local_steering:

Local Experiment Steering
^^^^^^^^^^^^^^^^^^^^^^^^^

Name
   Local Experiment Steering

Context
   The pattern applies to a system with the following characteristics:

   -  An experiment plan exists that lists the predetermined actions to be
      performed while running the experiment, including potential parameter
      changes based on experiment progress.

   -  A local experiment controller exists that executes the predetermined
      actions to be performed while running the experiment.

   -  A local experiment analyzer exists that orients the observed
      information for the experiment controller.

   -  Sensors exist to allow for measuring experiment progress.

   -  Actuators may exist to allow for moving or controlling something
      before, during and/or after running the experiment.

   -  Additional sensors may exist to allow for measuring something before,
      during and/or after running the experiment.

   -  Instruments may exist that contain sensors and potentially actuators.

   -  Robots may exist that contain actuators and potentially sensors and
      that execute predetermined actions from the experiment plan in an
      automated or autonomous fashion.

   -  A component may exist that post-processes raw experiment data, such
      as to identify features.

Problem
   Certain predetermined actions need to be performed while running an
   experiment to positively influence experiment progress. Experiment
   progress is analyzed and judged locally. There are no remote components
   that could incur a significant communication delay.

Forces
   Only pre-experiment conditions and changing conditions during the
   experiment are considered in performing the predetermined actions while
   running an experiment. Post-experiment conditions are not considered.

   Experiment progress is analyzed and judged without significant
   communication delay to remote components. Proper computational analysis
   and decision making capability must be present locally to be able to
   respond within a certain amount of time.

Solution
   The is pattern implements the
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern using
   an :term:`OODA` loop control. All components of the :term:`OODA` loop control
   are local, i.e., physically located and connected in a way that does not
   incur a significant communication delay between the components.

   As in the :ref:`intersect:arch:pat:catalog:strategic:steering` strategic
   pattern, an experiment controller executes an experiment using a
   predetermined experiment plan and changes the plan’s parameters during
   execution based on experiment progress
   (:numref:`intersect:arch:pat:catalog:architectural:local_steering:components`).
   The plan’s execution is autonomous, performed in a closed loop control
   and may involve human interaction. The controller may monitor the
   experiment for safety reasons. The plan contains a complete description
   of the predetermined actions to be performed for running the experiment,
   including any safety-related responses and how to analyze and judge
   experiment progress and change the plan accordingly. Raw experiment data
   may be post-processed by an optional component, such as to identify
   features.

   .. figure:: local_steering/components.png
      :name: intersect:arch:pat:catalog:architectural:local_steering:components
      :align: center

      Local Experiment Steering architectural pattern components and
      control/data flow

   The :term:`OODA` loop control is formed by sensors that observe the experiment,
   an analyzer that orients the observed information, an experiment
   controller that decides on appropriate actions and actuators that
   perform the appropriate actions. As all components of the :term:`OODA` loop
   control are local, a shared storage device may be used between them for
   sensor, analyzer and controller data. Control messages between these
   components orchestrate the control flow.

   This pattern offers a closed :term:`OODA` loop control with safety-related
   feedback on the experiment and feedback on experiment progress.
   Experiment plan execution is autonomous, i.e., its list of actions
   changes during execution based on feedback and is performed without
   external or human intervention that can unnecessarily hold up execution.
   Only 1 experiment is being controlled. There is no significant
   communication delay to remote components in the closed :term:`OODA` loop
   control, as the experiment progress analysis is local and the experiment
   controller is local as well.

Resulting Context
   An experiment is executed autonomously using a predetermined experiment
   plan, with the plan’s parameters changing autonomously during the
   experiment based on experiment progress. Experiment progress is analyzed
   and judged locally, i.e., without significant communication delay to
   remote components.

Related Patterns
   This architectural pattern implements the
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern.

   In contrast to this architectural pattern, the
   :ref:`intersect:arch:pat:catalog:architectural:distributed_steering`
   architectural pattern analyzes and potentially also judges experiment
   progress remotely, i.e., with significant communication delay to remote
   components.

Examples
   The :term:`AGILE` science use case implements the Local Experiment
   Steering architectural pattern, as an ongoing emulation of a real-world
   energy system and power grid is guided by a local analysis of frequent
   periodic real-time experiment data in a simulation. At the architectural
   pattern level of abstraction, the individual pattern components are as
   follows:

   -  In addition to the properties identified by the
      :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern,
      the local experiment controller supervises and regulates the GRID-C
      :term:`PE` nodes in real time.

   -  The local analysis component is a separate NVIDIA DGX system that runs
      the additional emulation/simulation at different granularities with
      real-time feedback to the controller.

   Although different networked systems are used for control, analysis, and
   emulation, this science use case follows the Local Experiment Steering
   architectural pattern, as the control and data flow has real-time
   characteristics in the microsecond range.

Known Uses
   This architectural pattern is used in every experiment, where live
   feedback of locally analyzed experiment data is being used to
   autonomously change experiment parameters. A real-time feedback loop is
   feasible, as there are no remote components that could incur a
   significant communication delay.
