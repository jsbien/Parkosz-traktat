;;; Parkosz-slash.el Janusz S. Bień

;;; latin-pre.el --- Quail packages for inputting various European characters  -*-coding: utf-8;-*-

;; Copyright (C) 1997-2014 Free Software Foundation, Inc.
;; Copyright (C) 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
;;   2006, 2007, 2008, 2009, 2010, 2011
;;   National Institute of Advanced Industrial Science and Technology (AIST)
;;   Registration Number H14PRO021

;; Keywords: mule, multilingual, latin, input method

;; polish-slash:
;; Author: Włodek Bzyl <matwb@univ.gda.pl>
;; Maintainer: Włodek Bzyl <matwb@univ.gda.pl>

;;; Code:

(require 'quail)


(quail-define-package
 "Parkosz-slash" "Polish" "ƤꞭ>" nil
 "Polish diacritics and slash character are input as `/[acelnosxzACELNOSXZ/]'.
For example, the character named `aogonek' is obtained by `/a'."
 nil t t t nil nil nil nil nil nil t)

(quail-define-rules
 ("//" ?/)
 ("/1" ?¹)
 ("/2" ?²)
 ("/." ?·)
 ("/a" ?ą)
 ("/A" ?Ą)
 ("/'a" ?á) 
 ("/'A" ?Á) 
 ("/*a" ?å) 
 ("/*A" ?Å) 
 ("/b" ["b́"])
 ("/B" ["B́"]) 
 ("/#b" ?ƀ); U+0253=LATIN SMALL LETTER B WITH HOOK
 ("/#B" ?Ƀ); U+0180=LATIN CAPITAL LETTER B WITH STROKE 
 ("/@b" ?ɓ); U+0253=LATIN SMALL LETTER B WITH HOOK
 ("/@B" ?Ɓ); U+0180=LATIN CAPITAL LETTER B WITH HOOK
 ("/c" ?ć)
 ("/C" ?Ć)
 ("/*c" ?ç); U+00E7=LATIN SMALL LETTER C WITH CEDILLA 
 ("/*C" ?Ç); U+00C7=LATIN CAPITAL LETTER C WITH CEDILLA
 ;;; D z akutem?
 ("/e" ?ę)
 ("/E" ?Ę)
 ("/.e" ?è)
 ("/.E" ?È) ; !!!
 ("/'e" ?é) ; : Alt + 2 <e1>
 ("/'E" ?É) ; j.w.
 ("/`e" ?è)
 ("/`E" ?È)
 ("/*g" ?ɠ) ; U+0260=LATIN SMALL LETTER G WITH HOOK
 ("/*G" ?Ɠ) ; U+0193=LATIN CAPITAL LETTER G WITH HOOK
 ("/l" ?ł)
 ("/L" ?Ł)
 ("/#l" ?ƚ) ; U+019A=LATIN SMALL LETTER L WITH BAR
 ("/#L" ?Ƚ) ; U+023D=LATIN CAPITAL LETTER L WITH BAR
 ("/@l" ?ɬ) ; U+026C=LATIN SMALL LETTER L WITH BELT
 ("/@L" ?Ɬ) ; U+A7AD=LATIN CAPITAL LETTER L WITH BELT
 ("/-m" ["m̄"]) ; !!! Ctrl+Shift+M <mzk> (s. 7) m z kreską (s. 9)
 ("/-M" ["M̄"]) ; !!! Ctrl+Shift+M <mzk> (s. 7) m z kreską (s. 9)
 ("/*m" ?ɱ) ; U+0271=LATIN SMALL LETTER M WITH HOOK
 ("/*M" ?Ɱ) ;U+023D=LATIN CAPITAL LETTER M WITH HOOK
 ("/-n" ["n̄"]) ; !!! Ctrl+Shift+N <nzk> (s. 7) n z kreską (s. 9)
 ("/-N" ["N̄"]) ; !!! Ctrl+Shift+N <nzk> (s. 7) n z kreską (s. 9)
 ("/n" ?ń)
 ("/N" ?Ń)
 ("/*n" ?ɲ) ; U+0272=LATIN SMALL LETTER N WITH LEFT HOOK
 ("/*N" ?Ɲ) ; U+019D=LATIN CAPITAL LETTER N WITH LEFT HOOK
 ("/o" ?ó)
 ("/O" ?Ó)
 ("/`o" ?ò)
 ("/`O" ?Ò)
 ("/*o" ?ø) ; U+00F8=LATIN SMALL LETTER O WITH STROKE
 ("/*O" ?Ø) ; U+00D8=LATIN CAPITAL LETTER O WITH STROKE
 ("/p" ?ṕ) ; !!! Ctrl+Shift+5 <p1> p miękkie (s. 9) [jest w Libertine, nie ma w DejaVu]
 ("/P" ?Ṕ) ; !!! j.w.
 ("/#p" ?ᵽ) ; U+1D7D=LATIN SMALL LETTER P WITH STROKE
 ("/#P" ?Ᵽ);  U+2C63=LATIN CAPITAL LETTER P WITH STROKE
 ("/@p" ?ƥ) ; U+1A5=LATIN SMALL LETTER P WITH HOOK
 ("/@P" ?Ƥ) ; U+1A4=LATIN CAPITAL LETTER P WITH HOOK
 ("/r" ["ŗ"]) ; !!! r z cedille? Alt + R <rs> (s. 6)
 ("/R" ["Ŗ"]) ; !!! r z cedille? Alt + R <rs> (s. 6)
 ("/s" ?ś)
 ("/S" ?Ś)
 ("/*s" ?ſ) ; 017F=LATIN SMALL LETTER LONG S
; ("/*S" ?Ś)
 ("/*v" ?ʋ) ; U+028B=LATIN SMALL LETTER V WITH HOOK
 ("/*V" ?Ʋ) ;  U+01B2=LATIN CAPITAL LETTER V WITH HOOK
 ("/'w" ?ẃ) ; Alt + W <w1> 
 ("/'W" ?Ẃ) ; j.w. 
 ("/:y" ?ÿ) ; Alt + R <rs>
 ("/:Y" ?Ÿ) ; !!! j.w.
 ("/x" ?ź)
 ("/X" ?Ź)
 ("/z" ?ż)
 ("/Z" ?Ż)
)

;;; latin-pre.el ends here
;;; Parkosz-slash.el ends here
