# -*- Makefile -*-

# --------------------------------------------------------------------
TOOLS   := ../../common
OUTDIR  := parts
ECFILES :=
ECFILES += $(wildcard *.ec) $(wildcard tactics/*/*.ec)

# --------------------------------------------------------------------
.PHONY: all git scratch

all:
	$(TOOLS)/buildgoals $(OUTDIR) $(ECFILES)

git:
	@if git status --porcelain | grep -v '^??' >/dev/null; then \
	  echo '[E] git working copy is in a dirty state' >&2; \
	  echo '[E] (or the `git` command failed)' >&2; \
	  exit 1; \
	fi
	$(MAKE) all
	git add -- $(OUTDIR)
	if git status --porcelain -- $(OUTDIR) | grep -v '^??' >/dev/null; then \
	  git commit -m 'Examples updated (from goal extraction)'; \
	fi

scratch:
	-find parts -name '*.ec' -exec rm '{}' ';'
	-find parts -depth -mindepth 1 -type d -exec rmdir '{}' ';'
