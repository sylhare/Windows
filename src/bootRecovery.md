Virtualisation
Error: VT-x is disabled in the BIOS for all CPU modes (VERR_VMX_MSR_ALL_VMX_DISABLED)

BIOS (F10 at boot)
Device configuration
Virtualisation technology (VTx)

Disk Manager:

chkdsk (to check the disk)
chkdsk F: /f (to check if the disk is ok or not)
help chkdsk for information

To repair a disk (non allocated memory on a disk)

1. diskpart

2. list disk

3. select disk x (x varie selon le N° correspondant a ta clé usb)

4. clean

5. create partition primary

6. active

7. format fs=fat32 quick

8. assign

Maintenant redémarre. 



--------------------------------------------------------------------------------------------------------------

https://superuser.com/questions/628038/boot-bcd-status-0xc000000f-error

Creating a bootable USB

If you have good internet connection, then you can download your windows 7 version here (you still need a legit key of course).
Then you can use Microsoft own tool to make a bootable windows 7 USB.

    Start up Windows 7 USB/DVD download tool when you have downloaded and installed it
    Select the iso file you downloaded in the Source field and click Next
    Insert your USB drive which you want to use (4GB is enough)
    Select USB DEVICE and click Next
    Select the USB device you want to use and click BEGIN COPYING

When it is done, you should have a working bootable Windows 7 USB

The same steps are used for creating a DVD, just select DVD instead of USB device.

---

https://superuser.com/questions/628038/boot-bcd-status-0xc000000f-error


I had this exact same problem and I did what most people did which was google for an answer and hope for the best. The win 7 install disk has a repair computer option that allows some automatic startup failure fixes to be implemented. Sometimes this does work, but this time it didn't. Think like a computer had a blog post that ended up being the saving grace.

But to make a long story short, here is what I did after I got the 'windows failed to start' error:

    boot from win 7 DVD or usb stick, preferably with the same version and type of windows you have on the target boot drive. For usb stick, use usb 2.0 port (3.0 may cause unexpected errors)
    After picking the language, select 'Repair your computer' (do not install win7!)
    Select 'use recovery tools that can help fix problems starting Windows...'
    Select 'Command Prompt' (CMD) to launch CMD with admin privileges.

    type “diskpart” (without quotes) and press enter to launch DISKPART utility:
        type “list disk” to get a list of physical disks installed. Identify which disk has windows boot partition.
        type select disk 0 where 0 = disk # with Win7 boot partition
        type list partition. Win 7 has a 100 or 200MB boot partition size and is primary.
        type 'select partition 1` where 1 = the boot partition #
        type detail partition and check to see if the partition is active. If active, go to next step.
            to make boot partition active, type active and when CMD reports the partition is active, restart the computer into recovery/repair mode (win7 install disk again) and return to CMD prompt.
        type exit to exit out of DISKPART utility

    type c: to get to the boot partition drive's root folder. (c: is the drive letter of boot partition
    type bootrec /fixmbr. Should get 'The operation completed successfully' message.
    type bootrec /fixboot. Should get 'The operation completed successfully' or 'element not found' message.
    Restart the computer back into recovery mode/repair mode and load CMD prompt.
        Switch to your boot partition directory if you are not already there (usually c:)
    type bcdboot c:\Windows where 'c:\Windows' is the exact path to your windows folder. Keep in mind that in recovery mode, the path of the boot partition and path to windows may be different. In my case it was **e:**\Windows.
        If you get an error 'Failure when attempting to copy boot files' or suspect you may have an EFI system partition, try typing bcdboot c:\Windows /s c: /l en-us
    Restart computer (remove startup disks). Windows 7 should load normally.

---
https://superuser.com/questions/891804/bootmgr-is-missing-how-to-replace-windows-7-embedded-boot-files-after-applying


Validate and Fix the File System

This runs the check disk program to detect and attempt to repair problems on one partition. For example, to repair the C: drive:

At the prompt type: chkdsk c: /r /f

Repair the Boot Process

Typically this is used if Windows doesn't start and you can't get to the safe mode menu. You might also replace the Master Boot Record (MBR) and boot sector if you suspect a virus infection. There are four options:

New MBR - Insert a new generic MBR without changing the partition table.

At the prompt, type: bootrec /FixMbr

New Boot Sector - Insert a new Windows 7/Vista compatible boot sector. It will automatically insert the right type of sector for the file system type (NTFS, FAT32, etc.)

At the prompt, type: bootrec /FixBoot

Rebuild BCD - Rebuild the Boot Configuration Data (BCD). The BCD controls which partition boots. This option will let you select which installations to include in the BCD.

At the prompt, type: bootrec /RebuildBcd

Find OSes - Scan the system for all OS installations that are compatible with Vista/2008 and will also show those that are currently included in the BCD.

At the prompt, type: bootrec /ScanOs

in the end type: C:/expand bootmgr temp

create a new bcd file

bcdboot d:\windows /s c:

---
https://doc.ubuntu-fr.org/comment_recuperer_windows_apres_installation_ubuntu#
recuperation_de_windows_7


repair the mbr file

bootsect /nt60 all /mbr
