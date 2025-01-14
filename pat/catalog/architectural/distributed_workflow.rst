.. _intersect:arch:pat:catalog:architectural:distributed_workflow:

Distributed Multi-Experiment Workflow
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Name
   Distributed Multi-Experiment Workflow

Context
   The pattern applies to a system with the following characteristics:

   -  A multi-experiment workflow plan exists that lists the predetermined
      actions to be performed for executing each experiment plan.

   -  An experiment plan exists for each experiment that lists the
      predetermined actions to be performed while running the experiment

   -  Local and remote actuators may exist to allow for moving or
      controlling something before, during and/or after running the
      experiment.

   -  Local and remote sensors may exist to allow for measuring something
      before, during and/or after running the experiment.

   -  Local and remote instruments may exist that contain sensors and
      potentially actuators.

   -  Local and remote robots may exist that contain actuators and
      potentially sensors and that execute predetermined actions from the
      experiment plan in an automated or autonomous fashion.

Problem
   Certain predetermined actions need to be performed to run a set of
   experiments in serial (one after another) and/or in parallel
   (simultaneously). One or more experiments, i.e., their tests, are
   remote, incurring a potentially significant communication delay between
   dependent experiments or to the multi-experiment workflow controller.
   Local experiments may involve remote components, such as by using the
   :ref:`intersect:arch:pat:catalog:architectural:distributed_control`,
   :ref:`intersect:arch:pat:catalog:architectural:distributed_steering` or
   :ref:`intersect:arch:pat:catalog:architectural:distributed_design`
   architectural patterns. Remote experiments may involve components that are
   completely local to the remote location, such as by using the
   :ref:`intersect:arch:pat:catalog:architectural:local_control`,
   :ref:`intersect:arch:pat:catalog:architectural:local_steering` or
   :ref:`intersect:arch:pat:catalog:architectural:local_design` architectural
   patterns.

Forces
   Only pre- and post-experiment conditions are considered in performing
   the predetermined actions to run the set of experiments in serial and/or
   parallel. Safety-related conditions during the experiments may be
   considered. Only pre-experiment conditions are considered in performing
   the predetermined actions while running each experiment individually,
   unless the :ref:`intersect:arch:pat:catalog:strategic:steering` strategic
   pattern or the :ref:`intersect:arch:pat:catalog:strategic:design` strategic
   pattern are being used for some or all experiments. If the
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern is
   being used for a particular experiment, then changing conditions during this
   experiment are considered in performing the predetermined actions while
   running it. If the :ref:`intersect:arch:pat:catalog:strategic:design`
   strategic pattern is being used for a particular experiment, then
   post-experiment conditions are considered in performing the predetermined
   actions to run it with different experiment plan parameters.

   Individual experiment execution may be impacted by a significant
   communication delay to a set of remote experiments it depends on.
   Multi-experiment workflow scheduling, execution and completion may be
   impacted by a significant communication delay between remote experiments
   and the multi-experiment workflow controller.

