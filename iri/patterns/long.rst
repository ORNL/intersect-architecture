.. _intersect:arch:iri:patterns:long:

Long-Term Campaign
------------------

According to the :term:`IRI` Architecture Blueprint Activity :cite:`IRI:2023`,
long-term Campaign patterns are characterized by a need for sustained access
to resources at scale over a longer time to accomplish a well-defined
objective. Robustness, reproducibility, and reliability are important to
accomplishing long-term science, and these patterns will likely involve
significant logistical planning. Examples include sustained simulation
production and large data (re)processing for collaborative use.

The Long-Term Campaign Pattern Group of the :term:`IRI` Architecture Blueprint
Activity determined that the key overall challenge is to intentionally plan and
coordinate resources between campaigns and facilities over time. Specific
challenge areas include long-term storage past the end of a project; a present
mismatch between the short-term nature of resource allocations and mechanisms
(i.e., compute and instrument time) versus the long-term needs of a campaign;
the continual evolution of technologies and approaches within facilities and
campaigns (e.g., computing architectures, infrastructure and instruments,
cybersecurity, workflow systems); avoiding interruptions in campaigns due to
facility downtimes; and the present lack of holistic approaches to resource 
allocations across all :term:`DOE-SC` user facilities.

Additional perspectives from the group included:

- The evolution of staffing duration of a campaign needs to be factored in.

- The facilities may provide infrastructure and also need to accommodate the
  varied data management requirements of the programs and research domains.

- Abstraction layers are likely to be a key and pervasive component of the
  solutions we need.

- A common machine-usable interface to facilities looks like it is a
  prerequisite, as is scheduling that does not have humans in the loop.

- Data re-use is an appealing idea but difficult to achieve, so data needs to
  be well-described and documented to be useful down the road.

Relationship to INTERSECT Science Use Case Design Patterns
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The Long-Term Campaign :term:`IRI` Pattern is related to all :term:`INTERSECT`
patterns in terms of (1) long-running experiments or (1) sets of long-running
experiments.

This :term:`IRI` Pattern is more specifically related to the :term:`INTERSECT`
:ref:`intersect:arch:pat:catalog:strategic:control` strategic pattern and its
:ref:`intersect:arch:pat:catalog:architectural:local_control` and
:ref:`intersect:arch:pat:catalog:architectural:distributed_control`
architectural patterns, when a single experiment needs to be performed over a
long period of time. For example, an open-field plant growth experiment
investigating the absobtion of CO\ :sub:`2` may run for months and even years,
collecting experiment data in regular intervals. The resources required to
control this single experiment need to be available over an extended period
of time.

It is also related in a similar way to the :term:`INTERSECT`
:ref:`intersect:arch:pat:catalog:strategic:steering` strategic pattern and its
:ref:`intersect:arch:pat:catalog:architectural:local_steering` and
:ref:`intersect:arch:pat:catalog:architectural:distributed_steering`
architectural patterns, when such a single, long-running experiment needs to be
steered, i.e., its parameters need to be changed over time based on experiment
progress. For example, an open-field plant growth experiment investigating the
absobtion of CO\ :sub:`2` may regulate the amount of CO\ :sub:`2` in different
parts of the field to adjust for envoronmental factors, such as sun exposure
and rain. The resources required to steer this single experiment need to be
available over an extended period of time.

The :ref:`intersect:arch:pat:catalog:strategic:design` strategic pattern and
its :ref:`intersect:arch:pat:catalog:architectural:local_design` and
:ref:`intersect:arch:pat:catalog:architectural:distributed_design`
architectural patterns are related to this :term:`IRI` Pattern, when a set of
similar experiments with different paramaters is performed over a long period
of time. A parameter study in search of a new material for microelectronics
that performs in a specific way, such as to create a
:term:`light-emmiting diode<LED>` in a certain wavelength, may go on for a
prolonged period of time. Each new experiment is a modified variant of the
previous one, potentially using different materials or techniques for
depositing layers of materials on semiconductors. The resources required to
design and control such a set of experiments are required over an extended
period of time.

This pattern is also related in a particular way to the :term:`INTERSECT`
:ref:`intersect:arch:pat:catalog:strategic:workflow` strategic pattern and its
:ref:`intersect:arch:pat:catalog:architectural:local_workflow` and
:ref:`intersect:arch:pat:catalog:architectural:distributed_workflow`
architectural patterns, as multiple experiments that may depend on each other
are performed over a long period of time.  There are two types. In the first
type, a workflow is repeatedly executed over a long period of time, such as
when plant samples are regularly taken from an open-field plant growth
experiment investigating the absobtion of CO\ :sub:`2` and analyzed in a
chemistry laboratory. The second type involves long individual experiments
that are part of a workflow, such as the creation of an isotope in a reactor
over a month, the investigation of its initial properties, and the
investigation of its properties after decay every month. The resources
needed for both types need to be available over an extended period of time,
where individual resource availability differs between types.
