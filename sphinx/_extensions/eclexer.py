# --------------------------------------------------------------------
import pygments.lexer as lexer
import pygments.token as tk

# --------------------------------------------------------------------
__all__ = ['EasyCryptLexer', 'setup']

# --------------------------------------------------------------------
class EasyCryptLexer(lexer.RegexLexer):
    name      = 'EasyCrypt'
    aliases   = ['easycrypt']
    filenames = ['*.ec', '*.eca']
    mimetypes = ['text/x-easycrypt']
    keywords  = dict(
        bytac = ['exact', 'assumption', 'smt', 'by',
            'reflexivity', 'done'
        ],
        dangerous = ['admit', 'admitted'],
        global_ = ['axiom', 'axiomatized', 'lemma', 'realize',
            'proof', 'qed', 'abort', 'goal', 'end',
            'import', 'export', 'include', 'local', 'declare',
            'hint', 'nosmt', 'module', 'of', 'const',
            'op', 'pred', 'inductive', 'notation', 'abbrev',
            'require', 'theory', 'abstract', 'section',
            'type', 'class', 'instance', 'print', 'search', 'as',
            'Pr', 'clone', 'with', 'rename',
            'prover', 'timeout', 'why3', 'dump', 'remove', 'Top',
            'Self'
        ],
        internal = ['time', 'undo', 'debug', 'pragma'],
        prog = ['forall', 'exists', 'fun', 'glob', 'let', 'in',
            'var', 'proc', 'if', 'then', 'else',
            'elif', 'while', 'assert', 'return', 'res', 'equiv',
            'hoare', 'phoare', 'islossless', 'async'
        ],
        tactic = ['beta', 'iota', 'zeta', 'eta', 'logic', 'delta',
            'simplify', 'congr', 'change', 'split',
            'left', 'right', 'case', 'pose', 'cut', 'have',
            'suff', 'elim', 'clear', 'apply', 'rewrite',
            'rwnormal', 'subst', 'progress', 'trivial', 'auto',
            'idtac', 'move', 'modpath', 'field',
            'fieldeq', 'ring', 'ringeq', 'algebra', 'replace',
            'transitivity', 'symmetry', 'seq', 'wp',
            'sp', 'sim', 'skip', 'call', 'rcondt', 'rcondf',
            'swap', 'cfold', 'rnd', 'pr_bounded', 'bypr',
            'byphoare', 'byequiv', 'fel', 'conseq', 'exfalso',
            'inline', 'alias', 'fission', 'fusion',
            'unroll', 'splitwhile', 'kill', 'eager'
        ],
        tactical = ['try', 'first', 'last', 'do', 'strict',
            'expect'
        ],
    )

    tokens = {
        'root': [
            (r'\s+', tk.Text),
            (r'false|true', tk.Name.Builtin.Pseudo),
            (r'\(\*', tk.Comment, 'comment'),
            (r'\b(%s)\b' % '|'.join(keywords['bytac']), tk.Keyword.ByTac),
            (r'\b(%s)\b' % '|'.join(keywords['dangerous']), tk.Keyword.Dangerous),
            (r'\b(%s)\b' % '|'.join(keywords['global_']), tk.Keyword.Global),
            (r'\b(%s)\b' % '|'.join(keywords['internal']), tk.Keyword.Internal),
            (r'\b(%s)\b' % '|'.join(keywords['prog']), tk.Keyword.Prog),
            (r'\b(%s)\b' % '|'.join(keywords['tactic']), tk.Keyword.Tactic),
            (r'\b(%s)\b' % '|'.join(keywords['tactical']), tk.Keyword.Tactical),
            (r"[^\d][\w']*", tk.Name),
            (r'\d[\d]*', tk.Number.Integer),
        ],
        'comment': [
            (r'[^(*)]+', tk.Comment),
            (r'\(\*', tk.Comment, '#push'),
            (r'\*\)', tk.Comment, '#pop'),
            (r'[(*)]', tk.Comment),
        ],
    }

# --------------------------------------------------------------------
def setup(app):
    from sphinx.highlighting import lexers
    lexers['easycrypt'] = EasyCryptLexer()
