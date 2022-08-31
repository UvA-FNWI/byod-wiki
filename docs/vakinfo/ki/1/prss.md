# Problem Solving and Search

Voor het vak Problem Solving and Search moet je de tijdens het vak het volgende geïnstalleerd hebben.

## Benodigde Software

* Prolog (swi-prolog 7)
* Tekst-editor (docent koos voor emacs)

## Installatie

### Debian/Ubuntu

```
sudo apt install swi-prolog emacs emacs-goodies-extra-el
```

### Arch Linux

```
sudo pacman -S swi-prolog
```

### Gentoo

Installeer [dev-lang/swi-prolog](http://packages.gentoo.org/package/dev-lang/swi-prolog).

### macOS

```
Installeer prolog met homebrew:
```
brew install swi-prolog
```

### openSUSE
```
sudo zypper in swipl
```

## Controle

Als het goed is zouden de volgende commando's beschikbaar moeten zijn: `swipl`.
De resultaten kunnen afwijken maar zouden soortgelijk moeten zijn.

```
$ swipl -v
SWI-Prolog version 6.6.6 for x86_64-linux

$ emacs --version
GNU Emacs 24.3.1
Copyright (C) 2013 Free Software Foundation, Inc.
GNU Emacs comes with ABSOLUTELY NO WARRANTY.
You may redistribute copies of Emacs
under the terms of the GNU General Public License.
For more information about these matters, see the file named COPYING.
```
