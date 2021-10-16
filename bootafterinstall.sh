mkdir /mnt/{gentoo,backup}
swapon /dev/nvme0n1p2
mount /dev/nvme0n1p3 /mnt/gentoo
mount /dev/nvme0n1p1 /mnt/gentoo/boot
mount /dev/nvme0n1p4 /mnt/gentoo/backup
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/dev
test -L /dev/shm && rm /dev/shm && mkdir /dev/shm
mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
chmod 1777 /dev/shm
mkdir /mnt/gentoo/hostrun
mount --bind /run /mnt/gentoo/hostrun/
chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) $PS1"
