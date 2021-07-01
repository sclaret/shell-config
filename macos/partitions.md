```
# Partition USB HDD on linux

lsblk
b=sdb
bd=/dev/${b}

parted -s --align=optimal $bd mklabel gpt
parted -s --align=optimal $bd mkpart primary 0G 128G
parted -s --align=optimal $bd mkpart primary 128G 256G
parted -s --align=optimal $bd mkpart primary 256G 768G
parted -s --align=optimal $bd mkpart primary 768G 4001G
parted -s --align=optimal $bd name 1 fat32part
parted -s --align=optimal $bd name 2 ext4part
parted -s --align=optimal $bd name 3 btrfspart
parted -s --align=optimal $bd name 4 apfspart
parted -s --align=optimal $bd print

Model: Seagate BUP BK (scsi)
Disk /dev/sda: 4001GB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags: 

Number  Start   End     Size    File system  Name       Flags
 1      1049kB  128GB   128GB                fat32part
 2      128GB   256GB   128GB                ext4part
 3      256GB   768GB   512GB                btrfspart
 4      768GB   4001GB  3233GB               apfspart

mkfs.vfat ${bd}1
mkfs.ext4 ${bd}2
mkfs.btrfs -f ${bd}3

lsblk -f

parted -s --align=optimal ${bd} print


# Format APFS partition on macos

diskutil list
diskutil apfs createContainer disk2s4

d=disk3
diskutil apfs addVolume ${d} APFS macintosh_hd_backups -quota 1024g
diskutil apfs addVolume ${d} APFS workspace_backups -quota 1024g
diskutil apfs addVolume ${d} APFS storage -reserve 512g

diskutil list /dev/${d}

diskutil apfs deleteVolume /dev/${d}s1
diskutil apfs deleteVolume /dev/${d}s2
diskutil apfs deleteVolume /dev/${d}s3


# Create workspace volume

Apple SSD AP0256M Media
Container disk1
Add APFS volume workspace
ln -s /Volumes/workspace workspace


# Notes

sudo mount -t msdos /dev/disk2s1 /Volumes/fatpart

cd /mnt
mkdir ${b}1 ${b}2 ${b}3
mount ${bd}1 ${b}1 
mount ${bd}2 ${b}2
mount ${bd}3 ${b}2/.
wget https://github.com/utmapp/vm-downloads/releases/download/debian-10.4/debian-10.4-i3-arm64-utm.zip
cp debian-10.4-i3-arm64-utm.zip /mnt/sdb3/.
cp debian-10.4-i3-arm64-utm.zip /mnt/sdb1/.
cp debian-10.4-i3-arm64-utm.zip /mnt/sdb2/.
cp debian-10.4-i3-arm64-utm.zip /mnt/sdb3/.


# Packages

apt install parted
apt install dosfstools
apt install btrfs-tools
```
