# -*- Makefile -*-

# --------------------------------------------------------------------
TOOLS   := ../../common
OUTDIR  := parts
ECFILES :=
ECFILES += $(wildcard *.ec) $(wildcard tactics/*/*.ec)

# --------------------------------------------------------------------
.PHONY: all scratch

all:
	$(TOOLS)/buildgoals $(OUTDIR) $(ECFILES)

scratch:
	-find parts -name '*.ec' -exec rm '{}' ';'
	-find parts -depth -mindepth 1 -type d -exec rmdir '{}' ';'
