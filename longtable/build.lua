#!/usr/bin/env texlua

-- Build script for "longtable" files

-- Identify the bundle and module
bundle = ""
module = "longtable"

-- Install .def files as well as .sty
-- These are also the sources
installfiles = {"*.sty"}
sourcefiles  = installfiles

checksuppfiles = 
  {"test2e.tex"}

checkengines   = {"pdftex"}

-- Documentation is standalone
typesetfiles = {"*.tex"}

-- No packed source files
unpackfiles = {""}

-- Release a TDS-style zip
packtdszip  = true

-- tests fo this bundle
-- testfiledir = "testfiles"
testfiledir = ""

-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))