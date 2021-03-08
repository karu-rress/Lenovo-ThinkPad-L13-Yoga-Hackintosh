# L13-Yoga-OpenCore-Hackintosh

**Status: Success | Stable**

<img align="right" src="./Other/README_Resources/l13-yoga2.png" alt="X1C7 macOS" width="430">

[![OpenCore](https://img.shields.io/badge/OpenCore-0.6.7-blue.svg)](https://github.com/acidanthera/OpenCorePkg)
[![macOS-Unstable](https://img.shields.io/badge/macOS-11.2.2-brightgreen.svg)](https://www.apple.com/macos/big-sur)

**DISCLAIMER:**
As you embark on your Hackintosh journey you are encouraged to **READ** the entire README and [Dortania](https://dortania.github.io/getting-started/) guides before you start. It will save many a message instructing you to RTFM. I am not an expert, I haven't forced you to do anything, put on your big boy pants and take responsibility for any mess you get yourself into.

When you encounter bug or want to improve this repo, consider opening an issue or pull request. You can also find a wealth of knowledge on [Reddit](https://www.reddit.com/r/hackintosh/), [TonyMacX86](https://www.tonymacx86.com) or [Google](https://www.google.com).

## Introduction

<details> 
<summary><strong>This is not a guide!</strong></summary>

This is not a guide. It shoud only be used as a reference. I provide some tips and tricks I learned on my journey in building a hackintosh. The best way of using this is as a supplement to the OpenCore guide; if you have questions about how to setup your specific hardware, are unclear about what to do, or would like to see the settings I've used.

I understand that some may simply copy the EFI folder to their EFI partition. For clarity the EFI folder needs to go into the EFI partition.

```EFI
EFI (partition)
	EFI
	├── BOOT
	├── OC
```

It should work and your ThinkPad L13 Yoga should boot and work fine. You will at minimum need to generate SMBIOS values if you want Apple services to work. Note that all error reporting/logging has been turned off in the config.plist. You will have a difficult time trouble shooting with the setup provided. You can easily turn on the error reporting and logging if you follow the Dortania guide. Best of luck.

</details>  

<details> 
<summary><strong>General knowledge & credits</strong></summary>

- To install macOS follow the guides provided by [Dortania](https://dortania.github.io/OpenCore-Install-Guide/)

- Useful tools by [CorpNewt](https://github.com/corpnewt) and [headkaze](https://github.com/headkaze/Hackintool)

- [CREDITS](CREDITS.md) file

</details>  

<details>
<summary><strong>Hardware</strong></summary>
<br>

[![UEFI](https://img.shields.io/badge/UEFI-N2HET58W-lightgrey)](https://pcsupport.lenovo.com/ca/en/products/laptops-and-netbooks/thinkpad-l-series-laptops/thinkpad-l13-yoga-type-20r5-20r6/downloads/ds541927-bios-update-utility-bootable-cd-for-windows-10-64-bit-thinkpad-l13-l13-yoga) <--come back to this.

### ThinkPad L13 Yoga

| Category  | Component                                                    | Note                                                         |
| --------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Type      | 20R5, 20R6                                                   | Check this still                                             |
| CPU       | Intel Core i5-10210U                                         |                                                              |
| GPU       | Intel UHD                                                    |                                                              |
| SSD       | WD 512GB                                                     | Replaced cursed PM 981 which still doesn't work reliably     |
| Screen    | 13" FHD 1920x1080                                            | Multi touch and pen support working                          |
| Memory    | 8GB / 2666MHz DDR4                                           |                                                              |
| Battery   | Integrated Li-Polymer 46Wh                                   | Single battery                                               |
| Camera    | 720p Camera and 5MP camera                                   | Both cameras working                                         |
| Wifi & BT | Intel Wireless-AC 9560                                       | Use AirportItlwm for your macOS version and enjoy native Wi-Fi control. |
| Input     | PS2 Keyboard & **HIDC** -chekc TrackPad (touchscreen and pen) | I'm using [YogaSMC](https://github.com/zhen-zen/YogaSMC) for media keys. |

</details>  

<details>

<summary><strong>Main software</strong></summary>
<br>

| Component     | Version |
| ------------- | ------- |
| macOS Big Sur | 11.2.2  |
| OpenCore      | v0.6.7* |

NOTE: Prior to OpenCore 0.6.7 MacOS would not boot on this computer.

</details>

<details>
<summary><strong>ACPI Files</strong></summary>
<br>

| Component                   |
| --------------------------- |
| ssd_data.aml                |
| SSDT-AWAC.aml               |
| SSDT-EC-USBX-LAPTOP.aml     |
| SSDT-OCBAT1-lenovoPRO13.aml |
| SSDT-PNLF-CFL.aml           |
| SSDT-RHUB.aml               |
| SSDT-XOSI                   |

</details>

<details>
<summary><strong>Kernel extensions</strong></summary>
<br>

| Kext                   | Version |
| :--------------------- | ------- |
| AirportItlwm           | 1.2.0   |
| AppleALC               | 1.5.6   |
| CPUFriend              | 1.2.3   |
| CPUFriendDataProvider  | 1.00    |
| IntelBluetoothFirmware | 1.1.2   |
| IntelBluetoothInjector | 1.1.2   |
| IntelMausi             | 1.0.5   |
| Lilu                   | 1.5.0   |
| SMCBatteryManager      | 1.1.9   |
| SMCProcessor           | 1.1.9   |
| SMCSuperIO             | 1.1.9   |
| USBMap                 | 1.0.0   |
| VirtualSMC             | 1.1.9   |
| VoodooI2C              | 2.6.3   |
| VoodooI2CHID           | 1.0     |
| VoodooPS2Controller    | 2.2.0   |
| WhateverGreen          | 1.4.6   |

</details>
<details>

<summary><strong>UEFI drivers</strong></summary>
<br>

|     Driver      | Version           |
| :-------------: | ----------------- |
|   HfsPlus.efi   | OcBinaryData      |
| OpenRuntime.efi | OpenCorePkg 0.6.7 |
</details>

<details>
    <summary><strong>Neofetch screenshots</strong></summary>
    <br>
    <p float="left">
        <img src="./Other/README_Resources/Neofetch-BigSur.png" alt="Neofetch Big Sur" width="427">
    </p>
</details> 


## Before installation

<details>  
<summary><strong>UEFI settings</strong></summary>
<br>

**Config**

- **Keyboard/Mouse**
  - `Trackpoint` **Enabled**
  - `Trackpad` **Enabled**
- **Display**
  - `Boot Display Device` **ThinkPad LCD**
  - `Total Graphics Memory` **256MB**
  - `Boot Time Extension` **Disabled**
- **CPU**
  - `Intel Hyper-Threading Technology` **Enabled**
- **Thunderbolt**
  - `Thunderbolt BIOS Assist Mode` **Disabled**
  - `Security Level` **No Security**
  - `Support in Pre Boot Environment -> Thunderbolt(TM) device` **Disabled**

**Security**


- `Password` **Disabled**
- `Fingerprint` **Disabled**
- `Security Chip` **Disabled**
- `Memory Protection -> Execution Prevention` **Enabled**
- `Virtualization -> Kernel DMA Protection` **Disabled**
- `Virtualization -> Intel Virtualization Technology` **Enabled**
- `Virtualization -> Intel VT-d Feature` **Disabled**
- `Virtualization -> Enhanced Windows Biometric Security` **Disabled**
- `I/O Port Access -> FingerPrint Reader` **Disabled**
- `I/O Port Access -> Wireless WAN` **Disabled**
- `Secure Boot -> Secure Boot` **Disabled**
- `Intel SGX -> Intel SGX Control` **Disabled**
- `Device Guard` **Disabled**

**Startup**

- `UEFI/Legacy Boot` **UEFI Only**
- `CSM Support` **No**
- `Boot Mode` **Diagnostics** (This can be changed to "Quick" once you know your system is running properly)

</details>  

<details>

<summary><strong>Own prev-lang-kbd</strong></summary>
<br>

Either add as a string or as a data ( HEX data [(ProperTree)](https://github.com/corpnewt/ProperTree) )

Format is lang-COUNTRY:keyboard

- 🇺🇸 | [0] en_US - U.S --> en-US:0 --> (656e2d55 533a30 in HEX)

| Key           | Type   | Value   |
| ------------- | ------ | ------- |
| prev-lang:kbd | String | en-US:0 |


Pick your keyboard layout here:

[AppleKeyboardLayouts.txt](https://github.com/acidanthera/OpenCorePkg/blob/master/Utilities/AppleKeyboardLayouts/AppleKeyboardLayouts.txt)

</details>

## Post-Install

<details>  
<summary><strong>TrackPad - Disable force touch</strong></summary>
<br>

If the **Battery** management **doesn't show up** in the System Preferences after the SSDT-Batt.aml file is added to your ACPI folder and config.plist file. You will not be able to change any trackpad settings. You may experience the annoying behaviour of clicking on the touchpad and it doing a **Force Touch** where the preview of the file is shown. I found this very annoying. You can disable force touch by modifying the file in `~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist`
Opened it with Propertree and changed **ForceSuppressed** to **True**

Another trick to manage your trackpad, if you can't get the battery to work, is to connect a bluetooth trackpad. Once the bluetooth trackpad is connected you can adjust the settings. Disconnect the bluetooth trackpad and your built in one will maintain those settings.

I used these methods prior to receiving a SSDT-Batt.aml that worked from a friendly Redditor [Galactic_Dev](https://www.reddit.com/user/Galactic_Dev)
</details>  

<details>  
<summary><strong>Generate your own SMBIOS</strong></summary>
<br>

[GenSMBIOS](https://github.com/corpnewt/GenSMBIOS)

Use GenSMBIOS to create your own serial #... based off of your preferred model.

- MacBookPro15,1 -`What I used`
- MacBookPro15,4 -`Reported as used by others`

**Note:** If you use a different SMBIOS model than the MacbookPro15,1 that I've used. The provided USB mapping will not work.  You will need to edit the **USBMap.kext file**.  You can right click on the file and select **Show Package Contents**.  From there you can open the Info.plist file in ProperTree and change MacBookPro15,1 to whatever Model ID you've chosen. This should provide a working USBMap.kext.

</details>  

<details>  
<summary><strong>CPUFriend power management</strong></summary>
<br>

Generate CPUFriendDataProvider for your machine [here](https://github.com/fewtarius/CPUFriendFriend) or use those I've provided. My files are set for power conservation over performance. Highly recommended that you use power management.

</details>  

<details>  
<summary><strong>Audio Setup</strong></summary>
<br>
## Audio Setup

Unit has ____ which requires the key or layout-id below.

| Key       | Value    |
| --------- | -------- |
| boot-args | alcid=15 |

Using the above boot-arg to initially setup your config.plist file. Everything should work, built-in microphone, speakers, headphone jack and microphone. 

If you're happy with the setup above you can use the guide to replace alcid=71 per below:

- Add audio codec to DeviceProperties - layout-id | data | **47000000**

</details>  

## Status

<details>  
<summary><strong>What's working ✅</strong></summary>

- [x] Battery percentage
- [x] Bluetooth - Intel Wireless-AC 9560 
- [x] CPU power management
- [x] GPU UHD hardware acceleration / performance 
- [x] iMessage, FaceTime, App Store, iTunes Store. **Generate your own SMBIOS**
- [x] Intel I219-V Ethernet port -`works with the Lenovo dongle`
- [x] Keyboard `Volume and brightness hotkeys, with YogaSMC and BrightnessKey kexts`
- [x] Realtek® ALC3286 ("ALC285") Audio -`See setup above`
- [x] Microphone -`I haven't done much research into this. I plug in a headset and that works`
- [x] Sleep/Wake 
- [x] TouchPad `1-3 fingers swipe gestures`
- [x] TrackPoint  `Works perfectly. Just like on Windows or Linux.`
- [x] USB Ports `USB map created.`
- [x] Web camera `Both cameras are working after the USB mapping was done.`
- [x] Wifi - Intel Wireless-AC 9560
- [x] Multi-Touch Screen `Pen also working`
- [x] Graphical Boot menu `OpenCanopy (It does work. Not included in OC folder as I skip the boot menu.)` 

</details>  

<details>  
<summary><strong>What's not working ⚠️</strong></summary>

- [ ] Fingerprint reader - `There is finally after many years working driver for Linux (python-validity), don't expect macOS driver any time soon.`
- [ ] PM 981 - `Still unstable. Could work for some, not for others.`

</details>  

<details>  
<summary><strong>Untested</strong></summary>

- [ ] Thunderbolt  `No device to test.`
- [ ] Boot chime
- [ ] HDMI
- [ ] FireVault 2
- [ ] Sidecar wired
- [ ] Sidecar wireless
- [ ] Windows/Linux from OC boot menu `Not dual booting this system`

</details> 