# Git

Git is een gedistribueerd versiebeheersysteem dat bestaat uit een verzameling aan utilities die ervoor zorgen dat men eenvoudig code in een repository kan onderbrengen en beheren. Hiermee kunnen alle wijzigingen aan de code geregistreerd worden, waardoor er een soort logboek ontstaat dat een overzicht van codewijzigingen aan het project biedt. Zo kan men kleine aanpassingen beschrijven, kijken naar het verloop van het project, terugvallen op oudere versies van de code, etc. Één van de grote voordelen van Git is dat het gedistribueerd is, d.w.z. dat iedereen van een bestaande repository een volledig opzichzelfstaande kopie kan maken. Dit is ontzettend handig, omdat er dan lokaal wijzigingen aangebracht, getest en uiteindelijk weer met de oorspronkelijke code samengevoegd kunnen worden. Voor kleinere projecten gebeurt dat samenvoegen vrijwel direct, terwijl de codewijzigingen voor Linux bv. veelal via mailing lists gaat, zodat de patches ook gecontrolleerd en bekritiseerd kunnen worden. Daarom dat Git ook utilities heeft om bv. een patch op te stellen, en die klaar te maken om als een e-mail te versturen.

## Installatie

### Debian/Ubuntu

```
sudo apt-get install git
```

### macOS

Git wordt standaard met de command line tools meegeleverd. Mocht je een nieuwere versie willen, dan kun je die installeren m.b.v. MacPorts:

```
sudo port install git
```

### Arch Linux

```
pacman -S git
```

### Fedora

```
sudo yum install git
```

### Gentoo

Installeer [dev-vcs/git](http://packages.gentoo.org/package/dev-vcs/git).

### openSUSE
```
sudo zypper install git
```

## Documentatie

* [Officiële documentatie voor Git](http://git-scm.com/documentation).
