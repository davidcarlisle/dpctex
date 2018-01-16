
Graphics code for non-LaTeX users.
==================================

This directory provides a small wrapper file such that users of
formats based on plain TeX may make use of some of the parts of the
standard LaTeX distribution.

These files are *NOT* supported by the LaTeX3 project, and any
problems with them should *NOT* be reported to the LaTeX bugs system.

Problems should be reported as issues at
https://github.com/davidcarlisle/dpctex/tree/master/graphics-pln


David Carlisle 1995/01/29
               1996/11/13
	       2016/08/17
	       2017/06/01
	       2018/01/16

Copyright 1995 1996 2016 2017 2018 David Carlisle

   All the files in this directory may be redistributed and/or modified
   under the terms of the LaTeX Project Public License distributed from
   CTAN archives in directory macros/latex/base/lppl.txt; either
   version 1 of the License, or (at your option) any later version. 



This directory contains

README.txt This file.

exmplpic.tex
      A plain TeX document using LaTeX' `picture mode': a portable
      means of producing simple diagrams.

exmplgrf.tex 
      A plain TeX document using the LaTeX graphicx package, for
      rotating and scaling text, and include PostScript and other
      graphics formats. (This will include the file a.ps available
      in the LaTeX graphics distribution.)

exmplcol.tex
      A plain TeX document using the LaTeX color package, for
      producing colour.

exmplpfg.tex
      A plain TeX document using the contributed LaTeX psfrag package,
      for including PostScript documents, while replacing certain text
      strings with TeX typeset replacements. This uses the example.eps
      figure from the psfrag 3.0 distribution.

miniltx.tex
      A small `miniLaTeX' that defines fakes or otherwise hacks
      sufficient bits of LaTeX internals so that the packages can load.

picture.tex
      The user interface to the picture environment.
      \input picture.
      Normally a plain-style syntax is used, viz
      \picture(100,100)
      ....
      \endpicture

      However if the command \LaTeXbegin is issued, then a LaTeX
      syntax of
      \begin{picture}(100,100)
      ....
      \end{picture}
      May be used. this may be prefered if the picture is being copied
      from a LaTeX document, or if it is produced automatically from
      a drawing tool such as xfig or texcad.

autopict.sty
      This is a frozen copy of a file that used to be distributed with
      LaTeX but is no longer needed in that context, it is basocally
      the source of LaTeX Picture mode from LaTeX in 2014. The
      original use for this package was to build a latex format in
      which some environments such as picture and tabbing were not
      defined by default, to save space if working with TeX on a
      machine with 640K memory.


graphicx.tex
      The user interface to the graphicx package.
      \input graphicx
      See the documentation in grfguide.ps in the LaTeX graphics
      distribution.
      This file sets the driver to be dvips. If you
      use another driver, edit accordingly.

color.tex
      The user interface to the color package.
      \input color
      See the documentation in grfguide.ps in the LaTeX graphics
      distribution. 
      This file sets the driver to be dvips. If you
      use another driver, edit accordingly.
     

psfrag.tex
      The user interface to the psfrag package.
      \input psfrag
      See the documentation in pfgguide.tex in the psfrag distribution,
      and the example document pfgexmpl.tex included here.
