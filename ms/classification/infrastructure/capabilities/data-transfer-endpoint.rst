.. _`intersect:arch:ms:capability:infrastructure:data_info:transfer_endpoint`:

Capability - Data and Information Management :: Data Transfer Endpoint
----------------------------------------------------------------------

:Description:
   Provides data transfer channels for data product and data stream
   transfers between *Data Storage* services.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends: None
   - Requires:

      + :ref:`intersect:arch:ms:capability:infrastructure:data_info:storage`
      + :ref:`intersect:arch:ms:capability:infrastructure:data_info:stream`

:Interactions:
   - Asynchronous: ``DataTransferSourceEndpointCreation``,
     ``DataTransferDestinationEndpointCreation``
   - Command: ``SendDataItem()``, ``ReceiveDataItem()``,
     ``SendDataStreamItems()``, ``ReceiveDataStreamItems()``
   - Request-Reply: ``GetSupportedTransferMethods()``,
     ``CreateDataTransferSource()``, ``CreateDataTransferDestination()``

- *Asynchronous Status* - ``DataTransferSourceEndpointCreation``

      + Purpose: Notification of data transfer channel source endpoint creations.

      + Event Data:

         *  ``transferChannelId`` (``Integer``) : A unique transfer
            channel identifier.

         *  ``srcStorageService`` (``UUID``) : The UUID of the source
            *Data Storage* service.

         *  ``srcTransferEndpoint`` (``String``) : The channel endpoint
            information for the source *Data Transfer Endpoint* agent.

         *  ``transferMethod`` (``String``) : The transfer method used
            by the channel.

         *  ``transferOptions`` (``List<String>``) : The transfer
            options used by the channel.

- *Asynchronous Status* - ``DataTransferDestinationEndpointCreation``

      + Purpose: Notification of data transfer channel destination endpoint
        creations.

      + Event Data:

         *  ``transferChannelId`` (``Integer``) : A unique transfer
            channel identifier.

         *  ``dstStorageService`` (``UUID``) : The UUID of the
            destination *Data Storage* service.

         *  ``dstTransferEndpoint`` (``String``) : The channel endpoint
            information for the destination *Data Transfer Endpoint*
            agent.

         *  ``transferMethod`` (``String``) : The transfer method used
            by the channel.

         *  ``transferOptions`` (``List<String>``) : The transfer
            options used by the channel.

- *Command* - ``SendDataItem()``

      + Purpose: Send the named data item from the source storage service on the
        transfer channel. (NOTE: only valid for source endpoints)

      + Command Data:

         *  ``transferChannelId`` (``Integer``) : A unique transfer
            channel identifier.

         *  ``itemName`` (``String``) : The name of the data item to
            send on the transfer channel.

         *  ``itemNamespace`` (``String``) : The name of the namespace
            in which the data item resides.

         *  ``itemCollection`` (``String``) : [Optional] The name of the
            collection in which the data item resides.

- *Command* - ``ReceiveDataItem()``

      + Purpose: Receive the named data item on the transfer channel and store
        it in the destination storage service. (NOTE: only valid for
        destination endpoints)

      + Command Data:

         *  ``transferChannelId`` (``Integer``) : A unique transfer
            channel identifier.

         *  ``itemName`` (``String``) : The name of the data item to
            send on the transfer channel.

         *  ``itemNamespace`` (``String``) : The name of the namespace
            in which the data item resides.

         *  ``itemCollection`` (``String``) : [Optional] The name of the
            collection in which the data item resides.

- *Command* - ``SendDataStreamItems()``

      + Purpose: Send a sequence of data items denoted by first and last indices
        in the named stream from the source storage service on the
        transfer channel. (NOTE: only valid for source endpoints)

      + Command Data:

         *  ``transferChannelId`` (``Integer``) : A unique transfer
            channel identifier.

         *  ``streamName`` (``String``) : The name of the data item
            stream.

         *  ``streamNamespace`` (``String``) : The name of the namespace
            in which the data item stream resides.

         *  ``firstItemIndex`` (``Integer``) : The stream index of the
            first data item in the sequence.

         *  ``lastItemIndex`` (``Integer``) : The stream index of the
            last data item in the sequence.

- *Command* - ``ReceiveDataStreamItems()``

      + Purpose: Receive a sequence of data items denoted by first and last
        indices in the named stream on the transfer channel and add
        them to the corresponding stream in the destination storage
        service. (NOTE: only valid for destination endpoints)

      + Command Data:

         *  ``transferChannelId`` (``Integer``) : A unique transfer
            channel identifier.

         *  ``streamName`` (``String``) : The name of the data item
            stream.

         *  ``streamNamespace`` (``String``) : The name of the namespace
            in which the data item stream resides.

         *  ``firstItemIndex`` (``Integer``) : The stream index of the
            first data item in the sequence.

         *  ``lastItemIndex`` (``Integer``) : The stream index of the
            last data item in the sequence.

- *Request-Reply* - ``GetSupportedTransferMethods()``

      + Purpose: Get a list of the supported data transfer methods.

      + Reply Data:

         *  ``transferMethods`` (``List< String >``) : A list of
            supported data transfer methods.

- *Request-Reply* - ``CreateDataTransferSource()``

      + Purpose: Using the given transfer channel id, transfer method, and
        transfer channel options, establish a data transfer channel and
        return its source endpoint information. On successful creation,
        triggers the ``DataTransferSourceEndpointCreation`` event.

      + Request Data:

         *  ``srcStorageService`` (``UUID``) : The UUID of the source
            *Data Storage* service.

         *  ``transferChannelId`` (``Integer``) : A unique transfer
            channel identifier.

         *  ``transferMethod`` (``String``) : The transfer method to use
            for the channel endpoint.

         *  ``transferOptions`` (``List<String>``) : The transfer
            options requested for the channel.

      + Reply Data:

         *  ``endpointInfo`` (``String``) : The information needed by
            the destination endpoint to establish a channel connection
            to the source endpoint.

         *  ``transferOptions`` (``List<String>``) : The transfer
            options used for the channel.

         *  ``errorMsg`` (``String``) : An error message describing why
            the transfer channel endpoint could not be established.

- *Request-Reply* - ``CreateDataTransferDestination()``

      + Purpose: Using the given transfer channel id, transfer method, and
        transfer channel options, establish a data transfer channel and
        return its destination endpoint information. On successful
        creation, triggers the
        ``DataTransferDestinationEndpointCreation`` event.

      + Request Data:

         *  ``dstStorageService`` (``UUID``) : The UUID of the
            destination *Data Storage* service.

         *  ``transferChannelId`` (``Integer``) : A unique transfer
            channel identifier.

         *  ``transferMethod`` (``String``) : The transfer method to use
            for the channel endpoint.

         *  ``transferOptions`` (``List<String>``) : The transfer
            options requested for the channel.

      + Reply Data:

         *  ``endpointInfo`` (``String``) : The information needed by
            the source endpoint to establish a channel connection to the
            destination endpoint.

         *  ``transferOptions`` (``List<String>``) : The transfer
            options used for the channel.

         *  ``errorMsg`` (``String``) : An error message describing why
            the transfer channel endpoint could not be established.
