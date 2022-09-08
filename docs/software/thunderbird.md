# Thunderbird

Thunderbird is een open source e-mailclient van Mozilla. Momenteel is het de enige e-mailclient, naast Microsoft Outlook, die bruikbaar is voor UvA e-mailaddressen.

## Installatie

Op Ubuntu is Thunderbird eenvoudig te installeren via Software Center, of via de terminal:

```
sudo apt install thunderbird
```

## Inloggen met UvA account

Druk op de knop om een nieuw account toe te voegen. Vul vervolgens je naam (`Voornaam Achternaam`) en e-mailadres (`x.achternaam@student.uva.nl`) in. Het wachtwoordveld kan je leeg laten. Druk op <kbd>Continue</kbd>.

![screenshot new email](../assets/thunderbird-new-email.png)

De voorgestelde instellingen zijn bijna juist, alleen moeten we OAuth2 in plaats van wachtwoordauthenticatie selecteren. Klik op <kbd>Configure manually</kbd> en verander tweemaal 'Normal password' naar 'OAuth2'. Nu kun je op <kbd>Done</kbd> drukken en inloggen in de popup. Let op dat je hier je studentnummer (of medewerker id) gebruikt als gebruikersnaam, niet het volledige e-mailadres.

![screenshot manual config oauth2](../assets/thunderbird-manual-config.png)
