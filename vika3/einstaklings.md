---
documentclass: homework
classoption:
- 11pt
- largemargins
- papersize:a4
newtxmathoptions:
- cmintegrals
- cmbraces
colorlinks: true
linkcolor: RoyalBlue
urlcolor: RoyalBlue
header-includes:
- '\usepackage[icelandic]{babel}'
- '\newcommand{\hwname}{Valtýr Örn Kjartansson}'
- '\newcommand{\hwemail}{vok4}'
- '\newcommand{\hwtype}{Einstaklingsverkefni}'
- '\newcommand{\hwnum}{3}'
- '\newcommand{\hwclass}{TÖL304G}'
- '\newcommand{\hwlecture}{}'
- '\newcommand{\hwsection}{}'
---

\maketitle

# Dæmi {-}

Hér er b (z í lambda setningunni) frjáls breyta. Fallið skilar gildinu $\frac{a+b}{b}$.

Ath. að eftirfarandi kóði þýðist ekki nema b sé áður skilgreind breyta.

```scheme
(define daemieitt
  (lambda (a) (/ (+ a b) b)))
```

# Dæmi {-}

Hér er engin frjáls breyta.
Ytri tvær lambda setningarnar skila föllum en sú innsta skilar gildinu sem fæst úr `(a (b (b c)))`{.scm}. Það fer eftir því hvaða föll eru send inn sem a og b og hvaða gildi er sent inn sem c hvaða úttaksgildi er endanlega skilað.

```scheme
(define daemitvo
  (lambda (a)
    (lambda (b)
      (lambda (c)
        (a (b (b c)))))))
```



