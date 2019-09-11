## Forritunarmál (TOL304G)

[![](https://github.com/valtyr/forritunarmal/workflows/CI/badge.svg)](https://github.com/valtyr/forritunarmal/actions)

Skiladæmi fyrir áfangangann *_TOL304G_* í Háskóla Íslands.

Notast er við pandoc til að búa til PDF úr .md skjölum.

### Yfirlit
- __Vika 2__: Kynning á scheme
  - [Verkefnablað](vika2/verkefnablad.pdf)
  - [Hópverkefni](vika2/skil.pdf)

### Keyrsla á prufunarkóða
Prufunarskriftan notast við forritið [entr](http://entrproject.org) til að fylgjast með skjalabreytingum. Hægt er að setja upp entr í gegn um Homebrew og apt. Eftirfarandi skipun er keyrð til að hefja keyrslu prufana.
```bash
$ ./run-tests
```
Prófin eru keyrð upp á nýtt hvert skipti sem skjal er vistað.

### Undirbúningur PDF-skjala
PDF skjöl eru búin til úr .md skjölum með því að keyra eftirfarandi skipun:
```bash
$ docker run --rm -v $PWD:/workdir --entrypoint "/source/clean-and-build.sh" valtyr/pandoc:latest
```
