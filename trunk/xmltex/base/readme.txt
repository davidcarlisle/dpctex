
 xmltex.tex
 ==========

Copyright 2000 David Carlisle

This collection of files is distributed under the LaTeX Project Public
License a (LPPL) as found at http://www.latex-project.org/lppl.txt
Either version 1.0, or at your option, any later version.


xmltex is a system for typesetting XML files with TeX. It may be used
on its own or in conjunction with another TeX format. (LaTeX is
assumed for most examples).

xmltex supports the XML Namespace Recommendation. Arbitrary prefixes
may be used in document instances, and in definition files. It
supports any encoding that matches ASCII in the first 127 positions.
UTF-8, latin-1 and KOI8-R are included in the distribution, other
encodings may be trivially added.

Further documentation may be obtained by running manual.tex through
LaTeX.

The distribution of 2000-01-18 consists of:

* readme.txt
  This file.



* xmltex.tex
  The source code for xmltex.

* xmltex.cfg
  Configuration file for xmltex, with sufficient information about
  Unicode to typeset the latin-1 and Cyrillic examples in the
  distribution, and information about the namespaces and dtd used in the
  examples.

* iso-8859-1.xmt
  internal file defining latin-1 input encoding

* utf-16.xmt
  place holder for a file supporting UTF-16 (not really possible with
  standard TeX).

* koi8-r.xmt
  internal file defining the Cyrillic encoding KOI8-R.
  Support for any 8 bit encoding that matches ASCII for the first 127
  positions may be added by copying the format of file.



* manual.xml
  The manual for xmltex (marked up in TEI XML).

* manual.tex
  Support files for processing the manual.
  LaTeX manual.tex with your standard LaTeX format, to obtain
  the typeset documentation.

* manual.html manual.xsl
  HTML version of manual, generated via XSL (thanks to Sebastian Rahtz).


* tei.xmt
  xmltex package file for TEI XML markup as used in the xmltex manual.
  (The much of this file was implemented by Sebastian Rahtz)

* mathml2.xmt
  A small start towards an xmltex package for MathML2.
  Used in one of the test files.

* sec.xmt
  A package for a small XML document language used in sone of the test
  files.



* langtest.xml langtest.tex
  This test example file demonstrates a small `hello world' document in
  different languages and different encodings all input into the same
  document. Note that the table of contents is constructed correctly
  despite the fact taht different encodings are used. Also note that
  typesetting commands only need to be defined once, irrespective of
  encoding. So the Cyrillic command for `document' looks quite different
  in the utf-8 and koi8-r files, but the same definitions work in both
  cases.

* englishutf8.xml
  English markup in utf-8, used by langtest.xml

* English markup in utf-16,  used by langtest.xml.
  Note that utf-16 support is limited to the latin-1 range (it just
  consists of ignoring the null byte).

* portugeselatin1.xml
  Portugese example, note that the markup is in latin 1, but the
  definitions (in langtest.cfg are in utf-8).

* russiankoi8.xml
  Russian Example, KOI8-R. This test file typesets Cyrillic letters
  This assumes the AMS `OT2' encoded cyrillic fonts are present on your
  system. (Better support for cyrillic is available with the T2 encoded
  fonts but these are not used in this example to enable the example
  to be run on as many sites as possible.)

* russiankutf8.xml
  Russian Example, utf-8.
  

* testsec.xml testsec.tex
  A small example testing varius features.
  The final section includes some tests of MathML.
  Note that the elements defined in this file use a namespace prefix
  even though the elements in the XML document (testsec) do not.

* testascii.xml testascii.tex testascii.cfg
  A test file in which all characters are activated, allowing for some
  special effects. (Here vowels are red and numbers are old style.)

 