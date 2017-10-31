#! /usr/bin/env python3
# -*- coding: utf-8 -*-

# --------------------------------------------------------------------
import sys, os

ROOT = os.path.realpath(os.path.dirname(__file__))

sys.path.insert(0, os.path.join(ROOT, '_extensions'))

# --------------------------------------------------------------------
import eclexer

# -- General configuration -------------------------------------------

needs_sphinx   = '1.6'
extensions     = ['sphinx.ext.todo', 'sphinx.ext.mathjax', 'inlinemath', 'eclexer']
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


# -- Options for HTML output -----------------------------------------

html_theme       = '_theme'
html_static_path = ['_static']
html_theme_path  = [ROOT]

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
