# Eduroam

Op de Universiteit van Amsterdam en andere universiteiten en hoge scholen in Europa wordt er het Eduroam (uitgesproken: /ˌɛdjʊˈɹoʊm/ of /ˌɛdʒʊˈɹoʊm/) network beschikbaar gesteld voor studenten om te gebruiken.

## Windows

Gebruik het tooltje op [wifiportal.uva.nl](https://wifiportal.uva.nl).

## macOS

Download het profiel van [wifiportal.uva.nl](https://wifiportal.uva.nl) en installeer deze binnen systeemvoorkeuren. Tijdens de installatie is het nodig om meerdere keren je UvA wachtwoord in te vullen. Hierna kan je verbinding maken met eduroam.

Lukt het niet? Waarschijnlijk klopt je wachtwoord niet. Probeer het opnieuw door het profiel te verwijderen (-) en opnieuw te installeren.

## Linux (Ubuntu)

Uitgebreide instructies kun je [hier](linux/eduroam.md) vinden.

## Android

Verbind met het `eduroam` netwerk in instellingen, zoals gewoonlijk.

| | |
| - | -
EAP method | PEAP
EAP inner / phase2 | MSCHAPV2
Certificate | Use system certificates
Domain | `draadloos.uva.nl`
Identity | studentnummer`@uva.nl`
Password | wachtwoord
Anonymous identity | `anonymous@uva.nl`

## Chrome OS

ChromeOS is ongeveer hetzelfde als Android, behalve dat de domein optie opgesplitst is.

| | |
| - | -
Domain name match | `draadloos.uva`
Domain alternative match | (laat dit leeg)
Domain suffix match | `nl`
