Op de Universiteit van Amsterdam en andere universiteiten en hoge scholen in Europa wordt er het Eduroam (uitgesproken: /ˌɛdjʊˈɹoʊm/ of /ˌɛdʒʊˈɹoʊm/) network beschikbaar gesteld voor studenten om te gebruiken. Het netwerk maakt gebruik van WPA2 Enterprise, wat op Linux al ondersteund wordt door wpa_supplicant. Hierdoor is het mogelijk om de authenticiteit van het Eduroam netwerk te bevestigen m.b.v. een certificaat.
Klik rechtsboven in de system tray op het icoontje voor draadloze netwerk. Klik daarna op het wifi icoontje en selecteer Select Network, Maak hier verbinding met het netwerk genaamd Eduroam.

Daarna verschijnt er een venster om de configuratie in te stellen, stel deze in als volgt:

| | |
| - | - |
Authentication | `Tunnelled TLS` of `TTLS`
Anonymous identity | `anonymous@uva.nl`
Domain | `draadloos.uva.nl`
CA certificate | `/etc/ssl/certs/USERTrust_RSA_Certification_Authority.pem` [^1]
Inner authentication | `MSCHAPv2 (no EAP)`
Username | `<student ID>@uva.nl`
Password | `<wachtwoord>`

[^1]: Select from file... > Other locations (links) > Computer > navigeer naar /etc/ssl/certs en selecteer USERTrust_RSA_Certification_Authority.pem

![WiFi instellingen Ubuntu 20.04](/assets/2004-wifi.png)
