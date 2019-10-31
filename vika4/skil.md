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
- '\newcommand{\hwname}{Valtýr, Árni og Haraldur}'
- '\newcommand{\hwemail}{vok4, afm7, hbd4}'
- '\newcommand{\hwtype}{Heimadæmi}'
- '\newcommand{\hwnum}{3}'
- '\newcommand{\hwclass}{TÖL304G}'
- '\newcommand{\hwlecture}{}'
- '\newcommand{\hwsection}{}'
---

\maketitle

## Leiðbeiningar

Íhugið eftirfarandi $\lambda$-segðir:

- Skrifið Scheme segðir (mega vera Scheme föll) sem jafngilda þeim. Athugið að í $\lambda$-reikningi merkir segð xy fallið x beitt á viðfang y, ekki x margfaldað með y. Í Scheme myndum við skrifa `(x y)`{.scm} til að fá þessa merkingu. Hins vegar leyfum við okkur í $\lambda$-reikningi að nota millitáknun fyrir reikniaðgerðir og þess vegna samsvarar $\lambda$-segðin x ∗ y Scheme segðinni `(* x y)`{.scm}. Í $\lambda$-reikningi m+a að ósekju bæta við svigum án þess að merking breytist, en í Scheme þá má hvorki bæta við svigum né fækka þeim án þess að merkingin breytist.
- Ef segðin skilar einföldu gildi (t.d. tölu) skal tiltaka hvert gildið er.
- Ef segðin skilar falli sýnið þá, ef hægt er, hvernig nota má fallið í segð sem skilar einföldu gildi.
- Tiltakið hvaða breytur eru frjálsar í hverri segð (ef einhver er). Athugið að hér er spurt um hvort breytan er frjáls í heildarsegðinni, ekki aðeins einhverri undirsegð.
- Endurskrifið einnig $\lambda$-segðina og skiptið um breytunöfn þar sem það er hægt án þess að merking hennar breytist og notið breytunöfn a, b, o.s.frv. í stað x, y o.s.frv. Athugið að hér erum við að nota smá viðbætur við venjulegan $\lambda$-reikning, sem eru ansi hefðbundnar. Við leyfum okkur t.d. að skrifa x + y og ætlumst til að segðin 5 + 3 sé umrituð í segðina 8 ef sá möguleiki verður til staðar


\newpage

# Dæmi {-}

Ytri lambda segðin í dæmi 1 er fall $\lambda a.N$ sem skilar öðru falli $\lambda b.M$.
Innri segðin tekur inn gildi b leggur það saman við bundið a út ytri segðinni og
deilir útkomunni með b. Endanlega útkoman er því gildið $\frac{a + b}{b}$.

```scheme
(define daemieitt 
    (lambda (a)
      (lambda (b) (/ (+ a b) b))  
    )
)
```

\newpage

# Dæmi {-}


Í þessu dæmi er fyrst kallað á $\lambda y.N$ með töluna 3 sem inntak. Útkoman
úr því er fall af x sem skilar $\frac{x+3}{3}$ þ.e. $\lambda x.(x+3)/3$.
Kallað er í það með $x=6$ og útkoman því 3. Það eru engar frjálsar breytur í þessu dæmi.

Þegar við skrifuðum fyrstu scheme-útfærsluna okkar af fallinu gerðum við klaufavillu
_(sjá Keyrslu 1)_. Við gripum hana blessunarlega og endanlegu útkomuna má sjá í _(Keyrslu 2)_.


#### Keyrsla 1 (rangt)

`>` `(((lambda (a) (lambda (b) (/ (+ a b) b))) 3) 6)`{.scm}

$1 \frac{1}{2}$


#### Keyrsla 2 (rétt)

`>` `((lambda (a) (lambda (b) (/ (+ a b) b)) 3) 6)`{.scm}

$3$

\newpage

# Dæmi {-}

Ytri lambda segðin í dæminu er fall $\lambda a.N$ sem skilar öðru falli með inntak b
sem skilar gildinu $(a \circ a) (b)$. Kallað er í ytri lambda segðina með lambda segðinni 
$\lambda a.a^2$. Það skilar fallinu $x^4$. Það eru engar frjálsar breytur í dæminu.



```scheme
(define daemithrju
  (
    (lambda (a)
      (lambda (b)
        (a (a b))
      )
    )
    (lambda (a) (* a a))
  )
)
```


#### Keyrsla

`>` `(daemithrju 3)`{.scm}

$81$


