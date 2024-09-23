.. _`intersect:arch:ms:capability:infrastructure:data_info:stream`:

Capability - Data and Information Management :: Data Stream
-----------------------------------------------------------

:Description:
   Provides producer/consumer access to named streams of sequenced data
   items. A data stream can be considered a specialized form of data
   collection where each item in the collection is assigned a unique
   monotonically increasing index as its name when it is added to the
   collection. Stream data indices are numbered starting from ``1``.
   Consumers of the data stream may access its items in any order using
   the assigned indices, although the expectation is that sequential
   accesses will be most common.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends:

      + :ref:`intersect:arch:ms:capability:infrastructure:data_info:storage`
   - Requires: None

:Data Definitions:
   ``DataStreamDetails``

:Interactions:
   - Asynchronous: ``DataStreamCreation``, ``DataStreamRemoval``,
     ``DataStreamItemAddition``, 
   - Command: ``CreateDataStream()``, ``RemoveDataStream()``,
     ``AddDataStreamItem()``, ``AddDataStreamCollection()``, 
     ``AddDataStreamItemFromBytes()``, ``AddDataStreamItemFromLocalFile()``
   - Request-Reply: ``GetDataStreamDetails()``, ``GetDataStreamItemDetails()``,
     ``GetDataStreamItemAsBytes()``, ``GetDataStreamItemAsLocalFile()``,
     ``ListDataStreams()``

- *Data Definition* - ``DataStreamDetails``

      *  ``streamName`` (``String``) : The name of the data item stream.

      *  ``streamNamespace`` (``String``) : The name of the namespace that
         contains the stream.

      *  ``streamItemCount`` (``Integer``) : The number of data items that
         have been added to the stream.

      *  ``streamSize`` (``Integer``) : The aggregate size in bytes of all
         the data items in the stream.

      *  ``streamCreationTime`` (``TimeStamp``) : Creation timestamp for
         the stream.

      *  ``streamProperties`` (``List< KeyVal<String> >``) : *[Optional]* A
         list of key-value ``String`` pairs for the stream’s properties.

- *Asynchronous Status* - ``DataStreamCreation``

      + Purpose: Notification of data item stream creations.

      + Event Data:

         *  ``collectionDetails`` (``DataCollectionDetails``) : The
            details for the data item stream.

- *Asynchronous Status* - ``DataStreamRemoval``

      + Purpose: Notification of data item stream removals.

      + Event Data:

         *  ``streamDetails`` (``DataStreamDetails``) : The details for
            the data item stream.

- *Asynchronous Status* - ``DataStreamItemAddition``

      + Purpose: Notification of data item additions to a stream.

      + Event Data:

         *  ``streamName`` (``String``) : The name of the data item
            stream.

         *  ``streamNamespace`` (``String``) : The name of the stream’s
            namespace.

         *  ``itemIndex`` (``Integer``) : The index of the most recently
            added data item.

- *Command* - ``CreateDataStream()``

      + Purpose: Create a new data item stream in the given namespace. On
        successful creation, triggers the ``DataStreamCreation`` event.

      + Command Data:

         *  ``streamName`` (``String``) : The name of the data item
            stream.

         *  ``streamNamespace`` (``String``) : The name of the namespace
            in which to place the stream.

         *  ``streamProperties`` (``List< KeyVal<String> >``) :
            *[Optional]* A list of key-value ``String`` pairs to use as
            the stream’s properties.

- *Command* - ``AddDataStreamItem()``

      + Purpose: Add an existing data item to the named stream. The item is a
        reference to the existing named item in the given namespace and
        optional collection, and thus no additional data is stored. On
        successful creation, triggers the ``DataStreamItemAddition``
        event.

      + Command Data:

         *  ``itemName`` (``String``) : The name of the existing data
            item.

         *  ``itemNamespace`` (``String``) : The name of the namespace
            in which the data item resides.

         *  ``itemCollection`` (``String``) : *[Optional]* The name of the
            collection in which the data item resides.

         *  ``streamName`` (``String``) : The name of the data item
            stream in which to put the new data item.

         *  ``streamNamespace`` (``String``) : The name of the stream’s
            namespace.

- *Command* - ``AddDataStreamCollection()``

      + Purpose: Adds all items from an existing data item collection to the
        named stream. The items from the existing named collection are
        added to the stream as references, and thus no additional data
        is stored. On successful creation, triggers the
        ``DataStreamItemAddition`` event.

      + Command Data:

         *  ``collectionName`` (``String``) : The name of the existing
            data item collection.

         *  ``collectionNamespace`` (``String``) : The name of the
            namespace in which the collection resides.

         *  ``streamName`` (``String``) : The name of the data item
            stream in which to put the collection’s data items.

         *  ``streamNamespace`` (``String``) : The name of the stream’s
            namespace.

