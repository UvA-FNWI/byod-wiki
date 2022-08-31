# Architectuur en Computerorganisatie

## Benodigde Software
* Java
* GNU Bison
* SIM-PL

## Installatie

### Debian/Ubuntu
```
sudo add-apt-repository ppa:uva-informatica/sim-pl
sudo apt update
sudo apt install sim-pl
sudo apt install bison
sudo apt install openjdk-8-jdk
```

### Arch Linux
```
sudo pacman -S bison
```

### Fedora
```
sudo yum install bison
```

### Gentoo
Installeer [dev-java/oracle-jre-bin](http://packages.gentoo.org/package/dev-java/oracle-jre-bin) en [sys-devel/bison](http://packages.gentoo.org/package/sys-devel/bison).

### macOS

Voor homebrew:
```
sudo brew install bison
```

### openSUSE
```
sudo zypper install bison
```

## Controle
```
$ java -version
java version "1.8.0_20"
Java(TM) SE Runtime Environment (build 1.8.0_20-b26)
Java HotSpot(TM) 64-Bit Server VM (build 25.20-b23, mixed mode)

$ bison --version
bison (GNU Bison) 2.4.3
Written by Robert Corbett and Richard Stallman.

Copyright (C) 2010 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```
