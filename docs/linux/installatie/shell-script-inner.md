## Gebruik van het script

Open allereerst een terminal: <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>T</kbd>

!!! hint "Terminaltips"
    In een terminal gebruik je niet <kbd>Ctrl</kbd>+<kbd>V</kbd>, maar <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>V</kbd>. Hetzelfde geldt voor <kbd>Ctrl</kbd>+<kbd>C</kbd>. Bij het intypen van je wachtwoord zul je geen karakters zien verschijnen. Het sudo-wachtwoord is hetzelfde als waarmee je inlogt.

### Alles installeren

Plak de volgende regel in je terminal, druk op enter en vul je wachtwoord in:
```
sh -c "$(wget -q -O - https://linux.datanose.nl/script)"
```

### Interactief

Wil je zelf kiezen wat er geïnstalleerd wordt? Dat kan handig zijn, bijvoorbeeld als je maar een aantal vakken van Informatica of KI als minor doet.

```
wget -q https://raw.githubusercontent.com/UvA-FNWI/byod-scripts/master/install-extras.sh
chmod +x install-extras.sh
./install-extras.sh optional
```


