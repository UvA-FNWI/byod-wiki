# Programmeertalen

Voor het vak Programmeertalen moet je de tijdens het vak gebruikte programmeertalen op je computer installeren.

## Benodigde Software

* Go
* Bash
* Python
* Prolog (swi-prolog 7)
* Erlang
* Haskell
* C++

## Installatie

### Debian/Ubuntu

```
sudo apt install swi-prolog erlang ghc golang haskell-platform build-essential python3
```

### Arch Linux

```
sudo pacman -S lua swi-prolog erlang haskell-platform
```

### Gentoo

Installeer:

* [dev-lang/erlang](http://packages.gentoo.org/package/dev-lang/erlang)
* [dev-lang/ghc](http://packages.gentoo.org/package/dev-lang/ghc)
* [dev-lang/go](https://packages.gentoo.org/package/dev-lang/go)
* [dev-lang/swi-prolog](http://packages.gentoo.org/package/dev-lang/swi-prolog)

### macOS

Installer go, prolog, erlang, haskell, GNU bash, GNU coreutils.

Let hierbij op dat alle gnu varianten de letter g als prefix hebben deze alias is er niet op de GNU/linux installaties.

### openSUSE
```
sudo zypper in go swipl erlang haskell-platform
```

## Controle

Als het goed is zouden de volgende commando's beschikbaar moeten zijn: `erl`, `erlc`, `ghc`, `ghci`, `lua`, `python` en `swipl`.

```
$ python --version
Python 2.7.9

$ lua -v
Lua 5.1.5  Copyright (C) 1994-2012 Lua.org, PUC-Rio

$ swipl -v
SWI-Prolog version 6.6.6 for x86_64-linux

$ ghc --version
The Glorious Glasgow Haskell Compilation System, version 7.4.1
```

Voor Erlang kun je `erl` typen als commando. Waarna je `halt().` (vergeet niet de punt aan het einde) moet typen om het programma af te sluiten:

```
$ erl
Erlang/OTP 17 [erts-6.2] [source] [async-threads:10]

Eshell V6.2  (abort with ^G)
1> halt().
```
