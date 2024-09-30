.. _intersect:arch:misc:author-guide:

Document Authors Guide
======================

.. _authors-guide:

The following outlines the set of suggested format to be used when making
additions to the document.  The use of consistent macros and labels helps
improve the overall readability of the document and assists in longer term
maintenance.


Chapters and Sections
---------------------

The format is to a single line of text, underlined by non-ASCII characters.
Numbering is disabled. Use concise text.

  * The length of the underline *must* be at least as long as the
    line of text

  * The order of the non-ASCII characters denotes chapters / sections /
    subsections / etc.

    In the INTERSECT docs, the sequence of underline characters we use are:

    .. code-block:: rst

       Chapter
       =======

    .. code-block:: rst

       Section
       -------

    .. code-block:: rst

       Subsection
       ^^^^^^^^^^

    .. code-block:: rst

       Subsubsection
       +++++++++++++

    Meaning: underlines made of ``=`` denotes chapters, underlines
    made of ``-`` denotes sections, underlines made of ``^`` denotes
    subsections, and underlines made of ``+`` denote subsubsections.

References to Chapters and Sections
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Cross-reference Chapters and Sections in the local document by name, as they
are unnumbered.

  General format:

  .. code-block:: rst

     .. _label:

  .. code-block:: rst

     :ref:`label`

  For example:

  .. code-block:: rst

    .. _intersect:arch:misc:author-guide:

    Document Authors Guide
    ======================

  .. code-block:: rst

    The Author guide is in :ref:`intersect:arch:misc:author-guide`.

  Rendered example:

    The Author guide is in :ref:`intersect:arch:misc:author-guide`.


Call-out Boxes
--------------

All call-outs follow the same general syntax.

  General format:

  .. code-block:: rst

     .. callout:: Text to include in colored box.

  For example:

  .. code-block:: rst

     .. important:: This is important example text.


The following are the preferred call-outs to use in the document.

* ``important`` - Important details of interest to the reader that might be
  worth additional attention, especially for pointing out possible pitfalls.

  .. important:: This is important example text.


* ``note`` - Miscellaneous note to add in the document.

  .. note:: This is note example text.

* ``todo`` - Marker for a item to do in the document.  (See: `Support for todo items <https://www.sphinx-doc.org/en/master/usage/extensions/todo.html>`_)

  .. todo:: This is todo example text.

* ``warning`` - Warning for something in the document.

  .. warning:: This is warning example text.

* ``seealso`` - References to other documentation or external documents.

  .. seealso::

     Microservice intro `intersect:arch:ms`
        Introductory information on INTERSECT Microservices.

     `My External Documentation, Using Foobar <https://link>`_
        Documentation for foobar, part of the external project Foozilla.


Naming Scheme
-------------

A hierarchical naming scheme is used for labels to help reflect the location
of content.

  General format:

  .. code-block:: rst

     .. _intersect:arch:<A>:<X>:<Y>:<Z>:

  For example, this Authors Guide lives under the ``/misc`` directory and
  has a top-level label that provides a logical namesapce for the document.

  .. code-block:: rst

     .. _intersect:arch:misc:author-guide:


  All labels (sub-sections, figures, tables, etc.) in this file will have
  the same namespace and will have this same prefix.  For example, the dummy
  example figure has the label

  .. code-block:: rst

          fig:intersect:arch:misc:author-guide:dummy


  .. note:: We recommend using a short prefix for Figures sand Tables to aid recognition
            of the kind of label, e.g., ``fig:`` for figures, ``tab:`` for tables.


Figures
-------

Format figures with a fixed pixel width between 400px and 800px, as rendering
them relatively to the window size may show them with abnormal sizes and
resolutions. Make sure that images have reasonable enough resolutions, e.g.,
100 dpi or larger. Figures should be centered.

  General format:

  .. code-block:: rst

     :ref:`label`                # Link text is (full) caption
     :ref:`Short string <label>` # Link text is "Short string"

      .. figure:: path/to/figure.png
         :name:  label
         :align: center
         :width: 400px

         Full caption

  .. note:: Numbered cross-references would use ``:numref:`label```, but
            are generally avoided in Arch-docs.

References to Figures
^^^^^^^^^^^^^^^^^^^^^

Cross-reference to Figures in the local document by number.

  Example:

    .. code-block:: rst

       In :ref:`Dummy <fig:intersect:arch:misc:author-guide:dummy>` we have a dummy figure.

       In :ref:`fig:intersect:arch:misc:author-guide:dummy` we have a dummy figure.

       .. figure:: images/dummyfig.png
          :name:  fig:intersect:arch:misc:author-guide:dummy
          :align: center
          :width: 400px

          A caption for my figure that is sort of long.

  Rendered example:

    In :ref:`Dummy <fig:intersect:arch:misc:author-guide:dummy>` we have a dummy figure.

    In :ref:`fig:intersect:arch:misc:author-guide:dummy` we have a dummy figure.

    .. figure:: images/dummyfig.png
       :name:  fig:intersect:arch:misc:author-guide:dummy
       :align: center
       :width: 400px

       A caption for my figure that is sort of long.

Easy conversion of PDF images to PNG with ImageMagic
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Use the density option to define the DPI the PDF should be rendered for the conversion.

     .. code-block:: sh

        shell$ convert -density 125 image.pdf image.png

Reference to Bibliography
-------------------------

Insert a citation to an item contained in the bibliography.

  General format:

  .. code-block:: rst

     :cite:`<TERM>`

  For example:

  .. code-block:: rst

     The DoDAF architecture use a systems-of-systems approach :cite:`DoDAF2:2010`.

  Rendered example:

     The DoDAF architecture use a systems-of-systems approach :cite:`DoDAF2:2010`.

Reference to Glossary Terms
---------------------------

Cross-reference to glossary terms.

  General format:

  .. code-block:: rst

     :term:`<TERM>`

  For example:

  .. code-block:: rst

     This is a reference to term :term:`INTERSECT` inline with text.

  Rendered example:

     This is a reference to term :term:`INTERSECT` inline with text.


Hyperlinks to other (RST) files
-------------------------------

Create a hyperlink to document in local files using ``:doc:``.

  General format:

  .. code-block:: rst

     :doc:`link text <PAGE_PATH>`

  For example:

  .. code-block:: rst

     You should read the :doc:`Author Guide </misc/authors>`.

  Rendered example:

     You should read the :doc:`Author Guide </misc/authors>`.

  .. note:: The page path is relative to ``arch-online`` dir in the git tree.


Hyperlinks to URL
-----------------

Create a hyperlink a URL.

  General format:

  .. code-block:: rst

     `link text <link>`_

  For example:

  .. code-block:: rst

     `Oak Ridge National Laboratory <https://www.ornl.gov/>`_

  Rendered example:

     `Oak Ridge National Laboratory <https://www.ornl.gov/>`_

  .. note:: The the trailing underscore (``_``) is important.

Custom ORNL Footer
------------------

A custom footer is added to all pages. This is taken from the
file ``_templates/footer.html``, specifically the part marked
with the comment ``Custom ORNL Footer``.

