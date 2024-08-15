# eduVPN

[eduVPN](https://www.eduvpn.org/) is een open source VPN oplossing. Het is te gebruiken via een eigen applicatie, of door handmatig een profielconfiguratie te importeren.

## Applicatie

Installatieinstructies voor Linux zijn [hier](https://docs.eduvpn.org/client/linux/) te vinden.

Voor Ubuntu en Debian komt het neer op het volgende:

```
sudo apt install apt-transport-https wget
wget -O- https://app.eduvpn.org/linux/v4/deb/app+linux@eduvpn.org.asc | gpg --dearmor | sudo tee /usr/share/keyrings/eduvpn-v4.gpg >/dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/eduvpn-v4.gpg] https://app.eduvpn.org/linux/v4/deb/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/eduvpn-v4.list
sudo apt update
sudo apt install eduvpn-client
```

Na het uitvoeren van deze commando's in een terminal is de 'eduVPN' applicatie beschikbaar via het applicatie-menu.

## Handmatig

De handmatige configuratie kan de voorkeur hebben als je geen extra software kan of wil installeren. Let wel op dat je zelf eens in de drie maanden de configuratie opnieuw moet importeren.

Ga naar [uva.eduvpn.nl](https://uva.eduvpn.nl). Na in te loggen, selecteer het "WireGuard" profiel. Kopieer de gegenereerde configuratie en sla het op in een bestand met de `.conf` extensie. Vervolgens kan je in VPN instellingen dit bestand importeren als VPN configuratie.
