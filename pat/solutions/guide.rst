.. _intersect:arch:pat:solutions:guide:

A Step-By-Step Guide
--------------------

Building a complete solution from an existing science use case requires
dissecting the science use case by the open or closed loop control problem or
problems it contains. This Section describes the involved steps and discusses
the individual decision parameters in more detail. The following
:ref:`intersect:arch:pat:solutions:compositions` Section discusses additional
considerations when composing different design patterns, such as due to multiple
loop control problems. Each loop control problem needs to be identified,
including its properties and hardware/software architectural features. A
step-by-step decomposition process would work as follows:

#. Clearly define the experiment or experiments that are being performed

#. Identify the loop control problem or problems that exist for each experiment.

#. Classify each loop control problem by a strategic pattern.
#. Identify the individual components of each loop control problem and
   associated strategic pattern.

#. Classify each loop control problem by an architectural pattern that matches
   its strategic pattern.

#. Match the identified components with the components of the architectural
   patterns.

#. Design the hardware/software architecture of the solution based on the
   architectural patterns and the corresponding matched components, using the
   pattern properties as design guidelines.

What is the experiment?
   It is important to clearly define the experiment or experiments, as the wrong
   definition ultimately leads the designer down the wrong path. It is often
   easier to think of an experiment as a concrete test process that demonstrates
   a specific known truth, examines the validity of a specific hypothesis, or
   determines specific properties of something. Clearly identifying the
   experiment devices, such as sensors, actuators, instruments and robots, is
   part of that definition as well. It is quite possible that one experiment in
   a laboratory tries to accomplish multiple objectives, in which case a single
   multi-objective experiment could be split up into multiple experiments,
   especially if it involves a workflow or completely separated loop control
   problems. There is no hard rule on this and any such split would be on a
   case-by-case basis.

Which loop control problems exist?
   Separating out what is being controlled and how is the key to identifying the
   loop control problem or problems that exist for each experiment. In pretty
   much all cases, there is some type of simple open loop control, as described
   in the :ref:`intersect:arch:pat:catalog:strategic:control` strategic pattern.
   Additional loop control problems may exist that may extend the simple open
   loop control, such as to the
   :ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern, or
   uses/relies on the simple open loop control, such as with the
   :ref:`intersect:arch:pat:catalog:strategic:design` strategic pattern. There
   also may be multiple loop control problems for the same experiment, such as a
   combination of the the :ref:`intersect:arch:pat:catalog:strategic:steering`
   and :ref:`intersect:arch:pat:catalog:strategic:design` strategic patterns.
   Similarly, a multi-objective experiment may have multiple loop control
   problems for different parts of the experiment, potentially requiring it to
   be split up into multiple experiment. Obviously, a multi-experiment workflow
   may have loop control problems for each experiment in the workflow. Pattern
   combinations that solve such issues are discussed in the
   :ref:`intersect:arch:pat:solutions:compositions` Section.

Who is in control?
   The science use case design patterns have one controller component and some
   have an additional planner component. These are not necessarily physical
   standalone components. Instead, an analyzer may already contain the
   decision-making logic and also act as a controller or planner. Similarly,
   the controller or planner may require human input or may be a human itself.
   While the goal is to reduce human-in-the-loop requirements with
   machine-in-the-loop capabilities, this may be a process that requires a
   transition and some human-in-the-loop requirements may not necessarily
   completely eliminated.

Which strategic pattern?
   The key differences in features between the 4 strategic patterns are (1) no
   feedback, (2) feedback for the same experiment, (3) feedback for the next
   experiment, and (4) workflow of multiple experiments. If there is no
   feedback, then :ref:`intersect:arch:pat:catalog:strategic:control` is the
   right strategic pattern. If there is feedback for the same experiment, such
   as changing a parameter based on a measurement to observe how that or
   another measurement changes, then
   :ref:`intersect:arch:pat:catalog:strategic:steering` is the right strategic
   pattern. If there is feedback for the next experiment, such as to change the
   parameters and re-run the experiment, then
   :ref:`intersect:arch:pat:catalog:strategic:design` is the right strategic
   pattern. There are experiments, where the experiment plan constantly evolves
   as the experiment is performed, based on measurements. In this case, either
   :ref:`intersect:arch:pat:catalog:strategic:steering` or
   :ref:`intersect:arch:pat:catalog:strategic:design` may be used, whichever is
   closer. In this case, using
   :ref:`intersect:arch:pat:catalog:strategic:design` splits the experiment into
   multiple separate experiments with different experiment plans.
   :ref:`intersect:arch:pat:catalog:strategic:workflow` is used whenever there
   are multiple experiments without feedback. There could be a greater feedback
   loop over multiple experiments in a workflow. In this case, a separate
   strategic pattern is employed (see
   :ref:`intersect:arch:pat:solutions:compositions`).

What is local? What is remote?:
   The architectural science use case design patterns distinguish between local
   and remote components based on communication delay. Any potentially
   significant communication delay to a component makes it a remote component.
   The term “significant communication delay” is purposely not clearly defined
   to give designers room for interpretation. There may be other reasons for
   defining a component as remote, such as when a component is physically
   located at an entirely different location that does not necessarily incur a
   significant communication delay but requires a special way of communication.
   A human that acts as a planner and communicates with the rest of the system
   via e-mail or a :term:`GUI` would likely also be considered a remote
   component.
