# Veelvoorkomende problemen

## Acer laptops secure boot
Secure boot kun je niet uitzetten als je geen wachtwoord op de BIOS hebt staan

## HP laptops (met realtek)
EEprom: hier staat in dat de antenne op ne
Handmatig in modprobe ding toevoegen in de driver dat antenne 2 gebruikt moet worden in plaats van antenne 1 https://askubuntu.com/questions/635625/how-do-i-get-a-realtek-rtl8723be-wireless-card-to-work

## EFI boot volgorde
Bij sommmige laptops kun je EFI volgorde niet aanpassen
Gebruik efibootmgr om de volgorde aan te passen als dit niet werk gebruik de fix-hp / fix-uefi scrips.

Windows bootloader gehardcodet in UEFI.
FixHPGrub FixUEFIGrub (in wiki)
(kan problemen opleveren bij windows update)

## Synaptics-touchpad werkt matig / hapert
Paradoxaal kan het verwijderen van de `xserver-xorg-input-synaptics`-package voor verbetering zorgen; de nieuwere `libinput`-driver wordt dan gebruikt.

## RTL8821CE
Er is een DKMS-driver beschikbaar (`rtl8821ce-dkms`). Deze is beschikbaar op USB bij de BYOD-dag.

*De informatie hieronder is niet relevant als de Ubuntu-package `rtl8821ce-dkms` geïnstalleerd wordt; deze blacklist `rtw88_8821ce` automatisch.*

Kernel >=5.9 bevat een kapotte rtw88-module die slechte ondersteuning voor de 8821ce biedt; deze moet geblacklist worden in `/etc/modprobe.d/blacklist.conf`:
```
blacklist rtw88_8821ce
```

Zet de laptop uit en weer aan, als het goed is wordt dan de rtl8821ce-driver geladen.

## Intel RST / Disk in RAID-modus / Linux ziet de disk niet

!!! warning "Inloggen in safe mode"
    In *safe mode* moet ingelogd worden zonder Windows Hello, dus men moet het wachtwoord van hun Microsoft-account (of lokaal account, als ze dat hebben) kennen!

* Start windows op en open een opdrachtprompt (cmd) als administrator
* Voer `bcdedit /set {current} safeboot minimal` uit
* Reboot naar de UEFI-instellingen. Verander hier de modus van RAID naar AHCI (als de optie hiervoor onzichtbaar is, kan het nodig zijn om Ctrl-S in te drukken terwijl de ''main tab'' van de bios setup zichtbaar is. Dit is vaak zo bij Acer.).
* Boot Windows weer, start weer een opdrachtprompt op als administrator en voer het volgende uit `bcdedit /deletevalue {current} safeboot`
* Nu zou de Linux-installer de disk wel moeten herkennen.

## Bitlocker staat aan
Zie [het artikel over BitLocker](./bitlocker.md).

## Grub start niet op (systeem boot direct naar windows)

### Bootloader volgorde aanpassen

Dit doe je in de UEFI firmware settings. Hier kom je door in Windows te shift-klikken op `Restart` in het power menu. Vervolgens ga je naar Troubleshoot > Advanced > UEFI Firmware Settings > Restart. Vervolgens vind je waarschijnlijk ergens een 'Boot' tab waar je een lijst van bootloaders zit, zoals `Windows Boot Manager` en als het goed is iets anders zoals `ubuntu`. Zorg dat `Windows Boot Manager` onderaan staat.

### Alleen Windows Boot Manager?

Heb je Ubuntu wel geinstalleerd? Als je vanaf de USB opstart en op 'Try Ubuntu' klikt beland je in een live omgeving die er identiek uit ziet als de echte installatie, maar er is niks geinstalleerd.

Geavanceerd: kijk of je zelf handmatig een path kan toevoegen. Als dit niet mogelijk is kijk of je <code>efibootmgr</code> op de live usb stick kan gebruiken om de boot volgorde aan te passen.

## Boot niet met Nvidia GPU
Booten met `nomodeset` als kernel argument en switchen naar de Nvidia driver ipv open source driver:

* Tijdens het opstarten in GRUB waar de <code>Ubuntu</code> entry geselecteerd staat, druk op <code>e</code>.
* Navigeer met pijltjestoetsen naar de regel <code>GRUB_CMDLINE_LINUX_DEFAULT</code> en voeg <code>nomodeset</code> toe aan de lijst van kernel parameters. Dit wordt dus bijvoorbeeld <code>GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nomodeset"</code>
* Als Ubuntu opgestart is, open een terminal (Ctrl+Alt+T) en typ `apt list 'nvidia-driver-*'`
* Kies de hoogste nvidia driver versie en installeer deze, bijvoorbeeld `sudo apt install nvidia-driver-470`
* Start opnieuw op

## Flickering met AMD GPU tijdens installer
Reboot en kies Ubuntu (safe graphics) in GRUB.

## Atheros wifi kaart werk niet
* Check dmesg of his zoekt naar bepaalde firmware blobs
* Bestaan deze niet kan deze gedownload worden van https://github.com/kvalo/ath10k-firmware

## Screen rotation
* Makkelijkst is om gewoon de iio-sensor-proxy service uit te zetten via systemctl.
* Some asus flip books have a motion sensor to rotate the display, this is off by 90 degrees.
* See https://gitlab.freedesktop.org/hadess/iio-sensor-proxy/#accelerometer-orientation to add the current orientation in the config file and reboot.
* Waardes zijn een 3x3 rotatie matrix die de gegevens mappen naar de daadwerkelijke scherm positie, als 1 as verkeer is -1, is het scherm gedraaid, x en y omdraaien, etc.

`xrandr --output $(xrandr | grep -w connected | cut -f1 -d' ') --rotate normal`

## Toetsenbord werkt niet
Bij de yoga slim 7 pro 14IHU5 werkte het volgende:

* `i8042.direct i8042.dumbkbd` kernel parameters toevoegen aan `GRUB_CMDLINE_LINUX_DEFAULT` in `/etc/default/grub` daarna `sudo update-grub`

## Beeldscherm flikkered

Mogelijk dat de PSR van het panel stuk is, boot met (intel cpus) i915.enable_psr=0 om te kijken of PSR het issue is.

## Native Command Queueing (NCQ)

Native Command Queuing (NCQ) is een techniek die de lees- en schrijfcommando's van en naar de hardeschijf optimaliseert. Er zijn echter SSD's die dit niet ondersteunen en waar Linux toch deze techniek probeert toe te passen. Je merkt vrijwel meteen wanneer dit het geval is: Ubuntu zal bevriezen tijdens het opstarten, zowel bij de live-cd als na een installatie op de harde schijf.

### Eenmalig uitschakelen

Om NCQ eenmalig uit te schakelen, bijvoorbeeld om de live-cd op te starten of om te booten
zodat een definitieve uitschakeling kan worden volbracht, volg de volgende stappen:

* Toets 'e' in als het GRUB opstartmenu zich toont, er opent zich een editor.
* Voeg aan `GRUB_CMDLINE_LINUX_DEFAULT` het volgende toe: "libata.force=noncq".
* Druk op F10 om Linux op te starten.

### Permanent uitschakelen

Verander nu hetzelfde in `/etc/default/grub` en voer `sudo update-grub` uit om de wijzigingen door te voeren.
