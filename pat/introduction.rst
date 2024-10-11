.. _intersect:arch:pat:introduction:

Introduction to Design Patterns
-------------------------------

A design pattern is a description of a generalized solution to a recurring
problem within a well-defined context. Design patterns are often created from
best practices and contain the essential elements of the problems they tackle
and their corresponding solutions. They offer a template on how to solve a
specific problem that may apply to different situations. They may also describe
different solution alternatives to a specific problem.

The concept of design patterns originates in civil architecture and
engineering. Design patterns captured the detailed designs of towns and
neighborhoods, houses, gardens and rooms with the goal of designing functional
and aesthetically beautiful living spaces and structures. They identify and
catalog solutions to recurrent problems encountered during the process of
building and planning. Each pattern describes a problem that occurs repeatedly
in our environment and the core of the solution to that problem in such a way
that it may be used a million times over, without ever doing it the same way
twice :cite:`Alexander:1977`.

In general, a design pattern identifies the key aspects of a solution and
creates an abstract description that makes it useful in the creation of a
reusable design element. Patterns don’t describe a concrete design or an
implementation - they are intended to be templates that may be applied by a
designer in various contexts and modified to suit the problem at hand. Patterns
are also free from constraints of detail associated with the level of system
abstraction at which the solution is implemented. Patterns also describe the
design decisions that must be made when applying a certain solution. This
enables a designer to reason about the impact of the design decisions on a
system’s flexibility or scalability as well as consider implementation issues.
Design patterns must address a specific problem at hand, and yet must be
general enough to remain relevant to future requirements of systems.

.. _intersect:arch:pat:introduction:software:

Software Design Patterns
========================

In the domain of software design, patterns were introduced in an effort to
create reusable solutions in the design of software and bring discipline to the
art of programming. The intent of software design patterns isn’t to provide a
finished design that may be transformed directly into code; rather, design
patterns are used to enhance the software development process by providing
proven development paradigms. With the use of design patterns, there is
sufficient flexibility for software developers to adapt their implementation to
accommodate any constraints, or issues that may be unique to specific
programming paradigms, or the target platform for the software. Related to
design patterns, the concept of algorithmic skeletons was introduced
:cite:`Cole:1991` and further refined :cite:`Cole:2004`.

In the context of object-oriented programming, design patterns provide a
catalog of methods for defining class interfaces and inheritance hierarchies,
and establish key relationships among the classes :cite:`Gamma:1995`. In many
object-oriented systems, reusable patterns of class relationships and
communications between objects are used to create flexible, elegant, and
ultimately reusable software design. There are three categories of
object-oriented patterns: (i) **creational** patterns for ways to do
instantiation of objects, (ii) **structural** patterns concerned with class and
object composition, and (iii) **behavioral** patterns for communication between
objects. Patterns have also been defined in the design of software
architectures :cite:`Buschmann:1996` to capture repeatedly used methodologies
in software engineering practice. Pattern systems have also been developed for
cataloging concurrent and networked object-oriented environments
:cite:`Schmidt:2000`, resource management :cite:`Kircher:2004`, and distributed
software systems :cite:`Buschmann:2007`.

In the pursuit of quality and scalable parallel software, patterns for
programming paradigms were developed :cite:`Mattson:2004` as well as a pattern
language, called Our Pattern Language (OPL) :cite:`Mattson:OPL:2009`. These
parallel patterns are used as means to systematically describe parallel
computation and communication when architecting parallel software. In an effort
to enable a more structured approach to designing and implementing parallel
applications, particularly for many-core processors, a catalog of parallel
patterns enables programmers to compose parallel algorithms, which may be
easily implemented using various programming interfaces such as OpenMP, OpenCL,
Cilk Plus, ArBB, Thread Building Blocks :cite:`McCool:2012`. For the design of
parallel algorithms, deterministic patterns support the development of systems
that automatically avoid unsafe race conditions and deadlock
:cite:`McCool:2010`.

Design patterns have been identified in a variety of other domains for
codifying the best-known solutions to common problems, including natural
language processing :cite:`Talton:2012`, user interface design
:cite:`Borchers:2001`, Web design :cite:`Duyne:2002`, visualization
:cite:`Heer:2006`, software security :cite:`Dougherty:2009` and
high-performance computing resilience
:cite:`hukerikar17resilience,engelmann22rdp-20`. Patterns have also been
defined for enterprise applications that involve data processing in support or
automation of business processes :cite:`Fowler:2002` in order to bring
structure to the construction of enterprise application architectures. In each
of these domains of design, patterns capture the essence of effective
solutions in a succinct form that may be easily applied in similar form
to other contexts and problems.

Execution patterns, not design patterns, for workflows in general describe the
functionality of a workflow :cite:`aalst02workflow`, such as execution graphs,
decision points and synchronization points. Common motifs in scientific
workflows :cite:`GARIJO2014338` start making the connection between the
functionality of a workflow and certain common execution patterns, such as data
movement and data analysis steps. Similar workflows execution patterns, not
design patterns, have been recently proposed for instrument science
:cite:`VESCOVI2022100606`. The :ref:`intersect:arch:iri` Blueprint Activity
:cite:`IRI:2023` has recently defined
:ref:`intersect:arch:sos:logical:systems:ors:workflows:pattern` for scientific
computational workflows, such as :ref:`intersect:arch:iri:patterns:time`,
:ref:`intersect:arch:iri:patterns:data` and
:ref:`intersect:arch:iri:patterns:long`.
