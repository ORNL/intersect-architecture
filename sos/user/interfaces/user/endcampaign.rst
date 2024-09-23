
.. _`intersect:arch:sos:user:interfaces:user:endcampaign`:

End Campaign
~~~~~~~~~~~~

.. _`intersect:arch:sos:user:interfaces:user:endcampaign:preconditions`:

Preconditions
^^^^^^^^^^^^^

The user is logged into INTERSECT and is currently running a campaign.

.. _`intersect:arch:sos:user:interfaces:user:endcampaign:postconditions`:

Postconditions
^^^^^^^^^^^^^^

The campaign has come to an end and the user can see it listed under “Recent Campaigns”. They can click on the links to see the details of the campaign ending.

.. _`intersect:arch:sos:user:interfaces:user:endcampaign:methodologies`:

Methodologies
^^^^^^^^^^^^^

* Option 1 – Natural conclusion

  - Campaign ends by itself based on the termination condition

* Option 2 – User aborts Campaign

  - User clicks on “Stop” or similar button on dashboard to end Campaign prematurely

* Option 3 – Error in Campaign

  - One or more components decide to end the Campaign earlier due to an error that the Campaign cannot recover from.

* Dashboard elements that allow steering or restarting of certain components of the workflow are disabled.

* Dashboard may continue to be accessible for the user to scrub through the timeline and replay the Campaign using telemetry / saved components of the data stream.

* User receives an email notification about the end of the Campaign with a link to view details regarding the completed Campaign.

* This Campaign is moved from “Ongoing” to “Past” Campaigns

An example interface is depicted in :numref:`figures:user:user:endcampaign:campend`



   .. figure:: ./fig-userview-campend.png
      :name: figures:user:user:endcampaign:campend
      :width: 600
      :align: center

      A dashboard of recent campaigns is shown at the end of the campaign.
