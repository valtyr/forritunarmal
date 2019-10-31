

(*
** Notkun: mapreduce f op u x
** Fyrir:  f er fall af einni viðfangsbreytu
**         op er fall af tveimur viðfangsbreytum
**         u er upphafsgildi af sama tagi og op skilar
**         x er listi
** Gildi:  u op f(x1) op ... op f(xn)
*)
let mapreduce f op u x =
  (*
  ** Notkun: help c l
  ** Fyrir:  c er uppsafnað gildi úr fyrri keyrslum
  **         (upphafsgildi í fyrstu keyrslu)
  **         l er listi
  ** Gildi:  Skilar ekki fyrr en listi er tómur
  **         Þá skilar fallið u op f(x1) op ... op f(xn)
  *)
  let rec help c l =
    match l with
    | [] -> c
    | first::rest -> help (op c (f first)) rest
  in help u x
;;


(*
** Notkun: fromTo i j
** Fyrir:  i og j eru heiltolur, i<=j
** Gildi:  Listinn [i;i+1;...;j-1].
*)
let fromTo i j =
  (*
  ** Notkun: hjalp x lst
  ** Fyrir:  x er heiltala
  **         lst er listi af heiltölum frá j upp að x
  ** Gildi:  Listinn [i;i+1;...;j-1]
  **         (Skilar ekki neinu fyrr en x er jafn j)
  *)
  let rec hjalp x lst =
    match x with
    | x when x == j -> lst
    | _             -> (hjalp (x+1) (List.append lst [x]))
  in hjalp i []
;;


(*
** Notkun: insertAt x i z
** Fyrir:  x=[x1;x2;...;xN] er listi gilda
**         af einhverju tagi 'a. z er gildi
**         af sama tagi 'a. i er heiltala,
**         0 <= i <= N, Thar sem N er lengd
**         listans x.
** Gildi:  Listinn
**           [x1;x2;...;x_i;z;x_i+1;...;xN],
**         Þ.e. listinn sem ad kemur thegar
**         gildinu z er skeytt inn i listann
**         x rett fyrir aftan i fremstu
**         gildin.
*)
let insertAt x i z =
  (*
  ** Notkun: hjalp j nytt rest
  ** Fyrir:  j er heiltala sem bendir á það
  **         verið er að skoða að hverju sinni.
  **         nytt er nýr listi
  **         rest er afgangur af lista
  ** Gildi:  Listinn [x1;x2;...;x_i;z;x_i+1;...;xN]
  **         Þ.e. listinn x með z bætt inn í
  **         staðsetningu i.
  *)
  let rec hjalp j nytt rest =
    if j == i then
      List.append nytt (List.append [z] rest)
    else match rest with
    | head::tail -> (hjalp (j + 1) (List.append nytt [head]) tail)
    | []         -> raise (Invalid_argument "attempt to take tail of empty list")
  in hjalp 0 [] x
;;

(*
** Notkun: extendPermutation n z
** Fyrir:  n >= 0 er heiltala.
**         z er einhver umröðun listans [1;2;...;n-1].
** Gildi:  Listi allra þeirra lista sem út koma þegar
**         tölunni n er skeytt inn í listann z á
**         einhverjum stað, allt frá byrjun til enda.
** Aths.:  Þetta er "one-liner" ef við áttum okkur á
**         hvernig nota megi map og fromTo til að leysa
**         verkefnið.
*)
let extendPermutation n z =
  List.map (fun i -> (insertAt z i n)) (fromTo 0 n)
;;

(*
** Notkun: length x
** Fyrir:  x=[x1;x2;...;xN] er listi.
** Gildi:  N.
** Aths.:  Þetta skal útfæra sem "one-liner" með hjálp
**         fallsins it_list.
*)
let length x =
  List.fold_left (fun acc x -> acc + 1) 0 x
;;


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



(*
** Notkun: permutations n
** Fyrir:  n>=0 er heiltala.
** Gildi:  Listi allra umraðana listans [1;2;...;n].
*)
let rec permutations n =
    if n==0 then
        [[]]
    else
        mapreduce
            (extendPermutation n)
            List.append
            (permutations (n-1))
            []
;;
