.. _intersect:arch:pat:catalog:strategic:design:

Design of Experiments
^^^^^^^^^^^^^^^^^^^^^

Name
   Design of Experiments

Context
   The pattern applies to a system with the following characteristics:

   -  An experiment design plan exists that lists the predetermined actions
      to be performed for creating a new experiment plan based on prior
      experiment results.

   -  An initial experiment plan exists that lists the predetermined
      actions to be performed while running the experiment.

   -  Sensors exist to allow for measuring experiment results.

   -  Actuators may exist to allow for moving or controlling something
      before, during and/or after running the experiment.

   -  Additional sensors may exist to allow for measuring something before,
      during and/or after running the experiment.

   -  Instruments may exist that contain sensors and potentially actuators.

   -  Robots may exist that contain actuators and potentially sensors and
      that execute predetermined actions from the experiment plan in an
      automated or autonomous fashion.

Problem
   Certain predetermined actions need to be performed to run a set of
   similar experiments with different experiment plan parameters, depending
   on experiment results.

Forces
   Only pre- and post-experiment conditions are considered in performing
   the predetermined actions to run a set of similar experiments with
   different experiment plan parameters. Only safety-related conditions
   during the experiment may be considered. Other changing conditions
   during the experiments are not considered, unless the Experiment
   Steering strategic pattern is being used in conjunction with this
   strategic pattern.

Solution
   An experiment controller executes each experiment using a predetermined
   experiment plan
   (:numref:`intersect:arch:pat:catalog:strategic:design:components`). The
   plan’s execution is automated, performed in an open loop control and may
   involve human interaction. The controller may monitor the experiment for
   safety reasons. The experiment plan contains a complete description of
   the predetermined actions to be performed for running the experiment,
   including any safety-related responses. An experiment planner creates
   the experiment plan, based on an experiment design plan and prior
   experiment results (if any). The experiment plan change is autonomous,
   performed in a closed loop control and may involve human interaction.
   The experiment design plan contains an initial experiment plan and a
   plan for creating new experiment plans based on experiment results,
   including how to analyze and judge experiment results and change the
   plan accordingly.

   .. figure:: design/components.png
      :name: intersect:arch:pat:catalog:strategic:design:components
      :align: center

      Design of Experiments strategic pattern components and control/data flow

   This pattern offers an open loop control with safety-related feedback on
   the experiment and a separate closed loop control with feedback on
   experiment results. Experiment plan execution is automated within the
   open loop control, i.e., its list of actions is performed without
   external or human intervention that can unnecessarily hold up execution.
   Experiment design plan execution is autonomous, i.e., it creates a new
   experiment plan after each experiment based on experiment results and is
   performed without external or human intervention that can unnecessarily
   hold up execution. A set of similar experiments with different
   experiment plan parameters is controlled.

Resulting Context
   An experiment is executed autonomously with different experiment plan
   parameters using a predetermined experiment plan, with the plan’s
   parameters changing autonomously between experiments based on experiment
   results.

Related Patterns:
   This strategic pattern relies on the
   :ref:`intersect:arch:pat:catalog:strategic:control` strategic pattern for
   automatically executing a predetermined experiment plan. This strategic
   pattern can be extended using the
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern
   (instead of the :ref:`intersect:arch:pat:catalog:strategic:control`
   strategic pattern) for autonomously executing a predetermined experiment
   plan, with the plan’s parameters changing autonomously during experiments
   based on experiment progress.

   This strategic pattern is implemented by the
   :ref:`intersect:arch:pat:catalog:architectural:local_design` and
   :ref:`intersect:arch:pat:catalog:architectural:distributed_design`
   architectural patterns.

Examples
   An :term:`ACL` science use case implements
   the Design of Experiments strategic pattern, as a robot automates
   experiment execution and the software/characterization tools in the
   feedback loop to plan the experiments to be performed. At the strategic
   pattern level of abstraction, the individual pattern components are as
   follows:

   -  The experiment design plan describes the goal, which is the desired
      chemical compound, and the logic necessary to craft subsequent
      experiments towards achieving the goal.

   -  The experiment planner is the :term:`SME` that may be substituted by a
      machine learning or deep learning model for autonomous operation to
      decide on the next experiment plan, given the results from past
      experiments.

   -  The experiment plan is the sequence of predetermined steps and
      associated parameters necessary to run the experiment. The
      predetermined steps include the parameters for synthesizing the
      chemical compound, route navigation instructions for the robots to
      move the sample between the different synthesis and characterization
      stations, parameters for characterizing the synthesized chemical
      compound, and safety related feedback instructions.

   -  The test performed in an experiment characterizes the synthesized
      chemical compound.

   -  The experiment controller is a central workstation that is able to
      command and control the robots, synthesis equipment, analytical
      instruments, and any data and computing resources for analyzing the
      measurement data.

   -  The experiment result is a combination of the sample characterization
      results.

   The experiment is a complex sequence of steps involving multiple
   instruments, actuators, sensors, etc. Thus, the experiment itself could
   be considered a :ref:`intersect:arch:pat:catalog:strategic:workflow`
   strategic pattern using a sequence of
   :ref:`intersect:arch:pat:catalog:strategic:control` strategic patterns.
   Examples of steps that constitute the
   :ref:`intersect:arch:pat:catalog:strategic:workflow` strategic pattern
   include the synthesis step and each of the individual characterization
   steps, such as the gas chromatography, high performance liquid
   chromatography, and X-ray microscopy. Some of these steps could
   potentially be performed in parallel if the sample were broken down into
   pieces such that the pieces could be analyzed by the characterization
   instruments in parallel.

Known Uses
   This strategic pattern is used in every experiment, where feedback of
   experiment results is being used to autonomously change the parameters
   of the next experiment(s). Known uses range from having simple linear or
   random parameter scan to complex probabilistic approaches (e.g.,
   Bayesian design of experiments) or domain science informed :term:`AI`
   (e.g., physics-informed design of experiments) in the feedback loop.
