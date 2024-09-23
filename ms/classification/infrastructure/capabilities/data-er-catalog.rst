.. _`intersect:arch:ms:capability:infrastructure:data_info:er_catalog`:

Capability - Data and Information Management :: Entity-Relationship Catalog
---------------------------------------------------------------------------

:Description:
   Provides a generic entity-relationship information catalog 
   that maintains names, descriptions, properties, and labels for 
   uniquely-identified entities and tracks named relationships between entities.

:Version:
   0.1 - Initial capability definition.

:Related Capabilities:
   - Extends: None
   - Requires: None

:Data Definitions:
   ``CatalogEntityInformation``, ``CatalogEntityRelationship``

:Interactions:
   - Asynchronous: ``CatalogEntityCreation``, ``CatalogEntityRemoval``,
     ``CatalogRelationCreation``, ``CatalogRelationRemoval``
   - Command: ``CreateEntity()``, ``RemoveEntity()``, ``CreateRelation()``,
     ``RemoveRelation()``
   - Request-Reply: ``GetEntityInformation()``, ``GetEntityRelationships()``,
     ``GetEntitySourceRelationships()``, ``GetEntityTargetRelationships()``,
     ``GetSourceEntitiesByRelation()``, ``GetTargetEntitiesByRelation()``,
     ``GetEntitiesByType()``, ``GetEntitiesByLabel()``,
     ``GetEntitiesByProperty()``

- *Data Definition* - ``CatalogEntityInformation``

      *  ``entityName`` (``String``) : The name of the entity.

      *  ``entityType`` (``String``) : The type name of the entity.

      *  ``entityDescription`` (``String``) : The description of the
         entity.

      *  ``entityProperties`` (``List< KeyVal<String> >``) : *[Optional]* A
         list of key-value ``String`` pairs for the entity’s properties.

      *  ``entityLabels`` (``List<String>``) : *[Optional]* A list of
         ``String`` labels for the entity.

- *Data Definition* - ``CatalogEntityRelationship``

      *  ``relationName`` (``String``) : The name of the relation.

      *  ``sourceId`` (``UUID``) : The unique id for the source entity.

      *  ``targetId`` (``UUID``) : The unique id for the target entity.

- *Asynchronous Status* - ``CatalogEntityCreation``

      + Purpose: Notification of catalog entity creations.

      + Event Data:

         *  ``entityId`` (``UUID``) : The unique id of the created entity.

         *  ``entityName`` (``String``) : The name of the created entity.

         *  ``entityType`` (``String``) : The type name of the created entity.

- *Asynchronous Status* - ``CatalogEntityRemoval``

      + Purpose: Notification of catalog entity removals.

      + Event Data:

         *  ``entityId`` (``UUID``) : The unique id of the removed entity.

         *  ``entityName`` (``String``) : The name of the removed entity.

         *  ``entityType`` (``String``) : The type name of the removed entity.

- *Asynchronous Status* - ``CatalogRelationCreation``

      + Purpose: Notification of catalog relationship creations.

      + Event Data:

         *  ``relation`` (``CatalogEntityRelationship``) : The relation
            that was created.

- *Asynchronous Status* - ``CatalogRelationRemoval``

      + Purpose: Notification of catalog relationship removals.

      + Event Data:

         *  ``relationName`` (``String``) : The name of the removed relation.

         *  ``sourceId`` (``UUID``) : The unique id of the relation’s
            source entity, or the ``ALL_UUID`` value to represent all
            sources.

         *  ``targetId`` (``UUID``) : The unique id of the relation’s
            target entity, or the ``ALL_UUID`` value to represent all
            targets.
            
- *Command* - ``CreateEntity()``

      + Purpose: Create a new entity with the given id and information (i.e.,
        name, type, description, properties, and labels). On successful
        creation, triggers the ``CatalogEntityCreation`` event.

      + Command Data:

         *  ``entityId`` (``UUID``) : The unique id for the entity.

         *  ``entityInfo`` (``CatalogEntityInformation``) : The entity
            information.

- *Command* - ``RemoveEntity()``

      + Purpose: Remove the entity with given ``entityId``. Also removes any
        relationships associated with the removed entity. On successful
        removal, triggers the ``CatalogEntityRemoval`` event.

      + Command Data:

         *  ``entityId`` (``UUID``) : The unique id of the entity to
            remove.

- *Command* - ``CreateRelation()``

      + Purpose: Create a new named relation between the given source and target
        entities. On successful creation, triggers the
        ``CatalogRelationCreation`` event.

      + Command Data:

         *  ``relation`` (``CatalogEntityRelationship``) : The relation
            to add, which identifes the relation name and the source and
            target entity ids.

