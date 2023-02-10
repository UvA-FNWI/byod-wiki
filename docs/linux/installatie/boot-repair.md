# Opstartproblemen

## Laptop start op naar Windows in plaats van grub

### Boot volgorde aanpassen
Pas je de boot volgorde aan in UEFI firmware settings, zodat grub/ubuntu bovenaan staat.

### Boot volgorde aanpassen (via `efibootmgr`)
Mocht dat niet mogelijk zijn bij jouw model laptop, kun je het proberen met de `efibootmgr` tool (vanaf live USB).

### Geen GRUB boot entry

Probeer handmatig een boot entry toe te voegen met `efibootmgr`:
```
efibootmgr -c -L "Grub" -l '\EFI\Grub\grubx64.efi'
```

### Custom boot entry werkt ook niet

Sommige laptops kunnen helemaal niet booten van EFI bestanden behalve `\EFI\Microsoft\Boot\bootmgfw.efi`. De enige workaround is dan om de grub file te verplaatsen naar bootmgfw.efi, alsof het Windows is. Gebruik (op eigen risico) [dit script](https://github.com/UvA-FNWI/byod-scripts/blob/master/fix-grub-uefi.sh) om het makkelijk te doen. Het gaat wel weer stuk bij grote Windows updates, wanneer Windows de EFI file weer vervangt.

## Windows EFI bestanden genereren

Het kan gebeuren dat je per ongeluk je EFI partitie of bestanden erop verwijderd. Met de `bcdboot` command kun je ze opnieuw genereren.

Boot naar een Windows USB en open een command prompt. Dit kan via het recovery menu of met Shift+F10.

Open `diskpart`. Controleer (met `list vol`) of alle nodige partities een letter hebben, en onthoud de letters voor de Windows partitie en EFI boot partitie. Als je geen EFI partitie hebt, maak er dan nu eentje aan (FAT32 partitie met partition type `C12A7328-F81F-11D2-BA4B-00A0C93EC93B`). Het is erg belangrijk dat de partitie deze GUID heeft! Zonder de GUID kan je wel booten maar werken dingen als advanced startup niet.

Voer het volgende command uit, waarbij je `C:` vervangt met de letter van de Windows partitie, en `E:` met de letter van de EFI boot partitie.
```
bcdboot C:\Windows /s E: /f UEFI /v
```

Repareer voor de zekerheid ook de BCD volgens de instructies hieronder.

## Windows BCD repareren
Na het vergroten, verkleinen of verplaatsen van de Windows partitie kan het zijn dat Windows niet meer opstart. Om dit te fixen kan je de BCD (boot configuration database) opnieuw genereren.

Boot naar een Windows USB en open een command prompt. Dit kan via het recovery menu of met Shift+F10.

```
bootrec /fixboot
bootrec /rebuildbcd
```

## Fix Windows boot (legacy boot)

Zoals hierboven maar met `bootrec /fixmbr` ipv `bcdboot`. Maar misschien wil je de Windows installatie wel converteren naar UEFI met `mbr2gpt`? Of opnieuw installeren als de installatie niet belangrijk is? EFI is een stuk makkelijker om mee te werken.

## Linux boot reparatie

Deze instructies werken ook voor het omzetten van legacy boot naar EFI boot. Dan moet je wel zelf de ESP (EFI System Partition) maken, met bijvoorbeeld `gparted` of `fdisk`.


1. Boot een live USB.
2. Mount de root partitie in `/mnt`
3. Mount de EFI partitie in `/mnt/boot/efi` (als deze map niet bestaat heb je iets fout gedaan, of je systeem is niet EFI)
4. Bind-mount een aantal filesystems: `for i in /dev /dev/pts /proc /sys /run /sys/firmware/efi/efivars; do mount -B $i /mnt$i; done`
5. Chroot: `chroot /mnt`. Nu zit je "in" je normale besturingssysteem.
6. Voor de zekerheid: `apt install grub-efi shim-signed` en `apt remove grub-pc`
7. Genereer initramfs bestanden: `update-initramfs -u -k all`
8. Installeer grub: `grub-install`
9. Ter controle: `update-grub` (hier zie je als het goed is al je initramfs bestanden langskomen, en eventueel Windows via os-prober)
