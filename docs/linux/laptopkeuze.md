# Laptopkeuze

Voor de opleiding dient je laptop Linux te ondersteunen. Dit is vrijwel altijd zo, maar voor sommige hardware kan het moelijker zijn. Hieronder staan een aantal punten beschreven waar je op kunt letten.

## Opslagruimte

Voor dual-boot (Linux installeren naast Windows) wordt je opslagruimte verdeeld tussen de twee, dus het is handig om een laptop uit te zoeken met tenminste 250GB aan opslag.

## Resolutie

Resoluties hoger dan 1920x1080 hebben scaling nodig zodat tekst niet te klein wordt. Niet alle applicaties ondersteunen scaling, vooral niet *fractional scaling* (tussen 1x-2x). Om deze reden kan je het beste schermen met hoge resoluties vermijden.

## Videokaarten

Videokaarten met hoge prestaties zijn **niet nodig** voor de opleiding. Betaal alleen meer voor een laptop met luxe videokaart als je dat zelf nodig hebt.

### Intel HD graphics / Arc

Intel graphics worden goed ondersteund binnen Linux.

### AMD

AMD videokaarten worden goed ondersteund binnen Linux.

### NVIDIA

Koop liever een laptop zonder een NVIDIA videokaart, tenzij je zelf graag wil gamen met de Nvidia kaart Windows. Hieronder volgt een uitgebreide uitleg.

Linux heeft wel een ingebouwde driver voor NVIDIA videokaarten (`nouveau`) maar deze is niet zo goed als de proprietary driver van NVIDIA zelf, die handmatig geïnstalleerd moet worden. Zelfs met de proprietary driver kan Linux niet automatisch de videokaart uitschakelen wanneer deze niet nodig is (dat kan Windows wel). Doordat de videokaart altijd aan staat zal je laptop een aanzienlijk kortere batterijduur hebben en eerder de ventilatoren laten draaien. Het volledig aan- of uitzetten van de videokaart heeft een reboot nodig. Als je je laptop niet gebruikt voor grafische taken, zal je in de praktijk je videokaart altijd uitegschakeld hebben. Dan is het zonde om ervoor te betalen. Een videokaart is alleen handig als je echt van plan bent om naast de studie ook je laptop te gebruiken om te gamen.

## WiFi

Tegenwoordig zijn vrijwel alle WiFi-chipsets werkend te krijgen, maar chipsets van Intel werken het beste (in tegenstelling tot Realtek en Broadcom).

## Vingerafdrukscanners

De meeste vingerafdrukscanners werken niet in Linux. Je kan [hier](https://fprint.freedesktop.org/supported-devices.html) een lijst vinden van alle modellen die ondersteund worden, maar vaak is informatie over welke scanner in een laptop gebruikt wordt moeilijk of niet te vinden. Een vingerafdrukscanner is niet essentieel, dus hier hoef je je geen zorgen om te maken.
