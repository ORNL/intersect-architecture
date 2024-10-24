.. _intersect:arch:pat:catalog:architectural:distributed_steering:

Distributed Experiment Steering
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Name
   Distributed Experiment Steering

Context
   The pattern applies to a system with the following characteristics:

   -  An experiment plan exists that lists the predetermined actions to be
      performed while running the experiment, including potential parameter
      changes based on experiment progress.

   -  A local or remote experiment controller exists that executes the
      predetermined actions to be performed while running the experiment.

   -  A remote experiment analyzer exists that orients the observed
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
   progress is analyzed and optionally also judged/controlled remotely,
   incurring a potentially significant communication delay.

Forces
   Only pre-experiment conditions and changing conditions during the
   experiment are considered in performing the predetermined actions while
   running an experiment. Post-experiment conditions are not considered.

   Experiment progress is analyzed and optionally also judged with
   significant communication delay to remote components. Proper
   computational analysis and decision making capability does not need to
   be local, but must be able to respond within a certain amount of time.

Solution
   The is pattern implements the
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern
   using an :term:`OODA` loop control. The *Orient* component and optionally the
   *Decide* component of the of the :term:`OODA` loop control are remote, i.e.,
   physically located and connected in a way that does incur a significant
   communication delay between the components.

   As in the :ref:`intersect:arch:pat:catalog:strategic:steering` strategic
   pattern, an experiment controller executes an experiment using a
   predetermined experiment plan and changes the plan’s parameters during
   execution based on experiment progress
   (:numref:`intersect:arch:pat:catalog:architectural:distributed_steering:components`).
   The plan’s execution is autonomous, performed in a closed loop control
   and may involve human interaction. The controller may monitor the
   experiment for safety reasons. The plan contains a complete description
   of the predetermined action to be performed for running the experiment,
   including any safety-related responses and how to analyze and judge
   experiment progress and change the plan accordingly. Raw experiment data
   may be post-processed by an optional component, such as to identify
   features.

   .. figure:: distributed_steering/components.png
      :name: intersect:arch:pat:catalog:architectural:distributed_steering:components
      :align: center
      :alt: Pattern components and control/data flow

      Distributed Experiment Steering architectural pattern components and
      control/data flow

   The :term:`OODA` loop control is formed by sensors that observe the experiment,
   an analyzer that orients the observed information, an experiment
   controller that decides on appropriate actions and actuators that
   perform the appropriate actions. As some components of the :term:`OODA` loop
   control are remote, component-local storage and explicit data transfer
   between components may be used for sensor, analyzer and controller data.
   Control messages between these components orchestrate the control flow.

   This pattern offers a closed :term:`OODA` loop control with safety-related
   feedback on the experiment and feedback on experiment progress.
   Experiment plan execution is autonomous, i.e., its list of actions
   changes during execution based on feedback and is performed without
   external or human intervention that can unnecessarily hold up execution.
   Only 1 experiment is being controlled. There is a significant
   communication delay to remote components in the closed :term:`OODA` loop
   control, as the experiment progress analysis is remotely and the
   experiment controller may be remote as well.

Resulting Context
   An experiment is executed autonomously using a predetermined experiment
   plan, with the plan’s parameters changing autonomously during the
   experiment based on experiment progress. Experiment progress is analyzed
   and potentially also judged remotely, i.e., with significant
   communication delay to remote components.

Related Patterns
   This architectural pattern implements the
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern.

   In contrast to this architectural pattern, the
   :ref:`intersect:arch:pat:catalog:architectural:local_steering` architectural
   pattern analyzes and judges experiment progress locally, i.e., without
   significant communication delay to remote components.

Examples
   An autonomous microscopy science use
   case :cite:`doi:10.1021/acsnano.1c02104`
   implements the Distributed Experiment Steering architectural pattern, as
   an ongoing :term:`STEM` experiment is controlled by remote analyses of periodic
   experiment data. At the architectural pattern level of abstraction, the
   individual pattern components are as follows:

   -  In addition to the properties identified by the Experiment Steering
      strategic pattern, the experiment controller is either local or
      remote and may feature a :term:`GUI` or some other :term:`HMI`.

   -  The actuator is part of the :term:`STEM` and moves the scanning electron
      beam.

   -  The test is performed in the :term:`STEM` experiment determines the
      properties of microscopic structures.

   -  The sensor is part of the :term:`STEM` and provides the raw microscope data.

Known Uses
   This architectural pattern is used in every experiment, where live
   feedback of remotely analyzed experiment data is being used to
   autonomously change experiment parameters. Given the potentially
   significant communication delay between the experiment and the remote
   analysis, real-time feedback loop solutions are limited.
