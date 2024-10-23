.. _intersect:arch:ms:classification:infrastructure:capabilities:data_storage:

Capability - Data and Information Management :: Data Storage
------------------------------------------------------------

:Description:
   Provides storage for data items and collections of data items within
   one or more namespaces as shown in
   :ref:`intersect:arch:ms:classification:infrastructure:data_info:data_mgmt:model`.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends: None
   - Requires: None

:Data Definitions:
   ``DataCollectionDetails``, ``DataItemDetails``, ``DataNamespaceDetails``

:Interactions:
   - Asynchronous: ``DataCollectionCreation``, ``DataCollectionRemoval``,
     ``DataItemCreation``, ``DataItemRemoval``, ``DataItemUpdate``,
     ``DataNamespaceCreation``, ``DataNamespaceRemoval``
   - Command: ``CreateDataCollection()``, ``RemoveDataCollection()``, 
     ``CreateDataItemFromBytes()``, ``CreateDataItemFromLocalFile()``, 
     ``RemoveDataItem()``, ``UpdateDataItem()``,
     ``CreateDataNamespace()``, ``RemoveDataNamespace()``
   - Request-Reply: ``GetDataCollectionDetails()``,
     ``GetDataNamespaceDetails()``, ``GetDataItemDetails()``,
     ``GetDataItemAsBytes()``, ``GetDataItemAsLocalFile()``, 
     ``ListDataCollections()``, ``ListDataItems()``, ``ListDataNamespaces()``

- *Data Definition* - ``DataCollectionDetails``

      *  ``collectionName`` (``String``) : The name of the data item
         collection.

      *  ``collectionNamespace`` (``String``) : The name of the namespace
         that contains the collection.

      *  ``collectionItemCount`` (``Integer``) : The number of data items
         in the collection.

      *  ``collectionSize`` (``Integer``) : The aggregate size in bytes of
         all the data items in the collection.

      *  ``collectionCreationTime`` (``TimeStamp``) : Creation timestamp
         for the collection.

      *  ``collectionProperties`` (``List< KeyVal<String> >``) : *[Optional]*
         A list of key-value ``String`` pairs for the collection’s
         properties.

- *Data Definition* - ``DataItemDetails``

      *  ``itemName`` (``String``) : The name of the data item.

      *  ``itemNamespace`` (``String``) : The name of the namespace that
         contains the data item.

      *  ``itemSize`` (``Integer``) : The size in bytes of the data item.

      *  ``itemCreationTime`` (``TimeStamp``) : Timestamp of the data
         item’s creation.

      *  ``itemUpdateTime`` (``TimeStamp``) : *[Optional]* Timestamp of the
         most recent update data item.

      *  ``itemCollection`` (``String``) : *[Optional]* When part of a
         collection, the name of the collection that contains the data
         item.

      *  ``itemProperties`` (``List< KeyVal<String> >``) : *[Optional]* A
         list of key-value ``String`` pairs for the data item’s properties.

- *Data Definition* - ``DataNamespaceDetails``

      *  ``namespaceName`` (``String``) : The name of the data item
         collection.

      *  ``namespaceCollectionCount`` (``Integer``) : The number of data
         item collections in the namespace.

      *  ``namespaceItemCount`` (``Integer``) : The total number of data
         items in the namespace, including all collections.

      *  ``namespaceSize`` (``Integer``) : The aggregate size in bytes of
         all the data items in the namespace, including all collections.

- *Asynchronous Status* - ``DataCollectionCreation``

      + Purpose: Notification of data item collection creations.

      + Event Data:

         *  ``collectionDetails`` (``DataCollectionDetails``) : The
            details for the collection.

- *Asynchronous Status* - ``DataCollectionRemoval``

      + Purpose: Notification of data item collection removals.

      + Event Data:

         *  ``collectionDetails`` (``DataCollectionDetails``) : The
            details for the collection.

- *Asynchronous Status* - ``DataItemCreation``

      + Purpose: Notification of data item creations.

      + Event Data:

         *  ``itemDetails`` (``DataItemDetails``) : The details for the
            data item.

- *Asynchronous Status* - ``DataItemRemoval``

      + Purpose: Notification of data item removals.

      + Event Data:

         *  ``itemDetails`` (``DataItemDetails``) : The details for the
            data item.

