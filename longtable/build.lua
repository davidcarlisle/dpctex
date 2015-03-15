#!/usr/bin/env texlua

-- Build script for "longtable" files

-- Identify the bundle and module
bundle = ""
module = "longtable"


checksuppfiles = 
  {"test2e.tex"}

checkengines   = {"pdftex"}

-- Documentation is standalone
typesetfiles = {"*.tex"}


-- Release a TDS-style zip
packtdszip  = true

-- tests for this bundle
-- testfiledir = "testfiles"


-- Find and run the build system
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))