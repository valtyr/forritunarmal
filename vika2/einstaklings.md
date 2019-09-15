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
- '\newcommand{\hwnum}{2}'
- '\newcommand{\hwclass}{TÖL304G}'
- '\newcommand{\hwlecture}{}'
- '\newcommand{\hwsection}{}'
---

\maketitle

# Dæmi {-}

Permalink á lausn: [https://rise4fun.com/Dafny/tRrK](https://rise4fun.com/Dafny/tRrK)

_Lausn:_
```dafny
// Exercise in TÖL304G

// Write your name and university email address here:
// Valtýr Örn Kjartansson vok4@hi.is

// Finish the following so that Dafny accepts
// it by adding some program text where indicated.
// Make no other changes.

function SumInts( k: int ): int
  requires k >= 0;
{
  if k==0 then
    0
  else
    SumInts(k-1)+k
}


method ComputeSumIntsLoop( k: int ) returns ( r: int )
  requires k >= 0;
  ensures r == (k+1)*k/2;
  ensures r == SumInts(k);
{
  r := 0;
  var i := 0;
  while i != k
    decreases k - i;
    invariant 0 <= i <= k;
    invariant r == (i+1)*i/2;  
    invariant r == SumInts(i);
  {
    i := i + 1;
    r := r + i;
  }
}

method ComputeSumIntsRecursive( k: int ) returns ( r: int )
  requires k >= 0;
  ensures r == (k+1)*k/2;
  ensures r == SumInts(k);
  decreases k;
{
  if k==0
  {
    r := 0;
    return;
  }
  r := ComputeSumIntsRecursive(k-1);
  r := r + k;
}

method ComputeSumIntsTailRecursive( k: int, i: int, q: int ) returns ( r: int )
  requires 0 <= i <= k;
  requires q == (i+1)*i/2;
  requires q == SumInts(i);
  ensures r == (k+1)*k/2;
  ensures r == SumInts(k);
  decreases k-i;
{
  if i==k
  {
    r := q;
    return;
  }
  r := ComputeSumIntsTailRecursive(k, i+1, q + i + 1);
}
```