- *Command* - ``RemoveRelation()``

      + Purpose: Remove the relationship(s) having the given name. If both the
        ``sourceId`` and ``targetId`` are provided, removes only the
        relationship between those entities. If only the ``sourceId``
        is provided, removes all relationships with the given name that
        are sourced at that entity. If only the ``targetId`` is
        provided, removes all relationships with the given name that
        are targeted at that entity. Also removes any relationships
        associated with the removed entity. On successful removal,
        triggers the ``CatalogRelationRemoval`` event.

      + Command Data:

         *  ``relationName`` (``String``) : The name of the relation to
            remove.

         *  ``sourceId`` (``UUID``) : The unique id of the relation’s
            source entity, or the ``ALL_UUID`` value to represent all
            sources.

         *  ``targetId`` (``UUID``) : The unique id of the relation’s
            target entity, or the ``ALL_UUID`` value to represent all
            targets.

- *Request-Reply* - ``GetEntityInformation()``

      + Purpose: Get the information of the entity with given ``entityId``.

      + Request Data:

         *  ``entityId`` (``UUID``) : The unique id for the entity.

      + Reply Data:

         *  ``entityInfo`` (``CatalogEntityInformation``) : The entity
            information.

- *Request-Reply* - ``GetEntityRelationships()``

      + Purpose: Get the source and target relationships of the entity with
        given ``entityId``. Optionally, return only the relations with
        the given ``relationName``.

      + Request Data:

         *  ``entityId`` (``UUID``) : The unique id for the entity.

         *  ``relationName`` (``String``) : *[Optional]* The name of a
            specific relation for which to return results.

      + Reply Data:

         *  ``relationshipList`` (``List<CatalogEntityRelationship>``) :
            The list of entity relationships.

- *Request-Reply* - ``GetEntitySourceRelationships()``

      + Purpose: Get the relationships that are sourced from the entity with
        given ``entityId``. Optionally, return only the relations with
        the given ``relationName``.

      + Request Data:

         *  ``entityId`` (``UUID``) : The unique id for the entity.

         *  ``relationName`` (``String``) : *[Optional]* The name of a
            specific relation for which to return results.

      + Reply Data:

         *  ``relationshipList`` (``List<CatalogEntityRelationship>``) :
            The list of entity source relationships.

- *Request-Reply* - ``GetEntityTargetRelationships()``

      + Purpose: Get the relationships that target the entity with given
        ``entityId``. Optionally, return only the relations with the
        given ``relationName``.

      + Request Data:

         *  ``entityId`` (``UUID``) : The unique id for the entity.

         *  ``relationName`` (``String``) : *[Optional]* The name of a
            specific relation for which to return results.

      + Reply Data:

         *  ``relationshipList`` (``List<CatalogEntityRelationship>``) :
            The list of entity target relationships.

- *Request-Reply* - ``GetSourceEntitiesByRelation()``

      + Purpose: Get the entities that are sources for relationships with the
        given ``relationName``.

      + Request Data:

         *  ``relationName`` (``String``) : The name of a specific
            relation for which to return results.

      + Reply Data:

         *  ``sourceIds`` (``List<UUID>``) : The list of source
            entities.

- *Request-Reply* - ``GetTargetEntitiesByRelation()``

      + Purpose: Get the entities that are targets for relationships with the
        given ``relationName``.

      + Request Data:

         *  ``relationName`` (``String``) : The name of a specific
            relation for which to return results.

      + Reply Data:

         *  ``targetIds`` (``List<UUID>``) : The list of target
            entities.

- *Request-Reply* - ``GetEntitiesByType()``

      + Purpose: Get the entities with the given ``entityType``.

      + Request Data:

         *  ``entityType`` (``String``) : The type name of the requested
            entities.

      + Reply Data:

         *  ``entityIds`` (``List<UUID>``) : The list of entities of the
            requested type.

- *Request-Reply* - ``GetEntitiesByLabel()``

      + Purpose: Get the entities whose labels include the given ``labelName``.

      + Request Data:

         *  ``labelName`` (``String``) : The name of the label.

      + Reply Data:

         *  ``entityIds`` (``List<UUID>``) : The list of entities with
            the requested label.

- *Request-Reply* - ``GetEntitiesByProperty()``

      + Purpose: Get the entities whose properties include the given
        ``propertyName``. Optionally, only return entities whose
        property value matches the ``valueExpression``.

      + Request Data:

         *  ``propertyName`` (``String``) : The name of the property.

         *  ``valueExpression`` (``String``) : *[Optional]* An expression
            to evaluate against the property value.

      + Reply Data:

         *  ``entityIds`` (``List<UUID>``) : The list of entities with
            the requested property.
