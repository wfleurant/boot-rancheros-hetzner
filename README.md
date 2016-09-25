
### Install RancherOS on Hetzner (or from initramfs other than RancherOS)

#### Notes

You may want to use the following aliases for SSH

_ssh-nocare-hostkey_ (try public keys (RancherOS rejects after too many keypair attempts))
```
ssh \
  -o PubkeyAuthentication=yes \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no
```


_ssh-nocare_ (do not use public key (when hetzner is in recovery/pxe-boot))
```
ssh \
  -o PubkeyAuthentication=no \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no
```

_connect to hetzbox_

```
x1☘carbon:~/tmp% ssh-nocare-hostkey root@hetzbox
Warning: Permanently added 'hetzbox,1.2.3.4' (ECDSA) to the list of known hosts.

-------------------------------------------------------------------

  Welcome to the Hetzner Rescue System.

  This Rescue System is based on Debian 8.0 (jessie) with a newer
  kernel. You can install software as in a normal system.

  To install a new operating system from one of our prebuilt
  images, run 'installimage' and follow the instructions.

  More information at http://wiki.hetzner.de

-------------------------------------------------------------------

Hardware data:

   CPU1: Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Cores 8)
   Memory:  31996 MB
   Disk /dev/sda: 240 GB (=> 223 GiB) 
   Disk /dev/sdb: 240 GB (=> 223 GiB) 
   Total capacity 447 GiB with 2 Disks

root@rescue ~ # ./rancher.sh 
++ cat /dev/urandom
++ tr -dc a-zA-Z0-9
++ fold -w 20
++ head -n 1
+ password=OAQqylHPTQarbwnZK6M9
+ echo '## Installing kexec-tools, aria2'
## Installing kexec-tools, aria2
+ apt-get update
Ign http://mirror.hetzner.de jessie InRelease
Get:1 http://mirror.hetzner.de jessie/updates InRelease [63.1 kB]                                      
Get:2 http://mirror.hetzner.de jessie-backports InRelease [166 kB]                                      
Ign http://mirror.hetzner.de wheezy InRelease                                       
Get:3 http://security.debian.org jessie/updates InRelease [63.1 kB]                 
Get:4 http://mirror.hetzner.de jessie Release.gpg [2,373 B]                         
Hit http://mirror.hetzner.de wheezy Release.gpg
Get:5 http://mirror.hetzner.de jessie Release [148 kB]        
Hit http://mirror.hetzner.de wheezy Release                                                 
Ign http://cdn.debian.net jessie InRelease                                           
Get:6 http://cdn.debian.net jessie-backports InRelease [166 kB]                      
Get:7 http://mirror.hetzner.de jessie/updates/main amd64 Packages [390 kB]          
Get:8 http://security.debian.org jessie/updates/main Sources [161 kB]                                   
Hit http://mirror.hetzner.de jessie/updates/contrib amd64 Packages                                      
Hit http://mirror.hetzner.de jessie/updates/non-free amd64 Packages
Get:9 http://mirror.hetzner.de jessie/updates/main i386 Packages [390 kB]
Hit http://mirror.hetzner.de jessie/updates/contrib i386 Packages    
Hit http://mirror.hetzner.de jessie/updates/non-free i386 Packages   
Get:10 http://mirror.hetzner.de jessie-backports/main amd64 Packages [700 kB]
Get:11 http://security.debian.org jessie/updates/contrib Sources [1,439 B]                              
Get:12 http://cdn.debian.net jessie Release.gpg [2,373 B]                                               
Get:13 http://security.debian.org jessie/updates/non-free Sources [14 B]                                
Get:14 http://security.debian.org jessie/updates/main amd64 Packages [305 kB]                           
Get:15 http://mirror.hetzner.de jessie-backports/contrib amd64 Packages [9,680 B]          
Get:16 http://mirror.hetzner.de jessie-backports/non-free amd64 Packages [23.3 kB]
Get:17 http://mirror.hetzner.de jessie-backports/main i386 Packages [688 kB]
Get:18 http://security.debian.org jessie/updates/contrib amd64 Packages [2,506 B]                       
Get:19 http://cdn.debian.net jessie Release [148 kB]                                                    
Get:20 http://security.debian.org jessie/updates/non-free amd64 Packages [14 B]                         
Get:21 http://security.debian.org jessie/updates/main i386 Packages [305 kB]                            
Get:22 http://security.debian.org jessie/updates/contrib i386 Packages [2,526 B]                        
Get:23 http://mirror.hetzner.de jessie-backports/contrib i386 Packages [9,688 B]                        
Get:24 http://security.debian.org jessie/updates/non-free i386 Packages [14 B]                          
Get:25 http://mirror.hetzner.de jessie-backports/non-free i386 Packages [21.7 kB]                       
Get:26 http://mirror.hetzner.de jessie/main amd64 Packages [6,787 kB]                                   
Get:27 http://cdn.debian.net jessie-backports/main i386 Packages [688 kB]                               
Get:28 http://cdn.debian.net jessie-backports/main amd64 Packages [700 kB]                              
Get:29 http://cdn.debian.net jessie-backports/non-free amd64 Packages [23.3 kB]                         
Get:30 http://cdn.debian.net jessie/main amd64 Packages [6,787 kB]                                      
Get:31 http://cdn.debian.net jessie/non-free Sources [99.0 kB]                                          
Get:32 http://cdn.debian.net jessie/non-free amd64 Packages [83.6 kB]                                   
Get:33 http://cdn.debian.net jessie/main i386 Packages [6,789 kB]                                       
Get:34 http://cdn.debian.net jessie/contrib amd64 Packages [50.2 kB]                                    
Get:35 http://cdn.debian.net jessie/non-free i386 Packages [80.4 kB]                                    
Get:36 http://cdn.debian.net jessie/contrib i386 Packages [49.5 kB]                                     
Get:37 http://cdn.debian.net jessie-backports/non-free i386 Packages [21.7 kB]                          
Get:38 http://cdn.debian.net jessie/main Sources [7,059 kB]                                             
Get:39 http://mirror.hetzner.de jessie/contrib amd64 Packages [50.2 kB]                                 
Get:40 http://mirror.hetzner.de jessie/non-free amd64 Packages [83.6 kB]                                
Get:41 http://mirror.hetzner.de jessie/main i386 Packages [6,789 kB]                                    
Get:42 http://mirror.hetzner.de jessie/contrib i386 Packages [49.5 kB]                                  
Get:43 http://mirror.hetzner.de jessie/non-free i386 Packages [80.4 kB]                                 
Hit http://mirror.hetzner.de wheezy/openmanage amd64 Packages                                           
Hit http://mirror.hetzner.de wheezy/openmanage i386 Packages                                   
Get:44 http://cdn.debian.net jessie/contrib Sources [50.8 kB]                                           
Fetched 40.1 MB in 5s (7,735 kB/s)                       
Reading package lists... Done
+ DEBIAN_FRONTEND=noninteractive
+ apt-get install --assume-yes --show-progress kexec-tools aria2
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libc-ares2
The following NEW packages will be installed:
  aria2 kexec-tools libc-ares2
0 upgraded, 3 newly installed, 0 to remove and 62 not upgraded.
Need to get 1,359 kB of archives.
After this operation, 5,165 kB of additional disk space will be used.
Get:1 http://mirror.hetzner.de/debian/packages/ jessie/main libc-ares2 amd64 1.10.0-2 [76.7 kB]
Get:2 http://mirror.hetzner.de/debian/packages/ jessie/main aria2 amd64 1.18.8-1 [1,202 kB]
Get:3 http://mirror.hetzner.de/debian/packages/ jessie/main kexec-tools amd64 1:2.0.7-5 [80.2 kB]
Fetched 1,359 kB in 0s (9,394 kB/s)    
Preconfiguring packages ...
Selecting previously unselected package libc-ares2:amd64.
(Reading database ... 63025 files and directories currently installed.)
Preparing to unpack .../libc-ares2_1.10.0-2_amd64.deb ...
Progress: [  0%]
Progress: [  6%]
Unpacking libc-ares2:amd64 (1.10.0-2) ...
Progress: [ 12%]
Progress: [ 18%]
Selecting previously unselected package aria2.
Preparing to unpack .../aria2_1.18.8-1_amd64.deb ...
Progress: [ 25%]
Unpacking aria2 (1.18.8-1) ...
Progress: [ 31%]
Progress: [ 37%]
Selecting previously unselected package kexec-tools.
Preparing to unpack .../kexec-tools_1%3a2.0.7-5_amd64.deb ...
Progress: [ 43%]
Unpacking kexec-tools (1:2.0.7-5) ...
Progress: [ 50%]
Progress: [ 56%]
Processing triggers for man-db (2.7.0.2-5) ...
Processing triggers for systemd (215-17+deb8u4) ...
Setting up libc-ares2:amd64 (1.10.0-2) ...
Progress: [ 62%]
Progress: [ 68%]
Setting up aria2 (1.18.8-1) ...
Progress: [ 75%]
Progress: [ 81%]
Setting up kexec-tools (1:2.0.7-5) ...
Progress: [ 87%]
Generating /etc/default/kexec...
Progress: [ 93%]
Processing triggers for libc-bin (2.19-18+deb8u4) ...
Processing triggers for systemd (215-17+deb8u4) ...
+ apt-get clean
+ echo '## Downloading RancherOS ISO'
## Downloading RancherOS ISO
+ aria2c https://github.com/rancher/os/releases/download/v0.6.1-rc2/rancheros.iso
[#d22149 32MiB/41MiB(79%) CN:1 DL:4.4MiB ETA:1s]                                                        
09/25 01:51:05 [NOTICE] Download complete: /root/rancheros.iso

Download Results:
gid   |stat|avg speed  |path/URI
======+====+===========+=======================================================
d22149|OK  |   5.3MiB/s|/root/rancheros.iso

Status Legend:
(OK):download completed.
+ echo '## CRC Checksum of rancheros.iso - v0.6.1-rc2'
## CRC Checksum of rancheros.iso - v0.6.1-rc2
+ sha256sum rancheros.iso
+ grep 2ee7c0ad46fd7f61a45a81ff4c8c676cc3bc46a1a64cace88919e713a99ae613
2ee7c0ad46fd7f61a45a81ff4c8c676cc3bc46a1a64cace88919e713a99ae613  rancheros.iso
+ '[' 0 -eq 0 ']'
+ mount -t iso9660 rancheros.iso /mnt
mount: /dev/loop1 is write-protected, mounting read-only
+ echo '## Entering Mounted RancherOS ISO'
## Entering Mounted RancherOS ISO
+ '[' -d /mnt/boot ']'
+ cd /mnt/
+ echo '## Credentials: OAQqylHPTQarbwnZK6M9    (rancher)'
## Credentials: OAQqylHPTQarbwnZK6M9    (rancher)
+ echo '##  Kernel-Executing RancherOS'
##  Kernel-Executing RancherOS
+ kexec --initrd ./boot/initrd --command-line=rancher.password=OAQqylHPTQarbwnZK6M9 ./boot/vmlinuz
Write failed: Broken pipe
```

_thanks for playing_
```
x1☘carbon:~/tmp% ssh-nocare rancher@hetzbox
Warning: Permanently added 'hetzbox,1.2.3.4' (ECDSA) to the list of known hosts.
[root@rancher rancher]# uname -a
Linux rancher 4.4.19-rancher #1 SMP Tue Sep 6 18:14:47 UTC 2016 x86_64 GNU/Linux
```

