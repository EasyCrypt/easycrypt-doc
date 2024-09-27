# -*- Makefile -*-

# --------------------------------------------------------------------
.PHONY: all clean __force__

EXTRAMK ?=
LATEXMK := latexmk -bibtex -auxdir=_build -silent
LATEXMK += -latex="latex --shell-escape %O %S"
LATEXMK += -pdflatex="pdflatex --shell-escape %O %S"
LATEXMK += -synctex=1 -halt-on-error -interaction=nonstopmode
LATEXMK += $(EXTRAMK)
LATEXKO :=
MAIN    := refman

ifneq (${DRAFT},)
LATEXMK += -e '$$max_repeat = 1'
LATEXKO += -
endif

export TEXINPUTS := ../common:.:${TEXINPUTS}

# --------------------------------------------------------------------
.PHONY: all force scratch clean

all:
	$(LATEXKO)$(LATEXMK) -pdf $(MAIN)

force: 
	$(LATEXKO)$(LATEXMK) -pdf -g $(MAIN)

scratch: clean all
	@true

clean:
	latexmk -C $(MAIN)
	rm -rf _build/
