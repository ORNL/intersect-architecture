.. _intersect:object_model:

Object Model
============

.. todo::

   Need to revisit this section to clarify what it is for and to have some form
   of completeness and consistency. Implementation-specific details need to be
   removed, as the :term:`SoS` architecture needs to balance the abstract view
   of an architecture vs. the details of a specific implementation. Subsections
   that group and list things are preferred over a disconnected appendix. There
   is also the balance between describing terms here, which will not be indexed
   in the glossary, vs. in the glossary.

Entity/Object
   An :term:`entity` or :term:`object` is used to represent :term:`resources`
   within :term:`INTERSECT`. They are tuples consisting of a unique identifier
   (i.e., uri/iri, uuid, etc.) and a (+blob), containing the (encoded)
   representation of the :term:`entity`. Objects can link to other objects,
   creating some relationship between them.

Entity Types
   All objects within :term:`INTERSECT` have a type. Types have to be unique. Some examples of object types are:

   - `intersect.orchestrator.controller`
   - `intersect.orchestrator.controller.campaign`
   - `intersect.orchestrator.controller.experiment`
   - `intersect.data.catalog`
   - `intersect.data.set`
   - `intersect.data.asset`

Generic Objects
---------------

Resource
   Entities that are a distinct logical or physical component of a System.
   Resources most often represent components such as computers or scientific
   instruments that have particular sharing or partitioning constraints.

Capability
   A capability is the ability to perform an activity. It expresses the ability
   of an agent to perform an :term:`activity` of a certain type. All
   capabilities must have a unique name. An agent can have multiple
   capabilities, and there multiple agents can provide the same capability.

   Examples for :term:`INTERSECT` capabilities are:

   - (:intersect:compute:create)
   - (:intersect:compute:submit)
   - (:intersect:orchestrator:create)
   - (:intersect:orchestrator:submit)
   - (:intersect:orchestrator:start)
   - (:intersect:data:create)
   - (:intersect:data:get)
   - (:intersect:data:list)
   - (:intersect:infrastructure:create)
   - (:intersect:infrastructure:register)
   - (:intersect:infrastructure:find)

   .. note::

     - Some agent has the capability to perform the activity described by an
       :term:`entity` of a certain :term:`type`.
     - The agent *ORNL::Users::Some_User* wants to execute a bash script.
     - The agent *Summit::Controller::Bash* has the capability to perform the
       activity *intersect::compute::execute::script::bash*
     - The agent *Summit::Controller::Bash* performs activity
       *execute::script::bash* on behalf of agent *ORNL::Users::Doe::Some_User*

     The bash script is an :term:`entity` of type *script::bash*. To execute
     the bash script a controller with the capability
     *intersect::compute::execute::script::bash* is required. After a suitable
     agent is selected, it can perform the activity
     *intersect::compute::execute::script::bash*.

   .. plantuml:: 
      :caption: Representation of the capability object

      <style>
      yamlDiagram {
        roundCorner 5
      }
      </style>

      @startyaml
      !include objects/capability.yaml
      @endyaml

Approval Point
   A task which requires input of a specific type of
   :term:`agent`. The execution of the task is suspended
   until the approval is either granted or denied.

Decision Point
   A task whose outcome depends on the output of a previous one.

Event
   The occurrence of an activity.

Properties
   Properties are used to describe :term:`INTERSECT` `objects` in more detail.
   For example, an infrastructure system providing a compute service must have
   a `property` for the processor architecture. Additionally, `properties` can
   describe other aspects of the infrastructure system, like memory, network, etc.

Constraint
   Constraints are used to limit the resource selection to resources with
   certain properties. Examples of constraints include:

   - processor architecture
   - memory
   - accelerator
   - number of CPUs / hardware threads
   - number of nodes

Agents
------

