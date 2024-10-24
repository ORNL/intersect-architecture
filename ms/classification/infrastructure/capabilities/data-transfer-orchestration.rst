.. _intersect:arch:ms:classification:infrastructure:capabilities:data_transfer_orchestration:

Capability - Data and Information Management :: Data Transfer Orchestration
---------------------------------------------------------------------------

:Description:
   Orchestrates data product and stream transfers between *Data Storage*
   services using *Data Transfer Endpoint* agents.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends: None
   - Requires:

      + :ref:`intersect:arch:ms:classification:infrastructure:capabilities:data_er_catalog`
      + :ref:`intersect:arch:ms:classification:infrastructure:capabilities:data_storage`
      + :ref:`intersect:arch:ms:classification:infrastructure:capabilities:data_stream`
      + :ref:`intersect:arch:ms:classification:infrastructure:capabilities:data_transfer_endpoint`

:Interactions:
   - Asynchronous: ``DataTransferChannelCreation``
   - Command: ``TransferDataProduct()``, ``TransferDataStream()``
   - Request-Reply: ``NegotiateDataTransfer()``

- *Asynchronous Status* - ``DataTransferChannelCreation``

      + Purpose: Notification of data transfer channel creations.

      + Event Data:

         *  ``transferChannelId`` (``Integer``) : A unique transfer
            channel identifier.

         *  ``srcStorageService`` (``UUID``) : The UUID of the source
            *Data Storage* service.

         *  ``dstStorageService`` (``UUID``) : The UUID of the
            destination *Data Storage* service.

         *  ``srcTransferEndpoint`` (``String``) : The channel endpoint
            information for the source *Data Transfer Endpoint* agent.

         *  ``dstTransferEndpoint`` (``String``) : The channel endpoint
            information for the destination *Data Transfer Endpoint*
            agent.

         *  ``transferMethod`` (``String``) : The transfer method used
            by the channel.

- *Command* - ``TransferDataProduct()``

      + Purpose: Using the given transfer channel, transfer a data product
        (i.e., a data item or data item collection) from the source to
        destination according to the given transfer mode.

      + Command Data:

         *  ``transferChannelId`` (``Integer``) : A unique transfer
            channel identifier.

         *  ``productId`` (``UUID``) : The source catalog id of the data
            product to transfer.

         *  ``transferMode`` (``String``) : The transfer mode (e.g.,
            "COPY", "MOVE", or "MIRROR"). Copying duplicates the product
            at the destination, while moving entail removal of the
            source product. Mirroring is only supported for data item
            collections, and ensures that any data items added to the
            collection will be transferred.

         *  ``transferTimeout`` (``Integer``) : *[Optional]* Timeout in
            seconds to complete the transfer (not valid for mirroring).

- *Command* - ``TransferDataStream()``

      + Purpose: Using the given transfer channel, transfer a data item stream
        from the source to destination according to the given transfer
        mode.

      + Command Data:

         *  ``transferChannelId`` (``Integer``) : A unique transfer
            channel identifier.

         *  ``streamId`` (``UUID``) : The source catalog id of the data
            stream to transfer.

         *  ``transferMode`` (``String``) : The transfer mode (e.g.,
            "COPY" or "MIRROR"). Copying will transfer all items
            currently in the stream, while mirroring will only transfer
            new items added to the stream.

- *Request-Reply* - ``NegotiateDataTransfer()``

      + Purpose: Negotiate a data transfer channel between *Data Transfer
        Endpoint* agents to enable data product and data stream
        transfers between *Data Storage* services. On successful
        negotiation, triggers the ``DataTransferChannelCreation``
        event.

      + Request Data:

         *  ``srcCatalogService`` (``UUID``) : The UUID of the source
            *Data Catalog* service.

         *  ``srcStorageService`` (``UUID``) : The UUID of the source
            *Data Storage* service.

         *  ``dstStorageService`` (``UUID``) : The UUID of the
            destination *Data Storage* service.

         *  ``transferOptions`` (``List<String>``) : A list of requested
            transfer options (e.g., "compression=on, transferBlock=4M").
            There is no guarantee that any requested options will be
            used, as option availability dependencies on the negotiated
            transfer method and endpoint agent features.

      + Reply Data:

         *  ``transferChannelId`` (``Integer``) : A unique transfer
            channel identifier.

         *  ``errorMsg`` (``String``) : An error message describing why
            the transfer channel negotiation failed.
