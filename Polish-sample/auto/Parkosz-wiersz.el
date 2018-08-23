(TeX-add-style-hook
 "Parkosz-wiersz"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "dvipsnames" "12pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "a4paper" "landscape") ("setspace" "doublespacing")))
   (add-to-list 'LaTeX-verbatim-environments-local "VerbatimOut")
   (add-to-list 'LaTeX-verbatim-environments-local "SaveVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "OCG_annotation"
    "Parkosz13-15wiersz"
    "article"
    "art12"
    "polyglossia"
    "geometry"
    "setspace"
    "fontspec"
    "graphicx"
    "xcolor"
    "soul"
    "ocgx"
    "zref-savepos"
    "xifthen"
    "xspace"
    "longtable"
    "hyperref"
    "fancyvrb"
    "relsize"
    "draftwatermark")
   (TeX-add-symbols
    '("conf" 2)
    '("overstr" 1)
    '("extra" 1)
    '("add" 1)
    '("margin" 1)
    '("hypht" 2)
    '("hyphh" 2)
    '("dc" 1)
    '("almanica" 1)
    '("PARKOSZ" 1)
    '("parkosz" 1)
    '("sParkosz" 1)
    '("symbolParkosz" 1)
    "mono"
    "Parkosz"
    "indentK"
    "indentKcyt"
    "indentP"
    "ppageno"
    "ppreviouspageno"
    "plineno"
    "psublineno"
    "pnoteno"
    "psecnoteno"
    "largeParkosz"
    "fulllines"
    "fullpreviouslines"
    "splitlines"
    "newsplitline"
    "newParkoszpage"
    "newtip"
    "secondtip"
    "thirdtip"
    "fourthtip"
    "fifthtip")
   (LaTeX-add-polyglossia-langs
    '("polish" "defaultlanguage" "")))
 :latex)