- *Command* - ``AddDataStreamItemFromBytes()``

      + Purpose: Add a new data item with provided contents to the named stream.
        On successful creation, triggers the ``DataStreamItemAddition``
        event. (NOTE: An implementation may limit the maximum size of a
        data item that can be created from bytes.)

      + Command Data:

         *  ``streamName`` (``String``) : The name of the data item
            stream in which to put the new data item.

         *  ``streamNamespace`` (``String``) : The name of the stream’s
            namespace.

         *  ``contentBytes`` (``Bytes``) : The data item contents.

         *  ``itemProperties`` (``List< KeyVal<String> >``) : *[Optional]*
            A list of key-value ``String`` pairs to use as the data
            item’s properties.

- *Command* - ``AddDataStreamItemFromLocalFile()``

      + Purpose: Add a new data item associated with an existing local file to
        the named stream. On successful creation, triggers the
        ``DataStreamItemAddition`` event.

      + Command Data:

         *  ``streamName`` (``String``) : The name of the data item
            stream in which to put the new data item.

         *  ``streamNamespace`` (``String``) : The name of the stream’s
            namespace.

         *  ``localFilePath`` (``Filepath``) : The absolute path of the
            local file from which to create the data item.

         *  ``itemProperties`` (``List< KeyVal<String> >``) : *[Optional]*
            A list of key-value ``String`` pairs to use as the data
            item’s properties.

- *Command* - ``RemoveDataStream()``

      + Purpose: Remove an existing data item stream from the given namespace.
        All data items in the stream that are not references to
        existing data items will also be removed. On successful
        removal, triggers the ``DataStreamRemoval`` event.

      + Command Data:

         *  ``streamName`` (``String``) : The name of the data item
            stream.

         *  ``streamNamespace`` (``String``) : The name of the stream’s
            namespace.

- *Request-Reply* - ``GetDataStreamDetails()``

      + Purpose: Get the detailed information for the named data item collection.

      + Request Data:

         *  ``streamName`` (``String``) : The name of the data item
            stream.

         *  ``streamNamespace`` (``String``) : The name of the namespace
            in which the stream resides.

      + Reply Data:

         *  ``streamDetails`` (``DataStreamDetails``) : The details for
            the data item stream.

- *Request-Reply* - ``GetDataStreamItemAsBytes()``

      + Purpose: Get the contents of the named data item as bytes. (NOTE: An
        implementation may limit the maximum size of a data item that
        can be fetched as bytes.)

      + Request Data:

         *  ``streamName`` (``String``) : The name of the data item
            stream.

         *  ``streamNamespace`` (``String``) : The name of the stream’s
            namespace.

         *  ``itemIndex`` (``Integer``) : The index of the data item
            within the named stream.

      + Reply Data:

         *  ``contentBytes`` (``Bytes``) : The data item contents.

- *Request-Reply* - ``GetDataStreamItemAsLocalFile()``

      + Purpose: Get the absolute path of a local file that can be used to
        retrieve the data item contents.

      + Request Data:

         *  ``streamName`` (``String``) : The name of the data item
            stream.

         *  ``streamNamespace`` (``String``) : The name of the stream’s
            namespace.

         *  ``itemIndex`` (``Integer``) : The index of the data item
            within the named stream.

      + Reply Data:

         *  ``localFilePath`` (``Filepath``) : The absolute path to a
            local file.

         *  ``isTempFile`` (``Boolean``) : Flag indicating whether the
            returned path is for a temporary file that should be deleted
            by the client when it is done using the file.

- *Request-Reply* - ``GetDataStreamItemDetails()``

      + Purpose: Get the detailed information for the named data item.

      + Request Data:

         *  ``streamName`` (``String``) : The name of the data item
            stream.

         *  ``streamNamespace`` (``String``) : The name of the stream’s
            namespace.

         *  ``itemIndex`` (``Integer``) : The index of the data item
            within the named stream.

      + Reply Data:

         *  ``itemDetails`` (``DataItemDetails``) : The details for the
            data item.

- *Request-Reply* - ``ListDataStreams()``

      + Purpose: Get a list of the data item streams that reside in the given
        namespace.

      + Request Data:

         *  ``namespaceName`` (``String``) : The name of the namespace
            to query for streams.

      + Reply Data:

         *  ``streamNames`` (``List<String>``) : The list of stream
            names.
