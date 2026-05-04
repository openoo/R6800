export BACKUPDIR=/mnt/shares/U/r6800_bak
mkdir -p $BACKUPDIR
for devname in $(cat /proc/mtd | grep mtd | cut -d':' -f1)
do
 echo "copy /dev/$devname to $BACKUPDIR/$devname.bin"
 dd if=/dev/$devname of=$BACKUPDIR/$devname.bin
 md5sum $BACKUPDIR/$devname.bin >$BACKUPDIR/$devname.bin.md5sum.txt
done