- *Asynchronous Status* - ``DataItemUpdate``

      + Purpose: Notification of data item updates.

      + Event Data:

         *  ``itemDetails`` (``DataItemDetails``) : The details for the
            data item.

- *Asynchronous Status* - ``DataNamespaceCreation``

      + Purpose: Notification of data namespace creations.

      + Event Data:

         *  ``namespaceDetails`` (``DataNamespaceDetails``) : The
            details for the namespace.

- *Asynchronous Status* - ``DataNamespaceRemoval``

      + Purpose: Notification of data item collection removals.

      + Event Data:

         *  ``namespaceDetails`` (``DataNamespaceDetails``) : The
            details for the namespace.
            
- *Command* - ``CreateDataCollection()``

      + Purpose: Create a new data item collection in the given namespace. On
        successful creation, triggers the ``DataCollectionCreation``
        event.

      + Command Data:

         *  ``collectionName`` (``String``) : The name of the data item
            collection.

         *  ``collectionNamespace`` (``String``) : The name of the
            namespace in which to place the collection.

         *  ``collectionProperties`` (``List< KeyVal<String> >``) :
            *[Optional]* A list of key-value ``String`` pairs to use as
            the collection’s properties.

- *Command* - ``RemoveDataCollection()``

      + Purpose: Remove an existing data item collection from the given
        namespace. All data items in the collection will also be
        removed. On successful removal, triggers the
        ``DataCollectionRemoval`` event.

      + Command Data:

         *  ``collectionName`` (``String``) : The name of the data item
            collection.

         *  ``collectionNamespace`` (``String``) : The name of the
            collection’s namespace.

- *Command* - ``CreateDataItemFromBytes()``

      + Purpose: Create a new data item with provided contents. The item is
        placed in the given namespace and optional collection. On
        successful creation, triggers the ``DataItemCreation`` event.
        (NOTE: An implementation may limit the maximum size of a data
        item that can be created from bytes.)

      + Command Data:

         *  ``itemName`` (``String``) : The name of the data item.

         *  ``itemNamespace`` (``String``) : The name of the namespace
            in which to place the data item.

         *  ``contentBytes`` (``Bytes``) : The data item contents.

         *  ``itemCollection`` (``String``) : *[Optional]* The name of the
            collection in which to place the data item.

         *  ``itemProperties`` (``List< KeyVal<String> >``) : *[Optional]*
            A list of key-value ``String`` pairs to use as the data
            item’s properties.

- *Command* - ``CreateDataItemFromLocalFile()``

      + Purpose: Create a new data item associated with an existing local file.
        The item is placed in the given namespace and optional
        collection. On successful creation, triggers the
        ``DataItemCreation`` event.

      + Command Data:

         *  ``itemName`` (``String``) : The name of the data item.

         *  ``itemNamespace`` (``String``) : The name of the namespace
            in which to place the data item.

         *  ``localFilePath`` (``Filepath``) : The absolute path of the
            local file from which to create the data item.

         *  ``itemCollection`` (``String``) : *[Optional]* The name of the
            collection in which to place the data item.

         *  ``itemProperties`` (``List< KeyVal<String> >``) : *[Optional]*
            A list of key-value ``String`` pairs to use as the data
            item’s properties.

- *Command* - ``RemoveDataItem()``

      + Purpose: Remove an existing data item from the given namespace and
        optional collection. Data item removal has no impact on any
        associated local file. On successful removal, triggers the
        ``DataItemRemoval`` event.

      + Command Data:

         *  ``itemName`` (``String``) : The name of the data item.

         *  ``itemNamespace`` (``String``) : The name of the namespace
            from which to remove the data item.

         *  ``itemCollection`` (``String``) : *[Optional]* The name of the
            collection from which to remove the data item.

- *Command* - ``UpdateDataItem()``

      + Purpose: Update the properties or details for an existing data item. For
        items created from byte buffers, only the properties can be
        updated. If the item is associated with a local file, the
        existing item’s details are compared with the local file
        metadata and updated if the file contents have changed since
        the item was created (or last updated). On successful update,
        triggers the ``DataItemUpdate`` event.

      + Command Data:

         *  ``itemName`` (``String``) : The name of the data item.

         *  ``itemNamespace`` (``String``) : The name of the namespace
            in which the data item resides.

         *  ``itemCollection`` (``String``) : *[Optional]* The name of the
            collection in which the data item resides.

         *  ``itemProperties`` (``List< KeyVal<String> >``) : *[Optional]*
            A list of key-value ``String`` pairs to use to update the
            data item’s properties.

