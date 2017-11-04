# --------------------------------------------------------------------
import re, ecpygments

import docutils as du
import docutils.parsers.rst as rst

# --------------------------------------------------------------------
__all__ = ['setup']

# --------------------------------------------------------------------
_pdollar = re.compile(r'(?:^|(?<=\s|[(]))[~]([^\n]*?)(?<![\\])[~](?:~|(?=\s|[.,;)\\]))')
_ndollar = re.compile(r'\\[~]')

# --------------------------------------------------------------------
def _source_read_handler(app, docname, source):
    source[0] = _pdollar.sub(r':easycrypt:`\1`', source[0])
    source[0] = _ndollar.sub('~', source[0])

# --------------------------------------------------------------------
def easycrypt_role(role, rawtext, text, lineno, inliner, options={}, content=[]):
    options = options.copy(); options['language'] = 'easycrypt'
    return rst.roles.code_role(
        'code', rawtext, text, lineno, inliner, options, content)

easycrypt_role.options = { 'class': rst.directives.class_option }

# --------------------------------------------------------------------
# FIXME: make a link
def tactic_role(*args, **kw):
    return easycrypt_role(*args, **kw)

tactic_role.options = { 'class': rst.directives.class_option }

# --------------------------------------------------------------------
def _visit_tactic_html(self, node):
    self.body.append(self.starttag(node, 'div', '', CLASS='tactic-doc'))
    self.body.append(self.starttag(node, 'div', '', CLASS='syntax-doc'))
    node.syntax.walkabout(self)
    self.body.append('</div>')
    self.body.append(self.starttag(node, 'div', '', CLASS='tactic-dsc'))

def _depart_tactic_html(self, node):
    self.body.append('</div>')
    self.body.append('</div>')

# --------------------------------------------------------------------
class tactic(du.nodes.General, du.nodes.Element):
    def __init__(self, tactic, syntax = None):
        super().__init__()
        self.tactic = tactic
        self.syntax = syntax

    VISITORS = dict(
        html = (_visit_tactic_html, _depart_tactic_html),
    )

# --------------------------------------------------------------------
class TacticDirective(rst.Directive):
    has_content = True
    required_arguments = 0
    optional_arguments = 1
    final_argument_whitespace = True
    option_spec = {
        'display': rst.directives.unchanged,
        'index': rst.directives.unchanged,
        'name': rst.directives.unchanged,
    }

    def run(self):
        env  = self.state.document.settings.env
        syn  = self.options.get('syntax', None) or self.arguments[0]
        syn  = easycrypt_role(
            'easycrypt', syn, syn, self.lineno, self.state.inliner)

        if syn[1]:
            raise self.error('cannot highlight tactic syntax')

        node = tactic(self.arguments[0], syntax = syn[0][0])
        self.state.nested_parse(self.content, self.content_offset, node)

        return [node]

# --------------------------------------------------------------------
def setup(app):
    from pygments.lexers import LEXERS
    from sphinx.highlighting import lexers

    lexer = ecpygments.EasyCryptLexer()

    lexers['easycrypt'] = lexer
    LEXERS[lexer.__class__.__name__] = \
        (ecpygments.__name__, lexer.name,
         tuple(lexer.aliases),
         tuple(lexer.filenames),
         tuple(lexer.mimetypes))

    app.connect('source-read', _source_read_handler)

    app.add_role('easycrypt', easycrypt_role)
    app.add_role('tactic', tactic_role)
    app.add_node(tactic, **tactic.VISITORS)
    app.add_directive('tactic', TacticDirective)

    return dict(version = '1.0')
