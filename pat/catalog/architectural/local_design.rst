.. _intersect:arch:pat:catalog:architectural:local_design:

Local Design of Experiments
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Name
   Local Design of Experiments

Context
   The pattern applies to a system with the following characteristics:

   -  An experiment design plan exists that lists the predetermined actions
      to be performed for creating a new experiment plan based on prior
      experiment results.

   -  An initial experiment plan exists that lists the predetermined
      actions to be performed while running the experiment.

   -  A local experiment planner exists that creates the new experiment
      plan based on prior experiment results.

   -  A local experiment controller exists that executes the predetermined
      actions to be performed while running the experiment.

   -  A local experiment analyzer exists that orients the observed
      information for the experiment planner.

   -  Sensors exist to allow for measuring experiment results.

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
   Certain predetermined actions need to be performed to run a set of
   similar experiments with different experiment plan parameters, depending
   on experiment results. Experiment results are analyzed and judged
   locally. There are no remote components that could incur a significant
   communication delay.

Forces
   Only pre- and post-experiment conditions are considered in performing
   the predetermined actions to run a set of similar experiments with
   different experiment plan parameters. Only safety-related conditions
   during the experiment may be considered. Other changing conditions
   during the experiments are not considered, unless the
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern is
   being used in conjunction with this architectural pattern, such as by using
   the :ref:`intersect:arch:pat:catalog:architectural:local_steering` or
   :ref:`intersect:arch:pat:catalog:architectural:distributed_steering`
   architectural patterns.

   Experiment results are analyzed and judged without significant
   communication delay to remote components. Proper computational analysis
   and decision making capability must be present locally to be able to
   respond within a certain amount of time.

Solution
   The is pattern implements the
   :ref:`intersect:arch:pat:catalog:strategic:design` strategic pattern
   using an :term:`OODA` loop control. All components of the :term:`OODA` loop
   control are local, i.e., physically located and connected in a way that does
   not incur a significant communication delay between the components.

   As in the :ref:`intersect:arch:pat:catalog:strategic:design` strategic
   pattern, an experiment controller executes each experiment using a
   predetermined experiment plan
   (:numref:`intersect:arch:pat:catalog:architectural:local_design:components`).
   The plan’s execution is automated, performed in an open loop control and
   may involve human interaction. The controller may monitor the experiment
   for safety reasons. The experiment plan contains a complete description
   of the predetermined actions to be performed for running the experiment,
   including any safety-related responses. An experiment planner creates
   the experiment plan, based on an experiment design plan and prior
   experiment results (if any). The experiment plan change is autonomous,
   performed in a closed loop control and may involve human interaction.
   The experiment design plan contains an initial experiment plan and a
   plan for creating new experiment plans based on experiment results,
   including how to analyze and judge experiment results and change the
   plan accordingly. Raw experiment data may be post-processed by an
   optional component, such as to identify features.

   .. figure:: local_design/components.png
      :name: intersect:arch:pat:catalog:architectural:local_design:components
      :align: center
      :alt: Pattern components and control/data flow

      Local Design of Experiments architectural pattern components and
      control/data flow

   The :term:`OODA` loop control is formed by sensors that observe the experiment,
   an analyzer that orients the observed information, an experiment planner
   that decides on appropriate actions, and an experiment controller and
   actuators that perform the appropriate actions. As all components of the
   :term:`OODA` loop control are local, a shared storage device may be used between
   them for sensor, analyzer, planner and controller data. Control messages
   between these components orchestrate the control flow.

   This pattern offers an open loop control with safety-related feedback on
   the experiment and a separate closed :term:`OODA` loop control with feedback on
   experiment results. Experiment plan execution is automated within the
   open loop control, i.e., its list of actions is performed without
   external or human intervention that can unnecessarily hold up execution.
   Experiment design plan execution is autonomous, i.e., it creates a new
   experiment plan after each experiment based on experiment results and is
   performed without external or human intervention that can unnecessarily
   hold up execution. A set of similar experiments with different
   experiment plan parameters is controlled. There is no significant
   communication delay to remote components in the open loop control, as
   the experiment controller is local. There is also no significant
   communication delay to remote components in the closed :term:`OODA` loop
   control, as the experiment result analysis and experiment planner are
   local as well.

Resulting Context
   An experiment is executed autonomously with different experiment plan
   parameters using a predetermined experiment plan, with the plan’s
   parameters changing autonomously between experiments based on experiment
   results. Experiment results are analyzed and judged locally, i.e.,
   without significant communication delay to remote components.

Related Patterns
   This architectural pattern implements the
   :ref:`intersect:arch:pat:catalog:strategic:design` strategic pattern. It
   relies on the :ref:`intersect:arch:pat:catalog:strategic:control` strategic
   pattern for automatically executing a predetermined experiment plan. This
   architectural pattern can be extended using the
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern
   (instead of the :ref:`intersect:arch:pat:catalog:strategic:control` strategic
   pattern) for autonomously executing a predetermined experiment plan, with the
   plan’s parameters changing autonomously during experiments based on
   experiment progress. Such extension may involve the
   :ref:`intersect:arch:pat:catalog:architectural:local_steering` or
   :ref:`intersect:arch:pat:catalog:architectural:distributed_steering`
   architectural patterns.

   In contrast to this architectural pattern, the
   :ref:`intersect:arch:pat:catalog:architectural:distributed_design`
   architectural pattern analyzes and potentially also judges experiment results
   remotely, i.e., with significant communication delay to remote components.

Examples
   An :term:`ACL` science use case implements the Local Design of Experiments
   architectural pattern, as all components (planner, controller(s), robot,
   synthesis station(s), and characterization station(s)) are local, i.e., in
   close physical and logical proximity with no significant latency (for
   communication or sample movement) to remote components.

   The experiment is a complex sequence of steps involving multiple instruments,
   actuators, sensors, etc. Thus, the experiment itself could be considered a
   :ref:`intersect:arch:pat:catalog:architectural:local_workflow` architectural
   pattern using a sequence of
   :ref:`intersect:arch:pat:catalog:architectural:local_control` architectural
   patterns. Examples of steps that constitute the
   :ref:`intersect:arch:pat:catalog:architectural:local_workflow` architecture
   include the synthesis step and each of the individual characterization steps,
   such as the gas chromatography, high performance liquid chromatography, and
   X-ray microscopy. Some of these steps could potentially be performed in
   parallel if the sample were broken down into pieces such that the pieces
   could be analyzed by the characterization instruments in parallel. There is
   a significant overlap of the different components of the patterns, as the
   same shared storage is being used, for example.
   
Known Uses
   This architectural pattern is used in every experiment, where feedback
   of experiment results is being used to autonomously change the
   parameters of the next experiment(s) using components that are all
   local, i.e., in close physical and logical proximity with no significant
   latency (for communication or sample movement) to remote components.
   Known uses range from having simple linear or random parameter scan to
   complex probabilistic approaches (e.g., Bayesian design of experiments)
   or domain science informed AI (e.g., physics-informed design of
   experiments) in the feedback loop.
