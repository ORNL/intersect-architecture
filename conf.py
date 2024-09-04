# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html


# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'INTERSECT Architecture'
author = 'INTERSECT Architecture Team'
html_show_copyright = False
html_show_sphinx = False
html_last_updated_fmt = '%b %d, %Y'

###
# TJN: For now just hardcoding the branch name as version,
#      and a static number as the release value.  This could
#      be more elaborate, but do not want to depend on git directly
#      b/c CI runs in source-only directory, etc.
#      This seemed easier than putting the info in a seperate file
#      and having to read/parse it here. Good enough for now!
###
version = 'main'   # 'main' (production) or 'next' (devel)
release = 'v0.0'   # 'v0.9', 'v1.0', etc.


# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
import sphinx_rtd_theme
extensions = ['recommonmark', "sphinx_rtd_theme", 'sphinxcontrib.bibtex',
              'sphinx.ext.todo','sphinxcontrib.plantuml','sphinxcontrib.mermaid', 'sphinxcontrib.youtube']
bibtex_bibfiles = ['bibliography.bib']
bibtex_default_style = 'unsrt'
bibtex_reference_style = 'label'

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 've3', 'venv', '.venv',
                    'README', 'Makefile', 'Dockerfile']

# Allow number-based figure references
# https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-numfig
numfig = True

# Enable the todo directive
# https://www.sphinx-doc.org/en/master/usage/extensions/todo.html
todo_include_todos = True

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output


# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#html_theme = 'alabaster'
html_theme = 'sphinx_rtd_theme'

html_static_path = ['_static']

html_css_files = [
    'custom.css',
]

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
#html_static_path = ['_static']

html_additional_pages = { }

# TJN: For now disable the "View page source" link (default is True)
html_show_sourcelink = False

# This prolog is included in every file.  Put common stuff here.
#.. |year| replace:: {year}

rst_prolog = f"""
.. |mdash|  unicode:: U+02014 .. Em dash
.. |rarrow| unicode:: U+02192 .. Right arrow


"""
