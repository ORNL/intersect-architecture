.. _intersect:arch:pat:catalog:strategic:control:

Experiment Control
^^^^^^^^^^^^^^^^^^

Name
   Experiment Control

Context
   The pattern applies to a system with the following characteristics:

   -  An experiment plan exists that lists the predetermined actions to be
      performed while running the experiment.

   -  Actuators may exist to allow for moving or controlling something
      before, during and/or after running the experiment.

   -  Sensors may exist to allow for measuring something before, during
      and/or after running the experiment.

   -  Instruments may exist that contain sensors and potentially actuators.

   -  Robots may exist that contain actuators and potentially sensors and
      that execute predetermined actions from the experiment plan in an
      automated or autonomous fashion.

Problem
   Certain predetermined actions need to be performed while running an
   experiment.

Forces
   Only pre-experiment conditions are considered in performing the
   predetermined actions while running an experiment. Only safety-related
   conditions during the experiment may be considered. Other changing
   conditions during the experiment or post-experiment conditions are not
   considered.

Solution
   An experiment controller executes an experiment using a predetermined
   experiment plan
   (:numref:`intersect:arch:pat:catalog:strategic:control:components`). The
   plan’s execution is automated, performed in an open loop control and may
   involve human interaction. The controller may monitor the experiment for
   safety reasons. The plan contains a complete description of the
   predetermined actions to be performed for running the experiment,
   including any safety-related responses.

   .. figure:: control/components.png
      :name: intersect:arch:pat:catalog:strategic:control:components
      :align: center
      :alt: Pattern components and control/data flow

      Experiment Control strategic pattern components and control/data flow

   This pattern offers an open loop control with safety-related feedback on
   the experiment only. Experiment plan execution is automated, i.e., its
   list of actions is performed without external or human intervention that
   can unnecessarily hold up execution. Only 1 experiment is being
   controlled.

Resulting Context
   An experiment is executed automatically using a predetermined plan.

Related Patterns
   The :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern
   extends this strategic pattern with a closed loop control and feedback on
   experiment progress. The :ref:`intersect:arch:pat:catalog:strategic:design`
   and :ref:`intersect:arch:pat:catalog:strategic:workflow` strategic patterns
   rely on this strategic pattern for automatically executing a predetermined
   experiment plan.

   This strategic pattern is implemented by the
   :ref:`intersect:arch:pat:catalog:architectural:local_control` and
   :ref:`intersect:arch:pat:catalog:architectural:distributed_control`
   architectural patterns.

Examples
   A robot-controlled chemistry laboratory science use case implements the
   Experiment Control strategic pattern, as a robot automates experiment
   execution. There is only safety-related feedback, such as to stop the
   robot in case of an emergency. The individual pattern components are as
   follows:

   -  The experiment plan is the sequence of predetermined steps and
      associated parameters necessary to run the experiment. The
      predetermined steps include the parameters for synthesizing the
      chemical compound, route navigation instructions for the robot to
      move the sample between the different synthesis and characterization
      stations, parameters for characterizing the synthesized chemical
      compound, and safety related feedback instructions.

   -  The experiment controller is a central workstation that is able to
      command and control the robot, synthesis equipment, analytical
      instruments, and any data and computing resources for analyzing the
      measurement data.

   -  The test performed in an experiment characterizes the synthesized
      chemical compound.

   -  The experiment result is a combination of the sample characterization
      results.

Known Uses
   This strategic pattern is used in every experiment, where the
   predetermined experiment plan is automatically executed. The only
   feedback is related to safety, such as to perform an emergency stop of
   the experiment when a chemistry laboratory is on fire. This pattern is
   the starting point for any other pattern, as any feedback implemented by
   the Experiment Steering or Design of Experiment patterns and any
   orchestration of multiple experiments by the Experiment Workflow pattern
   require the automatic execution of a predetermined experiment plan.
