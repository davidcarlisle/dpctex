

pslatex (Times/Helvetica/Courier with LaTeX2e)

  Copyright 1994 1996 David Carlisle

  All the files in the pslatex distribution may be redistributed
  and/or modified under the terms of the LaTeX Project Public License
  distributed from CTAN archives in directory
  macros/latex/base/lppl.txt; either version 1 of the License,
  or (at your option) any later version.

This is a small package that makes LaTeX default to `standard'
PostScript fonts. It is basically a hacked merger of times.sty and
mathptm.sty, from the psnfss suite of packages. You must have
installed standard LaTeX (LaTeX2e) and psnfss PostScript fonts
to use this package.

The main novel feature is that the pslatex package (unlike times.sty)
tries to compensate for the visual differences between the Adobe fonts
by scaling Helvetica by 90%, and `condensing' Courier (ie scaling
horizontally) by 85%.

The second novel feature is that it is supplied with a (unix) shell
file that produces a `pslatex' command that allows standard LaTeX
documents to be processed, without needing to edit the file to add
\usepackage{pslatex}
The same command is supplied as a .bat file for DOS, and could be easily
edited to the command language for any other OS.

I have not used this much myself, I prefer Computer Modern Fonts, as a
rule, but it has had reasonably extensive testing as it has been used
as a replacement for the old LaTeX2.09 pslatex by Mario Wolczko, which
had a large user base at Manchester.

To use this package: either add the line \usepackage{pslatex} to your
preamble, or if you do not want to edit the file, use the supplied
`pslatex' command instead of `latex' which will cause LaTeX to
automatically include the pslatex package at \begin{document}.

       David Carlisle
           1994/02/07
           1996/07/22
           1996/07/24

Files
=====

00readme.txt              This file

dvips/pcrr8rn.map         If you are using dvips, copy the one line from
                          this file to your psfonts.map file.

fontinst/courier.tex      The source file for the courier vf fonts.
                          You do not need this file unless you need to
			  recreate the supplied files using fontinst.

latex/pslatex.sty         The pslatex package, place this in your
                          TEXINPUTS tree.


shell/pslatex             A unix (Bourne shell) script to supply a
                          `pslatex' command that implicitly adds
                          \usepackage{pslatex}
      pslatex.bat         Same for DOS


tfm/pcrr8rn.tfm            tfm font, for condensed courier. (Raw)
    pcrr7tn.tfm                                             (OT1)
    pcrr8tn.tfm                                             (T1)
                           Place these in your tfm area



vf/pcrr7tn.vf              vf font, for condensed courier. (OT1)
   pcrr8tn.vf                                              (T1)
                           Place these in your vf area


afm/pcrr8a.afm             Courier
    psyr.afm               Symbol
                           afm files. You don't need these unless using
                           fontinst to rebuild the supplied fonts.
