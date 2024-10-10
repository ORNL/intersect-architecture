.. _intersect:arch:iri:patterns:time:

Time-Sensitive
--------------

According to the :term:`IRI` Architecture Blueprint Activity :cite:`IRI:2023`,
time-sensitive :term:`IRI` patterns comprise workflows with time
critical/sensitive requirements (i.e., real time or near real time), which can
be motivated by various factors such as timely decision making, experiment
steering, virtual proximity, and loss of data fidelity. These time-sensitive
workflows involve integration across multiple facilities and resources. They
are found in many scientific domains such as beamline-based materials science,
astronomy and astrophysics, observational science, and experimental fusion science.

The Time-Sensitive Patterns Group of the :term:`IRI` Architecture Blueprint
Activity highlighted an ensemble of workflow areas that are important to
address for these patterns (and which might also apply to the other :term:`IRI`
patterns):

- **Experiment control**, including experiment calibration and steering

- **Distributed systems administration,** including virtual proximity

- **Data management**, including data reduction, conversion, (re)construction,
  curation, (re)positioning, distribution, ingest, and storage

The Time-Sensitive Patterns Group also identified some high-level takeaways and
important next steps:

- Highlighting “classes” of time sensitivities, e.g., by time periods (ms, sec,
  mins, hours, days, etc.) and by motivation (decisions that cannot wait,
  experiment control, loss or fidelity of data, etc.).

- Emphasizing the importance of user experience, e.g., usability, reliability,
  etc.

- Determining what resource needs to be local versus remote.

- Understanding that time-sensitive workflows may require security enforcement
  that is time sensitive as well.

Relationship to INTERSECT Science Use Case Design Patterns
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The Time-Sensitive :term:`IRI` Pattern is related to the :term:`INTERSECT`
:ref:`intersect:arch:pat:catalog:strategic:control` strategic pattern and its
:ref:`intersect:arch:pat:catalog:architectural:local_control` and
:ref:`intersect:arch:pat:catalog:architectural:distributed_control`
architectural patterns when real time or near real time control is required.
The execution of predetermined actions by an experiment controller may include
time-sensitive actions, such as adjusting parameters throughout the experiment
based on a predetermined experiment plan (e.g., moving a laser that is
depositing metal in a 3D manufacturing process).

This :term:`IRI` Pattern is also related to the :term:`INTERSECT`
:ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern and its
:ref:`intersect:arch:pat:catalog:architectural:local_steering` and
:ref:`intersect:arch:pat:catalog:architectural:distributed_steering`
architectural patterns when real time or near real time steering is required.
The execution of predetermined actions by an experiment controller may include
time-sensitive actions based on feedback, such as adjusting parameters (e.g.,
changing the power of a laser that is depositing metal in a 3D manufacturing
process) throughout the experiment based on feedback (e.g., infrared camera
measurements of the lasers heating and cooling impact on the product being
printed and an analysis of the stresses being created in the material).

It is also related to the :term:`INTERSECT`
:ref:`intersect:arch:pat:catalog:strategic:design` strategic pattern and its
:ref:`intersect:arch:pat:catalog:architectural:local_design` and
:ref:`intersect:arch:pat:catalog:architectural:distributed_design`
architectural patterns when real time or near real time predetermined actions
need to be performed to run a set of similar experiments with different
experiment plan parameters, depending on (prior) experiment results. For
example, an experiment sample that may have only a limited time for evaluation,
such as an isotope or a biological sample, is split up into multiple samples.
The samples are then evaluated in a set of similar experiments, such as by
mixing with a different chemical followed by gas chromatography to understand
the chemical reactions. The experiment result analysis and adjustment of
plan parameters for the next experiment may need to be performed in real time
or near real time to maintain the viability of the remaining samples.

The relation to the :term:`INTERSECT`
:ref:`intersect:arch:pat:catalog:strategic:workflow` strategic pattern and its
:ref:`intersect:arch:pat:catalog:architectural:local_workflow` and
:ref:`intersect:arch:pat:catalog:architectural:distributed_workflow`
architectural patterns is defined by any real time or near real time
requirements when running a set of experiments in serial (one after another)
and/or in parallel (simultaneously). Examples include when samples are involved,
such as isotopes or biological, that may have only a limited time, such as when
an isotope or biological sample is being chemically processed in a series of
experiments. The processed sample may have only a limited viability between
experiments for the next processing step.

In summary, the Time-Sensitive :term:`IRI` Pattern is related to all
:term:`INTERSECT` :ref:`intersect:arch:pat`, as real time or near real time
requirements can play a role in all of them.
