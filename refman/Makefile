# -*- Makefile -*-

# --------------------------------------------------------------------
.PHONY: all clean __force__

LATEXMK := latexmk -bibtex -output-directory=_build -silent
LATEXMK += -latex="latex --shell-escape %O %S"
LATEXMK += -pdflatex="pdflatex --shell-escape %O %S"
LATEXMK += -synctex=1
LATEXKO :=
EXTRAMK ?=
ITMODE  ?= errorstopmode
LINKS   := log synctex.gz
MAIN    := refman

ifneq (${DRAFT},)
LATEXMK += -e '$$max_repeat = 1'
LATEXKO += -
endif

LATEXMK += -interaction=$(ITMODE) $(EXTRAMK)

export TEXINPUTS := ../common:.:${TEXINPUTS}

# --------------------------------------------------------------------
.PHONY: all links force scratch clean purge __force__

define latex
	$(LATEXMK) -pdf $* $(MAIN); err=$$?; \
	[ -f _build/$(MAIN).pdf ] && cp _build/$(MAIN).pdf .; \
	exit $$err
endef

all: prepare __force__
	$(LATEXKO)$(call latex)

force: prepare __force__
	$(LATEXKO)$(call latex,-g)

prepare: __force__
	for i in $(LINKS); do ln -sf _build/$(MAIN).$$i .; done
	rm -f _build/$(MAIN).pdf

scratch: purge all
	@true

clean:
	rm -rf _build/ $(LINKS:%=$(MAIN).%)

purge: clean
	rm -f $(MAIN).pdf
