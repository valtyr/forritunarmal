---
documentclass: homework
classoption:
- 11pt
#- largemargins
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
- '\newcommand{\hwtype}{Heimadæmi}'
- '\newcommand{\hwnum}{6}'
- '\newcommand{\hwclass}{TÖL304G}'
- '\newcommand{\hwlecture}{}'
- '\newcommand{\hwsection}{}'
---

\maketitle

# Dæmi {-}

```ocaml
(*
** Notkun: powerlist x
** Fyrir:  x er heiltala, x >= 0
** Gildi:  Listi af listum sem inniheldur alla mögulega lista sem
**         eru undirlistar listans [x;n-1;....2;1] í þeim skilningi að
**         að undirlistarnir innihalda gildi úr listanum [x;n-1;....2;1]
**         í sömu röð og í [x;n-1;....2;1] nema hvað má fjarlægja núll
**         eða fleiri gildi úr listanum [x;n-1;....2;1].
*)
let powerlist x =
  (*
  ** Notkun: hjalp lst
  ** Fyrir:  lst er endanlegur listi, lst=(x1 x2 ... xN)
  ** Gildi:  Listinn (y1 y2 y3 ...)
  **         sem inniheldur alla lista sem
  **         hægt er að smíða með því að taka
  **         núll eða fleiri gildi úr lst, í
  **         sömu röð og í lst, og skeyta þeim
  **         saman í lista.
  *)
  let rec hjalp lst =
    match lst with
    | []         -> [[]]
    | head::tail -> List.append
        (hjalp tail)
        (List.map (fun y -> [head]@y) (hjalp tail))
  in hjalp (fromTo 1 (x+1))
;;
```

__*Keyrsla:*__

```
# powerlist 4;;
- : int list list =
[[]; [4]; [3]; [3; 4]; [2]; [2; 4]; [2; 3]; [2; 3; 4]; [1]; [1; 4]; [1; 3];
 [1; 3; 4]; [1; 2]; [1; 2; 4]; [1; 2; 3]; [1; 2; 3; 4]]
```
