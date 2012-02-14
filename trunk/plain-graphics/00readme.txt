
Graphics code for non-LaTeX users.
==================================

This directory provides a small wrapper file such that users of
formats based on plain TeX may make use of some of the parts of the
standard LaTeX distribution.

These files are *NOT* supported by the LaTeX3 project, and any
problems with them should *NOT* be reported to the LaTeX bugs system.

Currently problems may be reported to me, david@dcarlisle.demon.co.uk
although as I only ever use LaTeX for documents, these files have not
been extensively tested. If some plain TeX user wants to `adopt' them
and take over their support then they are welcome to it:-)

David Carlisle 1995/01/29
               1996/11/13

Copyright 1995 1996 David Carlisle

   All the files in this directory may be redistributed and/or modified
   under the terms of the LaTeX Project Public License distributed from
   CTAN archives in directory macros/latex/base/lppl.txt; either
   version 1 of the License, or (at your option) any later version. 



This directory contains

00readme.txt This file.

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

autopict.ins
      picture.tex requires the use of the Standard LaTeX file
      autopict.sty. To generate this, either run the autoload.ins
      install file in the main LaTeX distribution, which will make
      autopict.sty along with some other files (not needed here) or
      alternatively just obtain obtain ltpictur.dtx and docstrip.tex
      from the LaTeX distribution, and TeX the file autopict.ins that
      is included in this distribution.


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