.. _intersect:arch:pat:catalog:strategic:workflow:

Multi-Experiment Workflow
^^^^^^^^^^^^^^^^^^^^^^^^^

Name
   Multi-Experiment Workflow

Context
   The pattern applies to a system with the following characteristics:

   -  A multi-experiment workflow plan exists that lists the predetermined
      actions to be performed for executing each experiment plan.

   -  An experiment plan exists for each experiment that lists the
      predetermined actions to be performed while running the experiment.

   -  Actuators may exist to allow for moving or controlling something
      before, during and/or after running the experiment.

   -  Sensors may exist to allow for measuring something before, during
      and/or after running the experiment.

   -  Instruments may exist that contain sensors and potentially actuators.

   -  Robots may exist that contain actuators and potentially sensors and
      that execute predetermined actions from the experiment plan in an
      automated or autonomous fashion.

Problem
   Certain predetermined actions need to be performed to run a set of
   experiments in serial (one after another) and/or in parallel
   (simultaneously).

Forces
   Only pre- and post-experiment conditions are considered in performing
   the predetermined actions to run the set of experiments in serial and/or
   parallel. Safety-related conditions during the experiments may be
   considered. Only pre-experiment conditions are considered in performing
   the predetermined actions while running each experiment individually,
   unless the Experiment Steering strategic pattern or the Design of
   Experiments strategic pattern are being used for some or all
   experiments. If the Experiment Steering strategic pattern is being used
   for a particular experiment, then changing conditions during this
   experiment are considered in performing the predetermined actions while
   running it. If the Design of Experiments strategic pattern is being used
   for a particular experiment, then post-experiment conditions are
   considered in performing the predetermined actions to run it with
   different experiment plan parameters.

Solution
   A multi-experiment workflow controller orchestrates the execution of the
   experiments using a predetermined multi-experiment workflow plan
   (:numref:`intersect:arch:pat:catalog:strategic:workflow:components`). The
   multi-experiment workflow plan’s execution is automated, performed in an
   open loop control and may involve human interaction. The
   multi-experiment workflow controller may monitor one or more experiment
   controllers for dependency reasons. The multi-experiment workflow plan
   contains a complete description of the predetermined actions to be
   performed for orchestrating the execution of the experiments including
   any dependency-related responses.

   .. figure:: workflow/components.png
      :name: intersect:arch:pat:catalog:strategic:workflow:components
      :align: center

      Multi-Experiment Workflow strategic pattern components and control/data flow

   Multiple experiment controllers execute their experiments using their
   predetermined experiment plan. Each plan’s execution is automated,
   performed in an open loop control and may involve human interaction.
   Each experiment controller may monitor the experiment for safety
   reasons. Each experiment plan contains a complete description of the
   predetermined actions to be performed for running its experiment,
   including any safety-related responses.

   Some experiments may be executed in parallel, as they do not depend on
   each other, while other experiment may be executed in serial due to
   dependencies. The orchestration of the execution follows a :term:`DAG` with
   the experiments as vertices and the edges as dependencies
   (:numref:`intersect:arch:pat:catalog:strategic:workflow:dag`). A dependency
   between experiments may arise when one experiment needs the result of
   another.

   .. figure:: workflow/dag.png
      :name: intersect:arch:pat:catalog:strategic:workflow:dag
      :align: center
      :alt: Pattern components and control/data flow

      Example of a Multi-Experiment Workflow strategic pattern directed acyclic graph

   This pattern offers an open loop control with safety-related feedback on
   each experiment and a separate loop control with safety-related feedback
   for each experiment. Experiment plan execution is automated within the
   open loop control for each experiment, i.e., its list of actions is
   performed without external or human intervention that can unnecessarily
   hold up execution. Multi-experiment workflow plan execution is automated
   within the open loop control for all experiments, i.e., its list of
   actions is performed without external or human intervention that can
   unnecessarily hold up execution. A set of serial and/or parallel
   experiments is controlled.

Resulting Context
   Experiments are executed automatically in serial and/or parallel using a
   predetermined plan.

Related Patterns
   This strategic pattern relies on the
   :ref:`intersect:arch:pat:catalog:strategic:control` strategic pattern for
   automatically executing each predetermined experiment plan. This strategic
   pattern can be extended using the
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern
   (instead of the :ref:`intersect:arch:pat:catalog:strategic:control`
   strategic pattern) for autonomously executing some or all predetermined
   experiment plans, with each plan’s parameters changing autonomously during
   experiments based on progress. This strategic pattern can also be extended
   using the :ref:`intersect:arch:pat:catalog:strategic:design` strategic
   pattern for autonomously executing some or all predetermined experiment
   plans, with each plan’s parameters changing autonomously between experiments
   based on results. The :ref:`intersect:arch:pat:catalog:strategic:control`,
   :ref:`intersect:arch:pat:catalog:strategic:steering` and
   :ref:`intersect:arch:pat:catalog:strategic:design` strategic patterns can be
   used together in conjunction with this strategic pattern, individually for
   each experiment of the multi-experiment workflow. However, the
   :ref:`intersect:arch:pat:catalog:strategic:control` and
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic patterns are
   mutually exclusive for the same experiment, as the
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern
   extends the
   :ref:`intersect:arch:pat:catalog:strategic:control` strategic pattern.

Examples
   In the :term:`ACL` science use case, the
   experiment is a complex sequence of steps involving multiple
   instruments, actuators, sensors, etc. Thus, the experiment itself could
   be considered a Multi-Experiment Workflow strategic pattern using a
   sequence of :ref:`intersect:arch:pat:catalog:strategic:control` strategic
   patterns. Examples of steps that constitute the Multi-Experiment Workflow
   strategic pattern include the synthesis step and each of the individual
   characterization steps, such as the gas chromatography, high performance
   liquid chromatography, and X-ray microscopy. Some of these steps could
   potentially be performed in parallel if the sample were broken down into
   pieces such that the pieces could be analyzed be the characterization
   instruments in parallel.

Known Uses
   This strategic pattern is used every time a set of experiments are
   performed. Very common examples are (1) a set of parallel experiments
   that investigate the same physical sample that is getting split up
   beforehand, or (2) a set of serial experiments that investigate the same
   physical sample that is getting moved from one experiment to the next.
   Each of these experiments investigates different properties, where the
   overall combination of the experiment results may be part of a bigger
   experiment that encompasses them.
