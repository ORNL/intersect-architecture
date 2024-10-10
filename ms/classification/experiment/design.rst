.. _intersect:arch:ms:class:experiment:design:

Microservice Capabilities for Experiment Design
===============================================

Services for *Experiment Design* support development and refinement of
experiment plans that are used by 
:ref:`Experiment Control <intersect:arch:pat:catalog:strategic:control>`
services to execute experiments on scientific instruments. 
Typical activities include creating and validating experiment plans, 
and refinement of existing plans based on objective-based analysis of 
prior experimental results or design space exploration criteria.

The :ref:`Experiment Steering <intersect:arch:pat:catalog:strategic:steering>` 
science use case design pattern is a form of
experiment plan refinement that is limited to updating the test
parameters of an existing plan. In contrast, the 
:ref:`Design of Experiments <intersect:arch:pat:catalog:strategic:design>`
science use case design pattern involves generating new experiment plans
that may involve changes to test parameters, test sequencing, or the
component tests of the plan.