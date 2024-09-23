.. _intersect:arch:sos:user:interfaces:admin:

Administrator
-------------

Monitors all Resources
~~~~~~~~~~~~~~~~~~~~~~

- Administrator monitors all Resources in addition to viewing requests to add
  Resources to INTERSECT:

  - Resource is assigned an ID when Owner composes form to create new Resource

  - Table with the following columns:

    - Resource ID - link that takes the Administrator to the Detailed
      View about the Resource

    - Resource Name - e.g. “SNS DGX 2” / Title (Abbreviated)

    - Resource Classification -
      Physical.Microscope.ScanningTransmissionElectronMicroscope or
      Logical.Visualization.2DImage

    - Owner

    - Organization

    - Location

    - Date added / Requested (to be added to INTERSECT)

    - Status: Active, Down, In use, Requested.

    - Compliance: Good, Moderate (e.g. - performance in one or more
      metrics may have dropped below ideal / promised levels but
      still functional), Failing (failing in at least one of the
      non-negotiable metrics described in the SLA)

  - The Listing View should allow the Administrator to easily filter
    by most columns like the Resource Classification, Owner, Location,
    Date, Status etc.

    - The Resource Classification is meant to provide increasing
      levels of granularity within the same topic without adding more
      columns to the table.

  - The Listing View should allow the Administrator to easily sort by
    any of the columns in the table

  - This View should also allow the Administrator to do basic visual
    analytics on the contents of the (filtered) table to answer
    questions such as:

    - Number of Resources added every month or year

    - Pie chart or similar distribution illustrating number of
      Resources by Organizations that own them

    - Distribution of Resources by Resource Classification (maybe
      just by the first level that varies within the current
      listing).

    - Distribution of the Compliance or Status of Resources by
      Organization / Owner or Classification.

- Administrator adds Resource to INTERSECT ecosystem:

  - Upon clicking on a link, the Administrator is taken to the
    Detailed View for the Resource.

  - The Detailed View of the Resource shows all relevant details
    regarding the Resource, including:

    - Background and other top-level details

    - Configuration information (not visible to Users, only visible
      to Operator / Maintainer(s), Owner, and Administrators)

    - a GitHub style view of communication between the Owner,
      Operator(s) / Maintainer(s) and Administrator(s). The
      Administrator can use this tool to communicate edits to the
      configuration, ask questions, make comments, etc.

      - These conversations are not visible to end Users of the
        Resource

      - Upon acceptance of this request, the first public log is
        automatically created that illustrates when the Resource was
        officially added to INTERSECT.

    - CI/CD like checklist that illustrates which of INTERSECT’s
      requirements have been complied

    - Buttons:

      - to run the compliance checklist

      - Reject request

      - Approve request

- Administrator monitors all Users in INTERSECT in addition to managing
  permissions / roles using the User Management Panel:

  - Table with following fields:

    - Username (links to User profile).

    - Full name (Also links to same User profile)

    - Organization (applies filter on this specific Organization)

    - Role - User / Operator / Maintainer / Administrator

    - Requested role (populate only when different from existing role
      and only when User has requested a role change).

    - Role start date (could serve as the time stamp for the last
      time this person’s role had changed)

    - Role end date

    - Button - “change role”

    - Date Added - useful for tracking growth rate

    - Last active - last date that this User used INTERSECT

    - Active days - number of days this User used INTERSECT. This
      might be useful to track user retention and desire to continue
      to use INTERSECT

  - The Listing View should allow the Administrator to easily filter
    by current role, requested roles (selects only those users who
    have requested role changes), organization, etc.

  - The Listing View should allow the Administrator to easily sort by
    any of the columns in the table

  - This View should also allow simple visual analytics such as:

    - Number of new Users added to INTERSECT per month

    - Number of active Users per month

    - Distribution of Users by Organization

    - Distribution of Users by Role

- Administrator monitors state of backbone INTERSECT microservices and
  central infrastructure
