.. _intersect:arch:ms:classification:infrastructure:capabilities:general_param_config:

Capability - Utility :: Parameter Configuration
-----------------------------------------------

:Description:
   Provides description and configuration of service parameters,
   allowing clients to query the supported parameters and their
   associated constraints and to set their values. Service parameters
   represent settings that affect the behavior of the service
   independent of any of its underlying capability interaction methods.
   Service parameters are defined in a generic fashion to allow
   representation of a wide variety of uses, including but not limited
   to static configuration settings, dynamic or runtime settings,
   instrument control parameters, machine learning model parameters,
   etc.

:Version:
   0.1 - Initial capability definition.

:Data Definitions:
   ``ParameterInfo``

:Interactions:
   - Asynchronous: None
   - Command: ``AddConfigurationParameters()``, ``SetConfigurationValues()``
   - Request-Reply: ``GetConfiguration()``, ``GetConfigurationValues()``,
     ``GetParameterDetails()``, ``GetParameterNames()``,
     ``ValidateParameters()``

- *Data Definition* - ``ParameterInfo``

      * ``paramName`` (``String``) : The name of the parameter. The name
        must be unique among all parameters supported by a given service
        (which may implement several capabilities).
      * ``paramDescription`` (``String``) : A detailed description of the
        parameter’s intended usage, including a discussion of its type and
        acceptable values.
      * ``paramType`` (``String``) : The name of the generic data type for
        the parameter.
      * ``defaultValue`` (``String``) : A string representation of the
        parameter’s default value.
      * ``permittedValues`` (``List<String>``) : An optional list of
        strings that enumerates acceptable values for the parameter. For
        numeric parameters, each string may represent a value range (e.g.,
        "[0,100]").

- *Command* - ``AddConfigurationParameters()``

      + Purpose: Add the given parameters to the service’s supported
        configuration set.

      + Command Data:

         * ``parameters`` (``List<ParameterInfo>``) : A list of
           parameter information structures.

- *Command* - ``SetConfigurationValues()``

      + Purpose: Update the service’s configuration using the given parameter
        name-value list.

      + Command Data:

         * ``configValues`` (``List< KeyVal<String> >``) : The list of
           configuraton parameter name-value ``String`` pairs.

- *Request-Reply* - ``GetParameterNames()``

      + Purpose: Request a list of the service’s supported configuration
        parameter names.

      + Request Data: None

      + Reply Data:

         * ``paramNames`` (``List<String>``) : The list of supported
           parameter names.

- *Request-Reply* - ``GetParameterDetails()``

      + Purpose: Request detailed information for the given list of
        ``paramNames``.

      + Request Data:

         * ``paramNames`` (``List<String>``) : A list of service
           parameter names.

      + Reply Data:

         * ``paramDetails`` (``List<ParameterInfo>``) : A list of
           parameter information structures for the requested service
           parameters.

- *Request-Reply* - ``GetConfiguration()``

      + Purpose: Request the current values for all service configuration
        parameters.

      + Request Data: None

      + Reply Data:

         * ``configValues`` (``List< KeyVal<String> >``) : A list of
           name-value ``String`` pairs for all supported service
           parameters.

- *Request-Reply* - ``GetConfigurationValues()``

      + Purpose: Request the current values for the given list of ``configNames``.

      + Request Data:

         * ``configNames`` (``List<String>``) : A list of service
           configuration parameter names.

      + Reply Data:

         * ``configValues`` (``List< KeyVal<String> >``) : A list of
           name-value ``String`` pairs for the requested service
           parameters.

- *Request-Reply* - ``ValidateParameters()``

      + Purpose: Validate the given list of service configuration parameter
        name-value pairs.

      + Request Data:

         * ``paramValues`` (``List< KeyVal<String> >``) : A list of
           parameter name-value pairs.

      + Reply Data:

         * ``invalidCount`` (``Integer``) : The number of supplied
           parameters that were invalid.
         * ``invalidParams`` (``List< KeyVal<String> >``) : A list of
           name-reason pairs for the supplied parameters that were
           determined to be invalid.