Agent
   An agent is a type of performer.
   An agent has a set of :term:`capabilities`.
   It can perform the activities indicated by its capabilities.

   A **Controller** is a type of agent and provides capabilities to interact
   (control or query) with **Resources**.

   .. important::
  
      An agent *provides* a capability

   .. plantuml::
     :caption: Representation of the Agent Object
      
      <style>
      yamlDiagram {
         roundCorner 5
      }
      </style>

      @startyaml
      !include objects/agent.yaml
      @endyaml
     
User
   A user is an entity having access to a given resource.
   Users can perform activities.
   Users can be assigned roles.

Organization
   An organization is an entity providing a given resource. Users can perform activities on behalf of Organizations.

SoftwareAgent
   A software agent is an entity performing certain activities on behalf of users or organizations.

Controller
   An controller is a specialization of a software agent. Controllers integrate infrastructure systems into the INTERSECT ecosystem.

Adapter
   An adapter is a specialization of a software agent. Adapters integrate software systems into the INTERSECT ecosystem.

Activities
----------

.. _intersect:arch:sos:data:objectmodel:activity:

Activity
   An activity is a `unit` of `work`. It is an event, typically with a start
   and end, which is performed for a purpose. Activities can be repeated, and
   while the activity is the same, a separate event is generated each time a
   activity is performed.

   Activities can have inputs and produce outputs.
   Inputs and outputs can be files.
   Inputs can additionally be comprised of parameters.

   Activities can have dependencies on other activities.
   They can also depend on the presence of a resource (software/data asset).
   Additionally, activities can depend on the availability of a certain type of resource (e.g., a GPU, or a X86-64 CPU architecture, etc.)

   .. plantuml::
      :caption: Entity-Relationship Diagram for Activities
      :name: arch:sos:data:objectmodel:activity:er-2


      @startuml

      entity Activity {
      }
      entity Input {
      }
      entity InputParameter {
      }
      entity Output {
      }
      entity Resource {
      }
      entity ResourceType {
      }

      Activity --> Input : 'prov:wasInformedBy'
      Activity --> InputParameter : 'prov:wasInformedBy'

      Output --> Activity : 'prov:wasGeneratedBy' 

      Activity --> Activity : 'dependsOn'

      Activity --> Resource : 'dependsOn'
      Activity --> ResourceType : 'dependsOn'

      @enduml

Campaign
   A campaign is a specialization of an activity.
   A campaign manages the state of, the data flow between and the dependencies of a non-empty set of experiments.
   A campaign has a :term:`controller`.
   A campaign has a :term:`template`.

   .. plantuml::
      :caption: A (not so complete) example of the relationships of a Campaign.
      :name: arch:sos:data:objectmodel:campaign:relationships

      @startuml
      digraph foo {
         node [style=rounded]
         node1 [shape=house, label="Campaign Controller"]
         node2 [shape=house, label=":Bob"]
         node3 [shape=house, label="Experiment Controller"]
         node4 [shape=record, label="Campaign"]

         s1 [shape=note, label="2024-02-11T08:04:01Z"];
         s2 [shape=note, label="2024-02-11T15:43:14Z"];

         node1 -> node2 [label="prov:actedOnBehalfOf"]
         node1 -> node3 [label="prov:wasStartedBy"]
         node4 -> node1 [label="prov:wasAssociatedWith"]
         s1 -> node4
         s2 -> node4

      }
      @enduml

Experiment
   An `experiment` is a collection of Tasks with the goal to achieve a specific outcome.
   It contains a description of the data flow between the different
   Tasks and the dependencies between them.
   An experiment has at least one :term:`controller`, which coordinates the execution of the `experiment`.
   An experiment has one :term:`template`.
   An experiment can have a dependency on:

   - Task / Activity
   - Performer / Agent / Controller
     - Types of Performers
   - Event
   - Capability
   - Campaign
   - Experiment
   - Data Set
   - Data Asset
   - Approval Point
   - Decision Point
   - Template

   .. note::

     An experiment can depend on instruments or resources. The example
     experiment depends on a microscope, and can utilize its capabilities.
     Additionally, it contain a task that takes the output of the microscope
     to do some post-processing. The task itself has a dependency on a
     compute service. To run the experiment, the microscope needs to be
     configured. The microscope creates data for the output.

