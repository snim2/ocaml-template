#
# Generic Makefile for OCaml projects.
#
# Sarah Mount
# September 2009.
#
# Code should be structured roughly like this:
#
# project /
#     Makefile
#     README
#     ChangeLog
#     ...
#     src/
#         program.ml
#         interface.mli
#         ...
#     tests/
#         ...
# 
# Make sure to change the project / system specific 
# values below.

# Program to be built. No need to list dependent
# modules in the same directory, or sub directories.
PROGRAM=hello

# OCaml build tool.
BUILDER=ocamlbuild

# OCaml libraries outside of the stdlib.
LIBS=

# $(DOCFILE).odocl must exist in $(SRCDIR) and 
# contain a list of module names (not file names) 
# to be documented.
DOCFILE=hello

# Where everything is stored
SRCDIR=src
DOCDIR=docs
BUILDDIR=build

# Path separator for the current platform.
# Uncomment the next line for Windows platforms.
#/ := $(strip \)
# Uncomment the next line for UNIX platforms.
/=/

# Symbolic links created by this Makefile (DO NOT EDIT).
SYMLINKS=$(PROGRAM) $(PROGRAM).byte $(DOCDIR)

all: docs byte native
docs:
	$(BUILDER) $(SRCDIR)$/$(DOCFILE).docdir/index.html -I $(SRCDIR) -build-dir $(BUILDDIR)
	ln -sf $(BUILDDIR)$/$(SRCDIR)$/$(PROGRAM).docdir $(DOCDIR)
byte:
	$(BUILDER).byte $(SRCDIR)$/$(PROGRAM).byte -libs $(LIBS) -build-dir $(BUILDDIR)
	ln -sf $(BUILDDIR)$/$(SRCDIR)$/$(PROGRAM).byte $(PROGRAM).byte 
native:
	$(BUILDER).native $(SRCDIR)$/$(PROGRAM).native -libs $(LIBS) -build-dir $(BUILDDIR)
	ln -sf $(BUILDDIR)$/$(SRCDIR)$/$(PROGRAM).native $(PROGRAM) 
clean: 
	$(BUILDER) -clean -build-dir $(BUILDDIR)
	rm -f $(SYMLINKS)
