# --------------------------------------------------------------------
import ecpygments

# --------------------------------------------------------------------
__all__ = ['setup']

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
