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
- '\newcommand{\hwnum}{5}'
- '\newcommand{\hwclass}{TÖL304G}'
- '\newcommand{\hwlecture}{}'
- '\newcommand{\hwsection}{}'
---

\maketitle

# Dæmi {-}

```scheme
;; Notkun: (RealPow_recursive x y)
;; Fyrir: x er rauntala, y er heiltala
;; Gildi: x í veldinu af y
;;
(define (RealPow_recursive x y)
  (if (= y 0)
    1
    (if (= y 1)
      x
      (if (= (remainder y 2) 0)
        (RealPow_recursive (* x x) (quotient y 2))
        (* x (RealPow_recursive (* x x) (quotient y 2)))))))

```

__Keyrsla:__

```
"vika5/einstaklings.scm"> (RealPow_recursive 2 2)
4
```

\newpage

# Dæmi {-}

```scheme
;; Notkun: (RealPow_loop x y)
;; Fyrir: x er rauntala, y er heiltala
;; Gildi: Rauntala x í veldinu af y
;;
(define (RealPow_loop x y)
  ;; Notkun  (hjalp r p q)
  ;; Fyrir:  r er heiltala,
  ;;         p er 1,
  ;;         q er rauntala.
  ;; Gildi:  Rauntala q í veldinu af r
  (define (hjalp r p q)
    (if (= r 0)
      p
      (if (eqv? (remainder r 2) 0)
        (hjalp (quotient r 2) p (* q q))
        (hjalp (quotient r 2) (* p q) (* q q)))))
  (hjalp y 1 x))
```

**Keyrsla:**

```
"vika5/einstaklings.scm"> (RealPow_loop 2 2)
4
```

\newpage

# Dæmi {-}

```scheme
;; Notkun: (byltalista lst)
;; Fyrir: lst er listi jafnlangra lista,
;; z=((x11 x12 ... x1N)
;; (x21 x22 ... x2N)
;; (x31 x32 ... x3N)
;; .
;; .
;; .
;; (xM1 xM2 ... xMN)
;; )
;; Gildi: Listinn sem er byltingin
;; (transpose) af lst, þ.e.
;; ((x11 x21 ... xM1)
;; (x12 x22 ... xM2)
;; (x13 x23 ... xM3)
;; .
(define (byltalista lst)
  ;; Notkun: (hjalp rows)
  ;; Fyrir: rows er listi af sömu lengd og lst
  ;; með undirlista (allir jafn langir) af gildum
  ;; af lengd lst eða styttri.
  ;; Gildi: transpose af lst
  (define (hjalp rows)
    (if (eqv? 0 (length (car rows)))
      '()
      (cons
        (map (lambda (row) (car row)) rows)
        (hjalp (map (lambda (row) (cdr row)) rows)))))
  (hjalp lst))
```

**Keyrsla:**

```
"vika5/einstaklings.scm"> (byltalista (list (list 1 2 3 4) (list 5 6 7 8)
(list 9 10 11 12) (list 13 14 15 16)))
'((1 5 9 13) (2 6 10 14) (3 7 11 15) (4 8 12 16))
```

