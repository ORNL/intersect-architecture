.. _intersect:arch:pat:catalog:strategic:

Strategic Patterns
------------------

The science use case strategic patterns define high-level solution methods
using experiment control architecture features at a very coarse granularity.
Their descriptions are deliberately abstract to enable architects to reason
about the overall organization of the used techniques and their implications on
the full system design. The :ref:`intersect:arch:pat:catalog:strategic:toc`
defines the following strategic patterns:

:ref:`intersect:arch:pat:catalog:strategic:control`
   Certain predetermined actions need to be performed while running an
   experiment. This pattern would be used in all automated experiments that do
   not have feedback for steering the ongoing or designing the next experiment.
   Since autonomous operation requires to first figure out automation, this
   pattern provides a basic solution that covers most experiments performed at
   this point.

:ref:`intersect:arch:pat:catalog:strategic:steering`
   Certain predetermined actions need to be performed while running an
   experiment to positively influence experiment progress. This pattern
   involves feedback for the ongoing experiment as an extension to
   :ref:`intersect:arch:pat:catalog:strategic:control`. It offers autonomous
   operation and is used in experiments that require live feedback to adjust
   parameters.

:ref:`intersect:arch:pat:catalog:strategic:design`
   Certain predetermined actions need to be performed to run a set of similar
   experiments with different experiment plan parameters, depending on (prior)
   experiment results. This pattern makes use of either
   :ref:`intersect:arch:pat:catalog:strategic:control` or
   :ref:`intersect:arch:pat:catalog:strategic:steering` and additionally offers
   feedback between experiments, typically to define the parameters of the next
   experiment or next series of experiments. It is typically used in
   conjunction with probabilistic (e.g., Bayesian) or domain science based
   (e.g., physics informed) analysis of experiment results. This pattern is
   predominantly used in large-scale parameter studies, such as to find the
   optimal conditions of a chemical catalysis.

:ref:`intersect:arch:pat:catalog:strategic:workflow`
   Certain predetermined actions need to be performed to run a set of
   experiments in serial (one after another) and/or in parallel
   (simultaneously). This pattern utilizes the other 3 patterns to orchestrate
   multiple experiments that may depend on each other. An example use case
   is the creation of a certain material using physical and/or chemical
   processes (e.g., catalysis) and the analysis of the properties of the
   created material in multiple experiments (e.g., spectroscopy and stress
   testing).

The features of these science use case strategic patterns and their
relationships are compared in
:numref:`intersect:arch:pat:catalog:strategic:relationships`.

.. table:: Feature comparison and relationships of the science use case
           strategic patterns
   :name: intersect:arch:pat:catalog:strategic:relationships
   :align: center

   +-------------+-----------------------------------------------------+------------------------------------------------------+------------------------------------------------------+-------------------------------------------------------+
   | **Feature** | :ref:`intersect:arch:pat:catalog:strategic:control` | :ref:`intersect:arch:pat:catalog:strategic:steering` | :ref:`intersect:arch:pat:catalog:strategic:design`   | :ref:`intersect:arch:pat:catalog:strategic:workflow`  |
   +=============+=====================================================+======================================================+======================================================+=======================================================+
   | # of        | 1                                                   | 1                                                    | Multiple                                             | Multiple                                              |
   | experiments |                                                     |                                                      |                                                      |                                                       |
   +-------------+-----------------------------------------------------+------------------------------------------------------+------------------------------------------------------+-------------------------------------------------------+
   | Control     | Open loop                                           | Closed loop                                          | Closed loop                                          | Open loop                                             |
   | type        |                                                     |                                                      |                                                      |                                                       |
   +-------------+-----------------------------------------------------+------------------------------------------------------+------------------------------------------------------+-------------------------------------------------------+
   | Operation   | Automated                                           | Autonomous                                           | Autonomous                                           | Automated                                             |
   | type        |                                                     |                                                      |                                                      |                                                       |
   +-------------+-----------------------------------------------------+------------------------------------------------------+------------------------------------------------------+-------------------------------------------------------+
   | Extends     |                                                     | :ref:`intersect:arch:pat:catalog:strategic:control`  |                                                      |                                                       |
   +-------------+-----------------------------------------------------+------------------------------------------------------+------------------------------------------------------+-------------------------------------------------------+
   | Uses        |                                                     |                                                      | :ref:`intersect:arch:pat:catalog:strategic:control`  | :ref:`intersect:arch:pat:catalog:strategic:control`   |
   +-------------+-----------------------------------------------------+------------------------------------------------------+------------------------------------------------------+-------------------------------------------------------+
   | May also    |                                                     |                                                      | :ref:`intersect:arch:pat:catalog:strategic:steering` | :ref:`intersect:arch:pat:catalog:strategic:steering`, |
   | use         |                                                     |                                                      |                                                      | :ref:`intersect:arch:pat:catalog:strategic:design`    |
   | or use      |                                                     |                                                      |                                                      |                                                       |
   | instead     |                                                     |                                                      |                                                      |                                                       |
   +-------------+-----------------------------------------------------+------------------------------------------------------+------------------------------------------------------+-------------------------------------------------------+

.. toctree::
   :maxdepth: 1
   :caption: Strategic Pattern Catalog
   :name: intersect:arch:pat:catalog:strategic:toc

   control
   steering
   design
   workflow
