# UvA VPN

Door middel van UvA VPN is het mogelijk om vanaf thuis een verbinding te maken met het netwerk van de UvA. Zo kun je bijvoorbeeld vanaf thuis inloggen op servers die alleen toegankelijk zijn vanaf het UvA-netwerk (bijvoorbeeld het DAS5-cluster).

## Optie 1: Via NetworkManager (makkelijkst)

!!! warning "Al je verkeer gaat via de VPN"
    Als je deze methode gebruikt gaat al je internetverkeer via de VPN. Je bestaande verbindingen worden verbroken. Maak geen gebruik van bandbreedteintensieve applicaties, en doe geen dingen waarvan je niet wilt dat de UvA het weet.

Deze methode geeft je een optie binnen instellingen om gemakkelijk te verbinden. Al je internetverkeer wordt via de UvA VPN verstuurd.

### Ubuntu

```
sudo apt-get -y install network-manager-openconnect-gnome
sudo nmcli con add type vpn \
    con-name "UvA VPN" \
    ifname "*" \
    vpn-type openconnect \
    -- \
    vpn.data "gateway=vpn.uva.nl,protocol=nc"
```

!!! warning "Oude OpenConnect versies"
    De OpenConnect versie meegeleverd met Ubuntu 20.04 en ouder kan niet meer verbinden met de UvA VPN. Gelieve je systeem te [upgraden naar Ubuntu 22.04](./onderhoud.md).

### Debian-based OS met KDE

Hetzelfde als hierboven maar `network-manager-openconnect` i.p.v. `network-manager-openconnect-gnome`.

### Overige
Er kan gebruik worden gemaakt van [openconnect](http://www.infradead.org/openconnect/index.html), voor meer informatie zie [Arch Wiki](https://wiki.archlinux.org/index.php/OpenConnect)

De tl;dr-versie is: gebruik `sudo openconnect --protocol=nc vpn.uva.nl` en log in met je studentnummer en wachtwoord. Als het goed is ben je dan met de VPN verbonden.

## Optie 2: Split-tunnel VPN

Al je internetverkeer via de VPN sturen kost veel bandbreedte voor de UvA en geeft jou ook een suboptimale internetervaring; de latency wordt waarschijnlijk te hoog om te kunnen gamen of videobellen. Met [`vpn-slice`](https://github.com/dlenski/vpn-slice) is het mogelijk alleen verkeer voor specifieke addressen door de VPN sturen.

Installatie:
```
sudo apt install openconnect
sudo pip3 install "vpn-slice[dnspython,setproctitle]"
```

Vervolgens verbind je met de VPN:
```
sudo openconnect --protocol=nc vpn.uva.nl -s 'vpn-slice 130.37.199.8 83.96.0.0/16 85.10.0.0/16 145.18.107.198 145.18.12.22'
```

Dit voorbeeld omvat veelvoorkomende IP adressen. Het kan zijn dat je zelf een IP adres moet toevoegen, als je wilt verbinden met een andere dienst.

- `130.37.199.8` DAS5 voor DPP
- `83.96.0.0/16 85.10.0.0/16` Webtechnologies 2023
- `145.18.107.198 145.18.12.22` UvA-Q (`data.sap.uva.nl` en `bw.sap.uva.nl`)
