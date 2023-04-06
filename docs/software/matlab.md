# Matlab

!!! warning "Installeer niet binnen OneDrive"
    In sommige gevallen kiest de Matlab installer standaard voor een locatie binnen OneDrive. Als dit het geval is, pas het pad in de installer aan naar `C:\Program Files\Matlab`.

Voor Matlab biedt de Universiteit van Amsterdam je een licentie. De instructies voor het verkrijgen van een Matlab licentie zijn te vinden op de [DataNose software pagina](https://datanose.nl/#byod) (inlog vereist).

## Valkuilen

### Bij het starten van Matlab, een probleem met verbinden met de Matlab servers.

Heb je wel een werkende internetverbinding?

### Per ongeluk Matlab geïnstalleerd naar OneDrive

1. Stop alle Matlab processen via Task Manager.
2. Verwijder Matlab bestanden. Dit duurt heel erg lang (mogelijk uren). De voortgang kan je bijhouden door in Task Manager de CPU-usage van Explorer in de gaten te houden. Ondertussen kan je al naar stap 3.
3. Installeer Matlab opnieuw, dit keer op de juiste plek

### Error "The Tag Present in the Reparse Point Buffer Is Invalid"

Als je per ongeluk Matlab hebt geinstalleerd naar OneDrive en vervolgens de bestanden probeert te verwijderen, kun je deze error zien. Open een command prompt, navigeer naar de locatie van de onedrive executable (ergens in program files?) en voer uit: `onedrive.exe /reset`

### Error "std::exception: fl:filesystem:SystemError"

Herinstaller Matlab, let op dat je niet naar OneDrive installeert!
