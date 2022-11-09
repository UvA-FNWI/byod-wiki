# UvA VPN

Door middel van UvAvpn is het mogelijk om vanaf thuis een verbinding te maken met het netwerk van de UvA. Zo kun je bijvoorbeeld vanaf thuis inloggen op servers die alleen toegankelijk zijn vanaf het UvA-netwerk (bijvoorbeeld het DAS5-cluster).

## Optie 1: Via NetworkManager

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

### Kubuntu

Hetzelfde als hierboven maar `network-manager-openconnect` i.p.v. `network-manager-openconnect-gnome`.

### Overige
Er kan gebruik worden gemaakt van [openconnect](http://www.infradead.org/openconnect/index.html), voor meer informatie zie [Arch Wiki](https://wiki.archlinux.org/index.php/OpenConnect)

De tl;dr-versie is: gebruik `sudo openconnect --protocol=nc vpn.uva.nl` en log in met je studentnummer en wachtwoord. Als het goed is ben je dan met de VPN verbonden.

## Optie 2: Split-tunnel VPN

Al je internetverkeer via de VPN sturen kost veel bandbreedte voor de UvA en geeft jou ook een suboptimale internetervaring; de latency wordt waarschijnlijk te hoog om te kunnen gamen of videobellen. Door VPN-slice te gebruiken kunnen we alleen verkeer voor specifieke addressen door de VPN sturen.

Installatie:
```
sudo apt install openconnect
sudo pip3 install "vpn-slice[dnspython,setproctitle]"
```

Vervolgens:
```
sudo openconnect --protocol=nc vpn.uva.nl -s 'vpn-slice 130.37.0.0/16'
```

In dit voorbeeld gebruiken we `130.37.0.0/16` omdat de DAS5 servers in dit subnet zitten.