- *Command* - ``CreateDataNamespace()``

      + Purpose: Create a new data namespace. On successful creation, triggers
        the ``DataNamespaceCreation`` event.

      + Command Data:

         *  ``namespaceName`` (``String``) : The name of the data
            namespace.

- *Command* - ``RemoveDataNamespace()``

      + Purpose: Remove an existing data namespace. All data items and
        collections in the namespace will also be removed. On
        successful removal, triggers the ``DataNamespaceRemoval``
        event.

      + Command Data:

         *  ``namespaceName`` (``String``) : The name of the data
            namespace.

- *Request-Reply* - ``GetDataCollectionDetails()``

      + Purpose: Get the detailed information for the named data item collection.

      + Request Data:

         *  ``collectionName`` (``String``) : The name of the
            collection.

         *  ``collectionNamespace`` (``String``) : The name of the
            namespace in which the collection resides.

      + Reply Data:

         *  ``collectionDetails`` (``DataCollectionDetails``) : The
            details for the collection.

- *Request-Reply* - ``GetDataItemAsBytes()``

      + Purpose: Get the contents of the named data item as bytes. (NOTE: An
        implementation may limit the maximum size of a data item that
        can be fetched as bytes.)

      + Request Data:

         *  ``itemName`` (``String``) : The name of the data item.

         *  ``itemNamespace`` (``String``) : The name of the namespace
            in which the data item resides.

         *  ``itemCollection`` (``String``) : *[Optional]* The name of the
            collection in which the data item resides.

      + Reply Data:

         *  ``contentBytes`` (``Bytes``) : The data item contents.

- *Request-Reply* - ``GetDataItemAsLocalFile()``

      + Purpose: Get the absolute path of a local file that can be used to
        retrieve the data item contents.

      + Request Data:

         *  ``itemName`` (``String``) : The name of the data item.

         *  ``itemNamespace`` (``String``) : The name of the namespace
            in which the data item resides.

         *  ``itemCollection`` (``String``) : *[Optional]* The name of the
            collection in which the data item resides.

      + Reply Data:

         *  ``localFilePath`` (``Filepath``) : The absolute path to a
            local file.

         *  ``isTempFile`` (``Boolean``) : Flag indicating whether the
            returned path is for a temporary file that should be deleted
            by the client when it is done using the file.

- *Request-Reply* - ``GetDataItemDetails()``

      + Purpose: Get the detailed information for the named data item.

      + Request Data:

         *  ``itemName`` (``String``) : The name of the data item.

         *  ``itemNamespace`` (``String``) : The name of the namespace
            in which the data item resides.

         *  ``itemCollection`` (``String``) : *[Optional]* The name of the
            collection in which the data item resides.

      + Reply Data:

         *  ``itemDetails`` (``DataItemDetails``) : The details for the
            data item.

- *Request-Reply* - ``GetDataNamespaceDetails()``

      + Purpose: Get the detailed information for the given namespace.

      + Request Data:

         *  ``namespaceName`` (``String``) : The name of the namespace.

      + Reply Data:

         *  ``namespaceDetails`` (``DataNamespaceDetails``) : The
            details for the namespace.

- *Request-Reply* - ``ListDataCollections()``

      + Purpose: Get a list of the data item collections that reside in the
        given namespace.

      + Request Data:

         *  ``namespaceName`` (``String``) : The name of the namespace
            to query for collections.

      + Reply Data:

         *  ``collectionNames`` (``List<String>``) : The list of
            collection names.

- *Request-Reply* - ``ListDataItems()``

      + Purpose: Get a list of the data items that reside in the given namespace
        and optional collection.

      + Request Data:

         *  ``itemNamespace`` (``String``) : The name of the namespace
            to query for data items.

         *  ``itemCollection`` (``String``) : *[Optional]* The name of the
            collection to query for data items.

      + Reply Data:

         *  ``itemNames`` (``List<String>``) : The list of data item
            names.

- *Request-Reply* - ``ListDataNamespaces()``

      + Purpose: Get a list of the available namespaces.

      + Reply Data:

         *  ``namespaceNames`` (``List<String>``) : The list of
            namespaces.
