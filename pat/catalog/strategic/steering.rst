.. _intersect:arch:pat:catalog:strategic:steering:

Experiment Steering
^^^^^^^^^^^^^^^^^^^

Name
   Experiment Steering

Context
   The pattern applies to a system with the following characteristics:

   -  An experiment plan exists that lists the predetermined actions to be
      performed while running the experiment, including potential parameter
      changes based on experiment progress.

   -  Sensors exist to allow for measuring experiment progress.

   -  Actuators may exist to allow for moving or controlling something
      before, during and/or after running the experiment.

   -  Additional sensors may exist to allow for measuring something before,
      during and/or after running the experiment.

   -  Instruments may exist that contain sensors and potentially actuators.

   -  Robots may exist that contain actuators and potentially sensors and
      that execute predetermined actions from the experiment plan in an
      automated or autonomous fashion.

Problem
   Certain predetermined actions need to be performed while running an
   experiment to positively influence experiment progress.

Forces
   Only pre-experiment conditions and changing conditions during the
   experiment are considered in performing the predetermined actions while
   running an experiment. Post-experiment conditions are not considered.

Solution
   An experiment controller executes an experiment using a predetermined
   experiment plan and changes the plan’s parameters during execution based
   on experiment progress
   (:numref:`intersect:arch:pat:catalog:strategic:steering:components`). The
   plan’s execution is autonomous, performed in a closed loop control and
   may involve human interaction. The controller may monitor the experiment
   for safety reasons. The plan contains a complete description of the
   predetermined actions to be performed for running the experiment,
   including any safety-related responses and how to analyze and judge
   experiment progress and change the plan accordingly.

   .. figure:: steering/components.png
      :name: intersect:arch:pat:catalog:strategic:steering:components
      :align: center

      Experiment Steering strategic pattern components and control/data flow

   This pattern offers a closed loop control with safety-related feedback
   on the experiment and feedback on experiment progress. Experiment plan
   execution is autonomous, i.e., its list of actions changes during
   execution based on feedback and is performed without external or human
   intervention that can unnecessarily hold up execution. Only 1 experiment
   is being controlled.

Resulting Context
   An experiment is executed autonomously using a predetermined experiment
   plan, with the plan’s parameters changing autonomously during the
   experiment based on experiment progress.

Related Patterns
   This strategic pattern is an extension of the
   :ref:`intersect:arch:pat:catalog:strategic:control` strategic pattern
   with an added closed loop control and feedback on experiment progress. The
   :ref:`intersect:arch:pat:catalog:strategic:design` and
   :ref:`intersect:arch:pat:catalog:strategic:workflow` strategic patterns can
   be extended using this strategic pattern for autonomously executing a
   predetermined experiment plan, with the plan’s parameters changing
   autonomously during experiments based on experiment progress.

   This strategic pattern is implemented by the
   :ref:`intersect:arch:pat:catalog:architectural:local_steering` and
   :ref:`intersect:arch:pat:catalog:architectural:distributed_steering`
   architectural patterns.

Examples
   An autonomous microscopy science use case :cite:`doi:10.1021/acsnano.1c02104`
   implements the Experiment Steering strategic pattern, as an ongoing :term:`STEM`
   experiment is controlled by analyses of periodic experiment data. At the
   strategic pattern level of abstraction, the individual pattern
   components are as follows:

   -  The experiment plan contains a complete description of the
      predetermined actions to be performed for running the experiment,
      including any parameters for operating the :term:`STEM`, safety-related
      responses and how to analyze and judge experiment progress and change
      the plan accordingly. The experiment plan also contains the goal of
      the experiment to steer it in the right direction and to stop its
      closed loop control upon completion.

   -  The experiment controller executes an experiment using a
      predetermined experiment plan and changes the plan’s parameters
      during execution based on experiment progress. The plan’s execution
      is autonomous, performed in a closed loop control and may involve
      human interaction.

   -  The test performed in an experiment determines the properties of
      microscopic structures.

   -  The experiment result is a combination of raw and analyzed STEM data
      and insights derived from this data.

Known Uses
   This strategic pattern is used in every experiment, where live feedback
   of experiment data is being used to autonomously change parameters
   during the experiment. Known uses range from having simple :term:`PID`
   controller to complex probabilistic approaches or domain science
   informed :term:`AI` in the feedback loop.
