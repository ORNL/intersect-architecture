.. _`intersect:arch:ms:capability:infrastructure:utility:uuid_gen`:

Capability - Utility :: UUID Generation
---------------------------------------

:Description:
   Provides generation of UUID according to RFC
   4122 :cite:`RFC:4122`.

:Version:
   0.1 - Initial capability definition.

:Interactions:
   - Asynchronous: None
   - Command: None
   - Request-Reply: ``GetNamespaceUUID()``, ``GetUUID()``

- *Request-Reply* - ``GetNamespaceUUID()``

      + Purpose: Request a new name-based (i.e., version 3 or version 5) UUID
        value.

      + Request Data:

         * ``namespaceId`` (``UUID``) : The namespace base UUID base.
         * ``name`` (``String``) : The unique name within the namespace
           to use in generation of the UUID.

      + Reply Data:

         * ``id`` (``UUID``) : The new UUID.
         * ``errorMsg`` (``String``) : An error message describing why
           UUID generation failed.

- *Request-Reply* - ``GetUUID()``

      + Purpose: Request a new time-based (i.e., version 1) UUID value.

      + Request Data: None

      + Reply Data:

         * ``id`` (``UUID``) : The new UUID.
         * ``errorMsg`` (``String``) : An error message describing why
           UUID generation failed.
