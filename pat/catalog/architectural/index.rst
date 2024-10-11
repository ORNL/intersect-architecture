.. _intersect:arch:pat:catalog:architectural:

Architectural Patterns
----------------------
   
Architectural patterns define more specific solution methods using hardware and
software architecture features at a finer granularity. They offer more detailed
descriptions, conveying different design choices for implementing strategic
patterns and their abstract architectural features. Architectural patterns
inherit the features of their parent strategic patterns. However, they also
address additional problems through specific design choices that are not
exposed at the high abstraction level of the parent strategic patterns.

The architectural patterns provide abstractions for the different
hardware/software architecture choices of implementing experiment control and
workflow, such as using experiment-local, edge and/or center computing and data
resources. The :ref:`intersect:arch:pat:catalog:architectural:toc` defines the
following architectural patterns:

:ref:`intersect:arch:pat:catalog:architectural:local_control`
   A local experiment controller executes an experiment. There are no remote
   components that could incur a significant communication delay.

:ref:`intersect:arch:pat:catalog:architectural:distributed_control`
   A remote experiment controller executes an experiment, incurring a
   potentially significant communication delay.

:ref:`intersect:arch:pat:catalog:architectural:local_steering`
   Experiment progress is analyzed and judged locally. There are no remote
   components that could incur a significant communication delay.

:ref:`intersect:arch:pat:catalog:architectural:distributed_steering`
   Experiment progress is analyzed and optionally also judged/controlled
   remotely, incurring a potentially significant communication delay.

:ref:`intersect:arch:pat:catalog:architectural:local_design`
   Experiment results are analyzed and judged locally. There are no remote
   components that could incur a significant communication delay.

:ref:`intersect:arch:pat:catalog:architectural:distributed_design`
   Experiment results are analyzed and optionally also judged/controlled
   remotely, incurring a potentially significant communication delay.

:ref:`intersect:arch:pat:catalog:architectural:local_workflow`
   All experiments are local. There are no remote experiments that could incur
   a significant communication delay.

:ref:`intersect:arch:pat:catalog:architectural:distributed_workflow`
   One or more experiments are remote, incurring a potentially significant
   communication delay.

:numref:`intersect:arch:pat:catalog:architectural:relationships` shows the
architectural patterns and their relationships to the strategic patterns.

.. table:: Relationships of the science use case strategic and architectural
           patterns
   :name: intersect:arch:pat:catalog:architectural:relationships
   :align: center

   ==================================================================== ====================================================
   **Architectural Pattern**                                            **Implements Strategic Pattern**
   ==================================================================== ====================================================
   :ref:`intersect:arch:pat:catalog:architectural:local_control`        :ref:`intersect:arch:pat:catalog:strategic:control`
   :ref:`intersect:arch:pat:catalog:architectural:distributed_control`  :ref:`intersect:arch:pat:catalog:strategic:control`
   :ref:`intersect:arch:pat:catalog:architectural:local_steering`       :ref:`intersect:arch:pat:catalog:strategic:steering`
   :ref:`intersect:arch:pat:catalog:architectural:distributed_steering` :ref:`intersect:arch:pat:catalog:strategic:steering`
   :ref:`intersect:arch:pat:catalog:architectural:local_design`         :ref:`intersect:arch:pat:catalog:strategic:design`
   :ref:`intersect:arch:pat:catalog:architectural:distributed_design`   :ref:`intersect:arch:pat:catalog:strategic:design`
   :ref:`intersect:arch:pat:catalog:architectural:local_workflow`       :ref:`intersect:arch:pat:catalog:strategic:workflow`
   :ref:`intersect:arch:pat:catalog:architectural:distributed_workflow` :ref:`intersect:arch:pat:catalog:strategic:workflow`
   ==================================================================== ====================================================


.. toctree::
   :maxdepth: 1
   :caption: Architectural Pattern Catalog
   :name: intersect:arch:pat:catalog:architectural:toc

   local_control
   distributed_control
   local_steering
   distributed_steering
   local_design
   distributed_design
   local_workflow
   distributed_workflow