Task
   While an activity is a **unit** of **work**, a :term:`task`
   represents the intend to perform an activity when certain conditions are
   met. The conditions can be dependencies and constraints.

   A task has a set of `input` entities, blocks or consumes a `resource`, and
   produces a set of `output` entities. The `input` for a task can vary greatly
   and range from configuration parameters to physical samples. Resources that
   can be blocked are instruments that are time shared and in most cases
   consume some type allocations. Other types of consumables can be reactants
   or solvents. The 'output' of a task can vary greatly as well and range from
   reaction products, metadata about the reaction, to a publishable dataset.

   A task has multiple states. It is either **ready** to be performed,
   **assigned** to a performer (as in **scheduled**), a performer is
   **active**ly performing the work, or the task has been performed either
   **successful** or **unsuccessful**. Additionally, it can also be
   **suspended**, **canceled** or **aborted**.

   A task depends on the `capabilities` required by the associated `activity`.
   For example, assume the `activity` is to acquire the spectrum of a given
   sample, then the task depends on a spectrometer that provides this `capability`.

   .. todo::

      A task can have pre- and post conditions.

   A task can have constraints. Constraints are used to express certain
   requirements of a given task. For example, a computational task can require
   a certain amount of memory, and constrains the task to systems with at least
   the required amount of memory. Other possible constrains are the processor
   architecture, a certain accelerator, number of nodes, etc.

   .. plantuml::
      :name: fig:intersect:task:states
      :caption: Task states
      
      
      skinparam useBetaStyle true
   
      <style>
      stateDiagram {
        roundCorner 2
      }
      </style>
   
      
      @startuml
      [*] -> ready
      ready --> assigned
      assigned -> canceled
      assigned --> active
      active <- suspended
      active --> successful
      active --> unsuccessful
      suspended <- active
      suspended -> aborted
      active -> aborted
      aborted -> [*]
      canceled-> [*]
      successful -> [*]
      unsuccessful -> [*]
      @enduml

.. important::

   A task *requires* an agent with the capability to *execute* it. In other
   words, the task itself has a type, which requires a certain type of
   controller to execute it. Each task has a controller associated with it.

.. note::

   A :term:`task` can itself provide a capability

.. note::

   A user wants a bash script executed. To do so a
   :term:`task` is created. The :term:`task` will depend on:

   - the bash script
   - the capability to execute the script (i.e. an infrastructure system with
     a bash shell)
   - any additional *constraints* or *dependencies*
     - *dependencies* like access to a particular resource (i.e. some input)
     - *constraints* like a minimum amount of memory or number of CPU cores

   Once an :term:`agent` that satisfies all *dependencies* and *constraints*
   (and policies?) is available, it will perform the
   [activity](#intersect:model:activity) of *executing* the bash script.

.. note::

   The **Microscope** has *capability* `measure`. The **Instrument Controller**
   has capability `perform.measure`. The **Instrument Controller** has
   capability `configure.instrument`. A **Compute Controller** has capability
   `perform.analyze`. The **Experiment Controller** has the capability
   `perform.experiment`. The **Experiment** requires the capability
   `perform.experiment`. The first task in the experiment is `perform.measure`.
   This task is performed by the **Controller** with the capability
   `perform.measure`. The second task is to analyze (`perform.analyze`) the
   output of the first task. This task is performed by some **Controller**
   with the capability `perform.analyze`.

Data
----

Data Asset
   Is a representation of a singular **Object** / **Entity**.

   - as in files (*.jpg,*.svg, *.docx,*.sh)
   - JSON Object
   - Database, Table, Row, etc.

Data Set
   Is a collection of **[Data Assets](#intersect:model:data-asset)** that
   belong together.

Metadata
   Metadata objects are used to store additional information about objects. For
   example, a data asset can have metadata to provide more context.
