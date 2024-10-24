.. _intersect:arch:pat:catalog:architectural:distributed_control:

Distributed Experiment Control
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Name
   Distributed Experiment Control

Context
   The pattern applies to a system with the following characteristics:

    -  An experiment plan exists that lists the predetermined actions to be
       performed while running the experiment.

    -  A remote experiment controller exists that executes the predetermined
       actions to be performed while running the experiment.

    -  Actuators may exist to allow for moving or controlling something
       before, during and/or after running the experiment.

    -  Sensors may exist to allow for measuring something before, during
       and/or after running the experiment.

    -  Instruments may exist that contain sensors and potentially actuators.

    -  Robots may exist that contain actuators and potentially sensors and
       that execute predetermined actions from the experiment plan in an
       automated or autonomous fashion.

    -  A component may exist that post-processes raw experiment data, such
       as to identify features.

Problem
   Certain predetermined actions need to be performed while running an
   experiment. A remote experiment controller executes an experiment,
   incurring a potentially significant communication delay.

Forces
   Only pre-experiment conditions are considered in performing the
   predetermined actions while running an experiment. Only safety-related
   conditions during the experiment may be considered. Other changing
   conditions during the experiment or post-experiment conditions are not
   considered.

   Experiment actions are controlled with significant communication delay
   to remote components. Proper control capability does not need to be
   local, but must be able to act in time.

Solution
   The is pattern implements the
   :ref:`intersect:arch:pat:catalog:strategic:control` strategic pattern. A
   remote experiment controller executes an experiment using a predetermined
   experiment plan
   (:numref:`intersect:arch:pat:catalog:architectural:distributed_control:components`).
   The plan’s execution is automated, performed in an open loop control and
   may involve human interaction. The controller may monitor the experiment
   for safety reasons. The plan contains a complete description of the
   predetermined actions to be performed for running the experiment,
   including any safety-related responses. Raw experiment data may be
   post-processed by an optional component, such as to identify features.

   .. figure:: distributed_control/components.png
      :name: intersect:arch:pat:catalog:architectural:distributed_control:components
      :align: center
      :alt: Pattern components and control/data flow

      Distributed Experiment Control architectural pattern components and
      control/data flow

   As the experiment controller is remote, component-local storage and
   explicit data transfer between components may be used for sensor and
   controller data. Control messages between these components orchestrate
   the control flow.

   This pattern offers an open loop control with safety-related feedback on
   the experiment only. Experiment plan execution is automated, i.e., its
   list of actions is performed without external or human intervention that
   can unnecessarily hold up execution. Only 1 experiment is being
   controlled. There is a significant communication delay to remote
   components in the open loop control, as the experiment controller is
   remote.

Resulting Context
   An experiment is executed automatically using a predetermined plan
   executed by a remote experiment controller, i.e., with significant
   communication delay to remote components.

Related Patterns
   This architectural pattern implements the
   :ref:`intersect:arch:pat:catalog:strategic:control` strategic pattern.

   In contrast to this architectural pattern, the
   :ref:`intersect:arch:pat:catalog:architectural:local_control` architectural
   pattern executes a predetermined plan using a local experiment controller,
   i.e., without significant communication delay to remote components.

Examples
   A robot-controlled chemistry laboratory science use case can implement
   the Distributed Experiment Control strategic pattern, as a robot
   automates experiment execution. There is only safety-related feedback,
   such as to stop the robot in case of an emergency. The experiment
   controller, a scientist’s laptop, is remote and connected to the
   robot-controlled chemistry laboratory over the Internet. The individual
   pattern components are as follows:

   -  The experiment plan is the sequence of predetermined steps and
      associated parameters necessary to run the experiment. The
      predetermined steps include the parameters for synthesizing the
      chemical compound, route navigation instructions for the robot to
      move the sample between the different synthesis and characterization
      stations, parameters for characterizing the synthesized chemical
      compound, and safety related feedback instructions.

   -  The remote experiment controller is a scientist’s laptop that is able
      to command and control the robot, synthesis equipment, analytical
      instruments, and any data and computing resources for analyzing the
      measurement data.

   -  The test performed in an experiment characterizes the synthesized
      chemical compound.

   -  The experiment result is a combination of the sample characterization
      results.

Known Uses
   This strategic pattern is used in every experiment, where the
   predetermined experiment plan is automatically executed by a remote
   controller. This is a rather rare use case, as the communication latency
   between a remote controller and the test is often too long. The only
   feedback is related to safety, such as to perform an emergency stop of
   the experiment when a chemistry laboratory is on fire. This pattern is
   the starting point for other patterns, as any feedback implemented by
   the :ref:`intersect:arch:pat:catalog:architectural:distributed_steering` or
   :ref:`intersect:arch:pat:catalog:architectural:distributed_design` patterns
   and any orchestration of multiple experiments by the
   :ref:`intersect:arch:pat:catalog:architectural:local_workflow` and
   :ref:`intersect:arch:pat:catalog:architectural:distributed_workflow`
   patterns require the automatic execution of a predetermined experiment plan.
