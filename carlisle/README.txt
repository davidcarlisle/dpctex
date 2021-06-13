
CTAN:macros/latex/contrib/supported/carlisle

This directory contains various packages that are not related to
each other except by the fact that they have the same author.

 All the files in this directory, and the LaTeX packages
 that can be extracted from the source files in ths directory
 may be redistributed and/or modified under the terms
 of the LaTeX Project Public License Distributed from CTAN
 archives in directory macros/latex/base/lppl.txt; either
 version 1 of the License, or (at your option) any later version.

David Carlisle https://github.com/davidcarlisle/dpctex

2021-06-13


Currently the directory contains the following.

dotlessj.sty
   If you are using a font set without a dotless j (\j and \jmath) then
   this package will fake one. It requires the LaTeX color package.
   It does not require any explicit PostScript support.

plain.sty
   Typeset plain TeX markup in LaTeX documents.
   Within \begin{plain} ... \end{plain} most plain TeX constructs work
   including commands such as \over which might have been disabled by
   other LaTeX packages such as amsmath.

scalefnt.sty
   \scalefont{2} selects the current font in twice the current size.
   \scalefont{.75} reduces the current font size by three quarters.

slashed.sty
   Commands for the `Feynman slashed character' notation.

ltxtable.tex
ltxtable.pdf
   This generates and documents the package ltxtable.sty. A merger of
   longtable and tabularx packages from the Standard LaTeX tools
   collection. This produces multipage tables in which the column
   widths are automatically calculated to achieve a specified total
   table width.

remreset.sty
   \@removefromreset: a companion to the standard \@addtoreset command
   allows counters to be removed from the reset list of a controlling
   counter. For example, a class file based on book class may say
   \@removefromreset{footnote}{chapter}
   so that footnotes are no longer reset every chapter (the book class
   default).
   This file is obsolete with LaTeX releases from 2018 onwards as the
   command is defined in the format.


Packages that were formally in this collection.


mylatex.ltx
   This file has now moved: see macros/latex/contrib/mylatex

nopageno.sty
   This file has now moved: see macros/latex/contrib/nopageno

blkarray.sty
   This file has now moved: see macros/latex/contrib/blkarray

typehtml.dtx
typehtml.ins
   These files have moved: see macros/latex/contrib/typehtml

comma.sty
   These files have moved: see macros/latex/contrib/comma

colortbl.dtx
colortbl.ins
   These files have moved: see macros/latex/contrib/colortbl

textcase.dtx
textcase.ins
   These files have moved: see macros/latex/contrib/textcase

fix2col.dtx
fix2col.ins
   These files have moved: see macros/latex/contrib/fix2col

pspicture.ins
pspicture.dtx
   These files have now moved: see macros/latex/contrib/pspicture

tabulary.dtx
tabulary.ins
   These files have now moved: see macros/latex/contrib/tabulary
