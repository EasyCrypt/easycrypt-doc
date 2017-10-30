#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import sys, os

sys.path.insert(0, os.path.realpath(os.path.dirname(__file__)))

# -- General configuration ------------------------------------------------

needs_sphinx   = '1.6'
extensions     = ['sphinx.ext.todo', 'sphinx.ext.mathjax']
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


# -- Options for HTML output ----------------------------------------------

html_theme       = 'sphinx_rtd_theme'
html_static_path = ['_static']

# -- Options for LaTeX output ---------------------------------------------

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
