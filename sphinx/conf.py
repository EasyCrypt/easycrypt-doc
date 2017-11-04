#! /usr/bin/env python3
# -*- coding: utf-8 -*-

# --------------------------------------------------------------------
import sys, os

ROOT = os.path.realpath(os.path.dirname(__file__))

sys.path.insert(0, os.path.join(ROOT, '_extensions'))

# -- General configuration -------------------------------------------

needs_sphinx   = '1.6'
extensions     = [
    'sphinx.ext.todo',
    'sphinx.ext.mathjax',
    'sphinxcontrib.bibtex',
    'inlinemath',
    'easycrypt',
]
templates_path = ['_templates']
source_suffix  = '.rst'
master_doc     = 'index'

project   = 'EasyCrypt Reference Manual'
copyright = '2012--2017, The EasyCrypt Team'
author    = 'The EasyCrypt Team'
version   = '1.0'
release   = '1.0'
language  = 'en'

exclude_patterns   = ['_build', 'Thumbs.db', '.DS_Store', '.git']
pygments_style     = 'sphinx'
todo_include_todos = True
numfig             = True

# --------------------------------------------------------------------
def setup(app):
    app.add_stylesheet('styles.css')
    app.add_stylesheet('xbootstrap.css')
    app.add_javascript('collapse.js')

# -- Options for HTML output -----------------------------------------

import sphinx_bootstrap_theme

html_theme       = 'bootstrap'
html_static_path = ['_static']
html_theme_path  = sphinx_bootstrap_theme.get_html_theme_path()

html_theme_options = dict(
    navbar_title            = "EasyCrypt RefMan",
    navbar_site_name        = "Site",
    navbar_sidebarrel       = False,
    navbar_pagenav          = True,
    navbar_pagenav_name     = "Page",
    globaltoc_depth         = 3,
    globaltoc_includehidden = True,
    navbar_class            = "navbar navbar-default navbar-expand-sm",
    navbar_fixed_top        = True,
    source_link_position    = "footer",
    # Bootswatch (http://bootswatch.com/) theme.
    bootswatch_theme        = "cosmo",
    bootstrap_version       = "3",
    navbar_links            = [
        ("Main Site", "https://www.easycrypt.info/", True)
    ]
)

# -- Options for LaTeX output ----------------------------------------

latex_elements = dict(
     papersize    = 'a4paper'
    ,pointsize    = '10pt'
    ,preamble     = ''
    ,figure_align = 'htbp'
)

latex_documents = [
    (master_doc,
       'refman.tex',
       'EasyCrypt Reference Manual',
       'The EasyCrypt Team',
       'manual'),
]
