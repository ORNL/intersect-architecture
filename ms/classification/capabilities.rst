.. _intersect:arch:ms:classification:capabilities:

Definition of Microservice Capabilities
---------------------------------------

As previously described in :ref:`intersect:arch:ms`,
a *Microservice* provides a well-defined set of functionality that is
scoped to focus on a particular domain of interest. The set of
*Microservice Functions* with associated input and output data is known
as the *Microservice Contract*. In the following subsections, we define
microservice capabilities that describe the purpose and proposed
functionality for a wide range of unique focus domains. For each
capability, the proposed functionality (i.e., methods and associated
data) is grouped by the corresponding microservice interaction pattern.
Together, the functionality definitions can serve as the basis for an
implementation’s microservice contract. Where applicable, we also
indicate relationships to other microservice capabilities, such as
functionality extensions or required dependencies.

The functionality provided by a microservice will necessarily change
over time to adapt to new requirements or use cases. As a result, each
microservice capability definition should be versioned to ensure that
providers and clients of the capability can agree on a consistent set of
the included functionality and any custom data type defintions. A
suitable approach to versioning of microservice APIs is that defined by
Semantic Versioning :cite:`SemanticVersioning:v2`.

:ref:`intersect:arch:ms:classification:capabilities:definition` is an example of
the capability definition format that describes the information provided
by each element of the definition. The data types used in defining each
capability are generic names for common types and structures supported
by the data models of most data schema standards (e.g., JSON
Schema :cite:`IETF:JSON-schema`, XML Schema Definition
(XSD) :cite:`W3C:XML-Schema-Definition`, and Apache
Avro :cite:`Apache:Avro`). To avoid confusion with specific
schema data model types,
:numref:`intersect:arch:ms:classification:capabilities:types` provides a
description for each generic type or structure and lists compatible
specific types for a few data schema formats commonly used in
microservice messaging.

.. list-table:: Generic Data Types and Structures and Associated Schema-specific Representations
   :name: intersect:arch:ms:classification:capabilities:types
   :header-rows: 1

   * - | **Data Type**
       | **or Structure**
     - |
       | **Description**
     - | **JSON Schema**
       | **Types**
     - | **XML Schema**
       | **Types**
     - | **Apache Avro**
       | **Types**
   * - ``Boolean``
     - | A logical value representing
       | ``True`` or ``False`` values.
     - ``boolean``
     - ``boolean``
     - ``boolean``
   * - ``Bytes``
     - An ordered sequence of byte values.
     - | ``string``
       | (Base64 encoded)
     - | ``hexBinary``,
       | ``base64Binary``
     - ``bytes``
   * - ``Integer``
     - | An integral numeric value, preferably
       | supporting up to 64-bit values.
     - ``number``
     - ``decimal``
     - ``long``
   * - ``Filepath``
     - | An absolute path to a local file system
       | entry (i.e., a file or directory).
     - ``string``
     - ``string``
     - ``string``
   * - ``Float``
     - | A floating point numeric value,
       | preferably supporting double precision.
     - ``number``
     - ``double``
     - ``double``
   * - ``KeyVal<type>``
     - | A uniquely-named ``String`` key paired
       | with an associated ``type`` value.
     - | ``object:``
       | ``{key, value}``
     - | ``<key>``
       | element
     - ``map``
   * - ``List<type>``
     - A list of items having the given ``type``.
     - ``array``
     - | ``list``,
       | ``sequence``
     - ``array``
   * - ``String``
     - | A character string of unspecified length,
       | preferably encoded using Unicode.
     - ``string``
     - ``string``
     - ``string``
   * - ``TimeDuration``
     - | A value representing the difference
       | between a start and end ``TimeStamp``.
     - | ``string``
       | ``(format: duration)``
     - ``duration``
     - | ``string``
       | ``(logicalType: duration)``
   * - ``TimeStamp``
     - | A timestamp value, preferably in Universal
       | Coordinated Time (UTC) format.
     - | ``string``
       | ``(format: date-time)``
     - ``dateTime``
     - | ``string``
       | ``(logicalType: timestamp-millis)``
   * - ``UUID``
     - | A universally unique identifier as defined
       | in RFC 4122.
     - | ``string``
       | ``(format: uuid)``
     - ``string``
     - | ``string``
       | ``(logicalType: uuid)``


.. _intersect:arch:ms:classification:capabilities:definition:

Microservice Capability Definition Format
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Capability**: *Capability Class* :: *Capability Name*

   :Description:
       A short summary description of the domain of interest for this
       capability and the provided functionality.

   :Version:
       A meaningful version number for the capability and its provided
       interaction methods and data types. For new versions, the changes
       from the previous version (i.e., additions, deprecations, or deletions)
       should be enumerated.

   :Related Capabilities:
       Where applicable, provides references to related capabilities.

       - *Extends* - A list of base capabilities that the functionality of this
         capability extends. A service implementing this capability must also
         implement the base capabilities.
       - *Requires* - A list of required capabilities that are necessary to
         implement the functionality of this capability.
         The required capabilities are most often provided by other services,
         but may be implemented in the same service.
         Where necessary, specific versions of the required capabilities may
         be specified.

   :Data Definitions:
       A summary list of custom data structures defined by the capability. The
       definitions should only include data members whose type is either one
       of the generic types defined in :numref:`intersect:arch:ms:classification:capabilities:types`
       or a custom type defined within this capability definition.

   :Interactions:
       A summary list of the interactions provided by the capability, including 
       all command and request methods and any asynchronous events or status
       updates that may be generated.

   - *Data Definition* - ``TypeName``

     * ``memberName`` (``DataType``) : A description of the data, including any
       format or value constraints.

   - *Asynchronous Event* - ``EventName``

     + Purpose: A description of the event and its cause (if any).
     + Event Data: A list of data parameters included in the current event.

       * ``paramName`` (``DataType``) : A description of the data, including any
         format or value constraints.

   - *Asynchronous Status* - ``StatusName``

     + Purpose: A description of the activity status or state change.
     + Status Data: A list of data parameters included in the current status.

       * ``paramName`` (``DataType``) : A description of the data, including any
         format or value constraints.

   - *Command* - ``MethodName()``

     + Purpose: A short description of the purpose of the current command method
       and any asynchronous events or status updates that will be generated upon
       command completion.
     + Command Data: A list of input parameter definitions for the current method.

       * ``paramName`` (``DataType``) : A description of the data, including any
         format or value constraints.

   - *Request-Reply* - ``MethodName()``

     + Purpose: A short description of the purpose of the current request method
       and any asynchronous events or status updates that will be generated upon
       request completion.
     + Request Data: A list of input parameter definitions for the current method.

       * ``paramName`` (``DataType``) : A description of the data, including any
         format or value constraints.

     + Reply Data: A list of output parameter definitions for the current method.

       * ``paramName`` (``DataType``) : A description of the data, including any
         format or value constraints.

   

