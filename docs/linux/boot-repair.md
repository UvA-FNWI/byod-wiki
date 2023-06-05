# Opstartproblemen

Deze pagina gaat over het repareren van opstartbestanden van bestaande besturingssystemen. Bijvoorbeeld, als het stuk gaat na een update of na het per ongeluk verwijderen van de EFI system partition.

## Laptop start op naar Windows in plaats van grub

Pas je de boot volgorde aan in UEFI firmware settings, zodat Grub/Ubuntu bovenaan staat.

In plaats van binnen UEFI firmware settings kan je het ook binnen (Live) Linux doen, met `efibootmgr`. Run eerst `efibootmgr` om te zien welke opties er zijn. Bijvoorbeeld, Boot0004 voor Ubuntu en Boot0003 voor Windows. Vervolgens kan je de boot volgorde instellen met `efibootmgr -o 4,3`.

### Geen GRUB boot entry

Probeer handmatig een boot entry toe te voegen met `efibootmgr`:
```
efibootmgr -c -L "Grub" -l '\EFI\Grub\grubx64.efi'
```

Bestaat `\EFI\Grub\grubx64.efi` niet? Volg de instructies bij "Linux boot reparatie".

### Custom boot entry werkt ook niet

Sommige laptops kunnen helemaal niet booten van EFI bestanden behalve `\EFI\Microsoft\Boot\bootmgfw.efi`. De enige workaround is dan om de grub file te verplaatsen naar bootmgfw.efi, alsof het Windows is. Gebruik (op eigen risico) [dit script](https://github.com/UvA-FNWI/byod-scripts/blob/master/fix-grub-uefi.sh) om het makkelijk te doen. Het gaat wel weer stuk bij grote Windows updates, wanneer Windows de EFI file weer vervangt.

## Fix Windows boot (UEFI)

Het kan gebeuren dat je per ongeluk je EFI partitie of bestanden erop verwijderd. Met het `bcdboot` commando kun je ze opnieuw genereren. Deze instructies kunnen ook helpen als Windows niet meer opstart na het verplaatsen, vergoten, of verkleinen van `C:`.

Als je nog geen EFI System Partition (ESP) hebt, maak er dan eerst een aan. Bijvoorbeeld, met gparted op een live USB. Je hebt niet veel ruimte nodig, met 512MB heb je sowieso genoeg. De partitie moet een FAT32 filesystem bevatten. Na het maken van de partitie, klik met de rechtermuisknop op de partitie en kies voor "Manage flags". Zet vervolgens "esp" aan.

Mocht je al een ESP hebben, is het alsnog een goed idee om het type te verifiëren. Dit kan bijvoorbeeld binnen Linux met fdisk. `sudo fdisk /dev/<disk>` en vervolgens `i`. **Je EFI System Partition hoort een Type-UUID van `C12A7328-F81F-11D2-BA4B-00A0C93EC93B` te hebben**. Mocht het niet zo zijn, kan je het type veranderen met `t`. Als je ESP het verkeerde type heeft zal Windows grotendeels lijken te werken, maar functies zoals slaapstand, opstartopties, en windows update werken mogelijk niet goed.

Boot naar een Windows USB en open een command prompt. Dit kan via het recovery menu of met Shift+F10.

Open `diskpart`. Controleer (met `list vol`) of alle nodige partities een letter hebben, en onthoud de letters voor de Windows partitie en EFI boot partitie.

Voer het volgende command uit, waarbij je `C:` vervangt met de letter van de Windows partitie, en `E:` met de letter van de EFI boot partitie.
```
bcdboot C:\Windows /s E: /f UEFI /v
```

Repareer ook de BCD:

```
bootrec /fixboot
bootrec /rebuildbcd
```

## Fix Windows boot (legacy boot)

Zoals hierboven maar met `bootrec /fixmbr` ipv `bcdboot`. Maar misschien wil je de Windows installatie wel converteren naar UEFI met `mbr2gpt`? Of opnieuw installeren als de installatie niet belangrijk is? EFI is een stuk makkelijker om mee te werken.

## Debian, Ubuntu boot reparatie (UEFI)

Deze instructies werken ook voor het omzetten van legacy boot naar EFI boot. Dan moet je wel zelf de ESP (EFI System Partition) maken, met bijvoorbeeld `gparted` of `fdisk`.

1. Boot een live USB, en open een terminal. Verkrijg een root shell (`sudo -i`).
2. Mount de root partitie: `mount /dev/<part> /mnt`. Je kan de juiste partitie vinden met `lsblk -f`, zoek voor een ext4 filesystem met de juiste grootte. Of volg anders de speciale instructies voor LUKS/LVM/btrfs.
3. Mount de EFI partitie in `/mnt/boot/efi` (als deze map niet bestaat heb je iets fout gedaan, of je systeem gebruikt legacy boot). De EFI partitie kan je ook vinden met `lsblk -f`, zoek dit keer voor een kleine vfat/fat32 filesystem (vaak 50-500 MB).
4. Bind-mount een aantal filesystems: `for i in /dev /dev/pts /proc /sys /run /sys/firmware/efi/efivars; do mount -B $i /mnt$i; done`
5. Chroot: `chroot /mnt`. Nu zit je "in" je normale besturingssysteem, in plaats van het live besturingssysteem.
6. Voor de zekerheid, controleer dat grub geïnstalleerd is: `apt install grub-efi shim-signed`. En niet de legacy grub: `apt remove grub-pc`
7. Installeer grub naar `/boot/efi` met: `grub-install`
8. Voor de zekerheid, genereer initramfs bestanden: `update-initramfs -u -k all`
9. Ter controle: `update-grub` (hier zie je als het goed is al je initramfs bestanden langskomen, en eventueel Windows via os-prober)

## Fedora boot reparatie (UEFI)

Deze instructies werken ook voor het omzetten van legacy boot naar EFI boot. Dan moet je wel zelf de ESP (EFI System Partition) maken, met bijvoorbeeld `gparted` of `fdisk`.

Hier gaan we uit van een ext4 root partitie. Brtfs heeft misschien andere commands nodig voor het eerste gedeelte?

1. Boot een live USB, en open een terminal. Verkrijg een root shell (`sudo -i`).
2. Mount de root partitie: `mount /dev/<part> /mnt`. Je kan de juiste partitie vinden met `lsblk -f`, zoek voor een ext4 filesystem met de juiste grootte. Of volg anders de speciale instructies voor LUKS/LVM/btrfs.
3. Mount de EFI partitie in `/mnt/boot/efi` (als deze map niet bestaat heb je iets fout gedaan, of je systeem gebruikt legacy boot). De EFI partitie kan je ook vinden met `lsblk -f`, zoek dit keer voor een kleine vfat/fat32 filesystem (vaak 50-500 MB).
4. Bind-mount een aantal filesystems: `for i in /dev /dev/pts /proc /sys /run /sys/firmware/efi/efivars; do mount -B $i /mnt$i; done`
5. Chroot: `chroot /mnt`. Nu zit je "in" je normale besturingssysteem, in plaats van het live besturingssysteem.
6. Herinstalleer grub: `dnf reinstall grub2-efi grub2-efi-modules shim`. Dit zorgt er ook meteen voor dat de nodige bestanden in `/boot/efi` worden aangemaakt. Gebruik **NIET** `grub2-install`, dat is alleen voor legacy boot.
7. Voor de zekerheid, genereer initramfs bestanden: `dracut --regenerate-all -vf`
8. Voor de zekerheid, update de grub config:
    - `grub2-mkconfig -o /etc/grub2.cfg`
    - `grub2-mkconfig -o /etc/grub2-efi.cfg`
    - `grub2-mkconfig -o /boot/grub2/grub.cfg`

Meer informatie kun je [hier](https://docs.fedoraproject.org/en-US/quick-docs/bootloading-with-grub2/#installing-grub-2-configuration-on-uefi-system) vinden.

## Boot reparatie met LUKS

Installeer de `cryptsetup` package (als het goed is al geïnstalleerd).

Open de disk:
```
cryptsetup luksOpen /dev/<disk> <name>`
```
Na dit commando heb je als het goed is een 'virtuele disk' in `/dev/mapper`.

De naam (`<name>`) moet je zelf aangeven, **LET OP** dat je dezelfde naam gebruikt als je systeem heeft in `/etc/crypttab`, anders kan het volume straks niet geopend worden bij het opstarten! Als je niet zeker weet wat de naam was, kies eerst wat. Check dan na het mounten wat de naam hoort te zijn, sluit luks en open het volume opnieuw. Dus zoiets:
```
cryptsetup luksOpen /dev/<disk> temp`
mount /dev/mapper/temp /mnt
cat /mnt/etc/crypttab
umount /mnt
cryptsetup luksClose temp
# Nu met de goede naam uit crypttab
cryptsetup luksOpen /dev/<disk> <naam>
```

## Boot reparatie met LVM

1. Installeer de `lvm2` package (als het goed is al geïnstalleerd).
2. Activeer de *volume group* activeren met `vgchange -ay`.

Je volumes zijn nu te vinden in `/dev/<naam van volume group>`. Zie verder de normale chroot instructies.

## Boot reparatie met btrfs

De configuratie verschilt per distributie. Fedora heeft bijvoorbeeld een volume voor `/home` een volume voor `/`. Mount eerst de filesystem om te kijken welke volumes er zijn:
```
mount /dev/... /mnt
ls /mnt
```
Stel dat de root data in een volume genaamd `root` staat:
```
cat /mnt/root/etc/fstab
```
Nu zie je de opties die je nodig hebt. Bijvoorbeeld:
```
UUID=... /     btrfs subvol=root,compress=zstd:1,x-systemd.device-timeout=0 0 0
UUID=... /home btrfs subvol=home,compress=zstd:1,x-systemd.device-timeout=0 0 0
```
Doe dan:
```
umount /mnt
mount -t btrfs -o subvol=root,compress=zstd:1 /dev/... /mnt
mount -t btrfs -o subvol=home,compress=zstd:1 /dev/... /mnt/home
```

Vergeet niet ook `/mnt/boot` en `/mnt/boot/efi` te mounten.
