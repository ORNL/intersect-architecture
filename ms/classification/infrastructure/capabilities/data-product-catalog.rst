.. _`intersect:arch:ms:capability:infrastructure:data_info:data_catalog`:

Capability - Data and Information Management :: Data Catalog
------------------------------------------------------------

:Description:
   Provides information on published data products and data streams.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends: None
   - Requires:

      + :ref:`intersect:arch:ms:capability:infrastructure:data_info:er_catalog`

:Interactions:
   - Asynchronous: ``DataCatalogProductAvailable``, ``DataCatalogProductRemoval``,
     ``DataCatalogStreamAvailable``, ``DataCatalogStreamRemoval``
   - Command: ``PublishDataProduct()``, ``RemoveDataProduct()``, 
     ``PublishDataStream()``, ``RemoveDataStream()``
   - Request-Reply: ``CreateDataProductUUID()``, ``CreateDataStreamUUID()``,
     ``GetDataProductInformation()``, ``GetDataStreamInformation()``

- *Asynchronous Status* - ``DataCatalogProductAvailable``

      + Purpose: Notification of published data products.

      + Event Data:

         *  ``productId`` (``UUID``) : The UUID of the data product.

         *  ``serviceId`` (``UUID``) : The UUID of the Data Storage
            service hosting the data product.

         *  ``namespaceName`` (``String``) : The name of the data
            namespace containing the product.

         *  ``collectionName`` (``String``) : *[Optional]* The name of the
            data collection for the product.

         *  ``itemName`` (``String``) : *[Optional]* The name of the data
            item for the product.

- *Asynchronous Status* - ``DataCatalogProductRemoval``

      + Purpose: Notification of data product removal.

      + Event Data:

         *  ``productId`` (``UUID``) : The UUID of the data product.

- *Asynchronous Status* - ``DataCatalogStreamAvailable``

      + Purpose: Notification of published data streams.

      + Event Data:

         *  ``streamId`` (``UUID``) : The UUID of the data stream.

         *  ``serviceId`` (``UUID``) : The UUID of the Data Stream
            service hosting the data stream.

         *  ``namespaceName`` (``String``) : The name of the data
            namespace containing the stream.

         *  ``streamName`` (``String``) : The name of the data stream.

- *Asynchronous Status* - ``DataCatalogStreamRemoval``

      + Purpose: Notification of data stream removal.

      + Event Data:

         *  ``streamId`` (``UUID``) : The UUID of the data stream.

- *Command* - ``PublishDataProduct()``

      + Purpose: Publish the availability of a data product (i.e., a data item
        or data collection). Successful publication will trigger the
        ``DataCatalogProductAvailable`` event and creation of a
        ``DataItem`` or ``DataItemCollection`` entity with the given
        information and a relationship to the new entity with the
        parent ``DataNamespace``.

      + Command Data:

         *  ``productDescription`` (``String``) : A user-friendly
            description of the product.

         *  ``productId`` (``UUID``) : The UUID of the data product.

         *  ``serviceId`` (``UUID``) : The UUID of the Data Storage
            service hosting the data product.

         *  ``namespaceName`` (``String``) : The name of the data
            namespace containing the product.

         *  ``collectionName`` (``String``) : *[Optional]* The name of the
            data collection for the product.

         *  ``itemName`` (``String``) : *[Optional]* The name of the data
            item for the product.

         *  ``productLabels`` (``List<String>``) : *[Optional]* A list of
            ``String`` labels for the data product.

         *  ``productProperties`` (``List< KeyVal<String> >``) :
            *[Optional]* A list of key-value ``String`` pairs for the data
            product’s properties.

- *Command* - ``RemoveDataProduct()``

      + Purpose: Remove a data product from the catalog. Successful removal will
        trigger the ``DataCatalogProductRemoval`` event.

      + Command Data:

         *  ``productId`` (``UUID``) : The UUID of the data product.

- *Command* - ``PublishDataStream()``

      + Purpose: Publish the availability of a data stream. Successful
        publication will trigger the ``DataCatalogStreamAvailable``
        event and creation of a ``DataStream`` entity with the given
        information and a relationship to the new entity with the
        parent ``DataNamespace``.

      + Command Data:

         *  ``streamDescription`` (``String``) : A user-friendly
            description of the data stream.

         *  ``streamId`` (``UUID``) : The UUID of the data product.

         *  ``serviceId`` (``UUID``) : The UUID of the Data Stream
            service hosting the data stream.

         *  ``namespaceName`` (``String``) : The name of the data
            namespace containing the stream.

         *  ``streamName`` (``String``) : The name of the data stream.

         *  ``streamLabels`` (``List<String>``) : *[Optional]* A list of
            ``String`` labels for the data stream.

         *  ``streamProperties`` (``List< KeyVal<String> >``) :
            *[Optional]* A list of key-value ``String`` pairs for the data
            streams’s properties.

- *Command* - ``RemoveDataStream()``

      + Purpose: Remove a data stream from the catalog. Successful removal will
        trigger the ``DataCatalogStreamRemoval`` event.

      + Command Data:

         *  ``streamId`` (``UUID``) : The UUID of the data stream.

- *Request-Reply* - ``CreateDataProductUUID()``

      + Purpose: Create a UUID for a new data product (i.e., a data item or data
        collection).

      + Reply Data:

         *  ``productId`` (``UUID``) : The assigned UUID for the data
            product.

         *  ``errorMsg`` (``String``) : An error message describing why
            UUID creation failed.

- *Request-Reply* - ``CreateDataStreamUUID()``

      + Purpose: Create a UUID for a new data stream.

      + Reply Data:

         *  ``streamId`` (``UUID``) : The assigned UUID for the data
            stream.

         *  ``errorMsg`` (``String``) : An error message describing why
            UUID creation failed.

- *Request-Reply* - ``GetDataProductInformation()``

      + Purpose: Get the full set of data catalog information for the given
        ``productId``.

      + Request Data:

         *  ``productId`` (``UUID``) : The UUID of the data product.

      + Reply Data:

         *  ``productInfo`` (``CatalogEntityInformation``) : The catalog
            information for the data product.

         *  ``errorMsg`` (``String``) : An error message describing why
            the lookup failed.

- *Request-Reply* - ``GetDataStreamInformation()``

      + Purpose: Get the full set of data catalog information for the given ``streamId``.

      + Request Data:

         *  ``streamId`` (``UUID``) : The UUID of the data stream.

      + Reply Data:

         *  ``streamInfo`` (``CatalogEntityInformation``) : The catalog
            information for the data stream.

         *  ``errorMsg`` (``String``) : An error message describing why
            the lookup failed.
