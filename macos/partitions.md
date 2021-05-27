```
# Partition USB HDD on linux

lsblk -f 
parted -s --align=optimal /dev/sdb mklabel gpt
parted -s --align=optimal /dev/sdb mkpart primary 0G 128G
parted -s --align=optimal /dev/sdb mkpart primary 128G 256G
parted -s --align=optimal /dev/sdb mkpart primary 256G 768G
parted -s --align=optimal /dev/sdb mkpart primary 768G 4001G
parted -s --align=optimal /dev/sdb name 1 fat32part
parted -s --align=optimal /dev/sdb name 2 ext4part
parted -s --align=optimal /dev/sdb name 3 btrfspart
parted -s --align=optimal /dev/sdb name 4 apfspart
parted -s --align=optimal /dev/sdb print

Model: Seagate BUP BK (scsi)
Disk /dev/sdb: 4001GB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags: 

Number  Start   End     Size    File system  Name       Flags
 1      1049kB  128GB   128GB   fat32        fat32part
 2      128GB   256GB   128GB   ext4         ext4part
 3      256GB   768GB   512GB   btrfs        btrfspart
 4      768GB   4001GB  3233GB               apfspart


# Format APFS partition on macos

diskutil list /dev/disk2
diskutil erasevolume apfs time_machine_backups disk2s4
diskutil apfs addvolume disk3 apfs bootable_clone
diskutil apfs addvolume disk3 apfs home_backups
diskutil apfs addvolume disk3 apfs workspace_backups
diskutil apfs addvolume disk3 apfs storage

Set space quotas?


# Create workspace volume

Apple SSD AP0256M Media
Container disk1
Add APFS volume workspace
ln -s /Volumes/workspace workspace


# Notes

mkfs.vfat /dev/sdb1 -n fat32part
mkfs.ext4 /dev/sdb2 -L ext4part
mkfs.btrfs -f /dev/sdb3 -L btrfspart
lsblk -f

apt-get install btrfs-tools


## GPB

GPB seems to create 3 additional apfs volumes

diskutil list disk3
/dev/disk3 (synthesized):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      APFS Container Scheme -                      +3.2 TB     disk3
                                 Physical Store disk2s4
   1:                APFS Volume ⁨home_backups⁩            57.3 GB    disk3s3
   2:                APFS Volume ⁨workspace_backups⁩       1.9 MB     disk3s4
   3:                APFS Volume ⁨time_machine_backups⁩    52.8 MB    disk3s5
   4:                APFS Volume ⁨storage⁩                 847.9 KB   disk3s1
   5:                APFS Volume ⁨bootable_clone - Data⁩   137.0 GB   disk3s6
   6:                APFS Volume ⁨bootable_clone⁩          15.3 GB    disk3s2
   7:                APFS Volume ⁨Preboot⁩                 483.4 MB   disk3s7
   8:                APFS Volume ⁨Recovery⁩                622.1 MB   disk3s8


# IDEAS

Increase Backup Frequency

Run tmutil localsnapshot once per minute on mains power
On battery power, every 5 minutes.

Get Backup Pro:

- Schedule wakeup
- Prune snapshots 
- Test clone restore
- Nightly sync workspace backup to hdd, apfs snapshot
- Nightly sync home directory backup to hdd, apfs snapshot
- Nightly sync home directory to fileserver, btrfs snapshot (max 300GB)
- Nightly sync workspace to fileserver, btrfs snapshot (max 100GB)
- Fileserver encrypts, drops to remote

```