Solution
   A multi-experiment workflow controller orchestrates the execution of the
   experiments using a predetermined multi-experiment workflow plan
   (:numref:`intersect:arch:pat:catalog:architectural:distributed_workflow:components`).
   The multi-experiment workflow plan’s execution is automated, performed
   in an open loop control and may involve human interaction. The
   multi-experiment workflow controller may monitor one or more experiment
   controllers for dependency reasons. The multi-experiment workflow plan
   contains a complete description of the predetermined actions to be
   performed for orchestrating the execution of the experiments including
   any dependency-related responses.

   .. figure:: distributed_workflow/components.png
      :name: intersect:arch:pat:catalog:architectural:distributed_workflow:components
      :align: center
      :alt: Pattern components and control/data flow

      Distributed Multi-Experiment Workflow architectural pattern components and
      control/data flow

   Multiple local and/or remote experiment controllers execute their
   experiments using their predetermined experiment plan. Each plan’s
   execution is automated, performed in an open loop control and may
   involve human interaction. Each experiment controller may monitor the
   experiment for safety reasons. Each experiment plan contains a complete
   description of the predetermined actions to be performed for running its
   experiment, including any safety-related responses.

   Some experiments may be executed in parallel, as they do not depend on
   each other, while other experiment may be executed in serial due to
   dependencies. The orchestration of the execution follows a :term:`DAG` with the
   experiments as vertices and the edges as dependencies
   (:numref:`intersect:arch:pat:catalog:architectural:distributed_workflow:dag`).
   A dependency between experiments may arise when one experiment needs the
   result of another. Some experiments are remote in the :term:`DAG`.

   .. figure:: distributed_workflow/dag.png
      :name: intersect:arch:pat:catalog:architectural:distributed_workflow:dag
      :align: center

      Example of a Distributed Multi-Experiment Workflow architectural pattern
      directed acyclic graph

   This pattern offers an open loop control with safety-related feedback on
   each experiment and a separate loop control with safety-related feedback
   for each experiment. Experiment plan execution is automated within the
   open loop control for each experiment, i.e., its list of actions is
   performed without external or human intervention that can unnecessarily
   hold up execution. Multi-experiment workflow plan execution is automated
   within the open loop control for all experiments, i.e., its list of
   actions is performed without external or human intervention that can
   unnecessarily hold up execution. A set of serial and/or parallel
   experiments is controlled. Some experiments are remote and there is a
   significant communication delay between dependent experiments or to the
   multi-experiment workflow controller.

Resulting Context
   Experiments are executed automatically in serial and/or parallel using a
   predetermined plan locally and remotely, i.e., with significant
   communication delay between dependent experiments or to the
   multi-experiment workflow controller.

Related Patterns
   This architectural pattern relies on the
   :ref:`intersect:arch:pat:catalog:strategic:control` strategic pattern for
   automatically executing each predetermined experiment plan. This
   architectural pattern can be extended using the
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern
   (instead of the :ref:`intersect:arch:pat:catalog:strategic:control`
   strategic pattern) for autonomously executing some or all predetermined
   experiment plans, with each plan’s parameters changing autonomously during
   experiments based on progress. This architectural pattern can also be
   extended using the :ref:`intersect:arch:pat:catalog:strategic:design`
   strategic pattern for autonomously executing some or all predetermined
   experiment plans, with each plan’s parameters changing autonomously between
   experiments based on results. The
   :ref:`intersect:arch:pat:catalog:strategic:control`,
   :ref:`intersect:arch:pat:catalog:strategic:steering` and
   :ref:`intersect:arch:pat:catalog:strategic:design` strategic patterns can be
   used together in conjunction with this strategic pattern, individually for
   each experiment of the multi-experiment workflow. However, the
   :ref:`intersect:arch:pat:catalog:strategic:control` and
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic patterns are
   mutually exclusive for the same experiment, as the
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern
   extends the :ref:`intersect:arch:pat:catalog:strategic:control` strategic
   pattern.

   In contrast to this pattern, the
   :ref:`intersect:arch:pat:catalog:architectural:local_workflow` architectural
   pattern executes experiments that are local only, i.e., without significant
   communication delay between dependent experiments or to the multi-experiment
   workflow controller.

Examples
   A science use case involving an :term:`ACL` and an automated neutron diffraction
   experiment that further characterizes a compound, such as a grown
   crystal, implements a Distributed Multi-Experiment Workflow
   architectural pattern. The tests of both experiments are remote to each
   other. However, they do depend on each other as the :term:`ACL` produces and
   initially characterizes a compound and the SNS further characterizes it.
   The two experiments are executed serially, requiring transportation of
   the compound from the first to the second.

Known Uses
   This architectural pattern is used every time a set of experiments are
   performed, where one or more of them are considered remote. Very common
   examples are (1) a set of parallel experiments that investigate the same
   physical sample that is getting split up beforehand, or (2) a set of
   serial experiments that investigate the same physical sample that is
   getting moved from one experiment to the next with some delay due to
   physical distances. Each of these experiments investigates different
   properties, where the overall combination of the experiment results may
   be part of a bigger experiment that encompasses them.
