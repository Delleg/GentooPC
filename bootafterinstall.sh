
swapon /dev/sda2
mount /dev/sda3 /mnt/gentoo
mount /dev/sda1 /mnt/gentoo/boot
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/dev
test -L /dev/shm && rm /dev/shm && mkdir /dev/shm
mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
chmod 1777 /dev/shm
chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) $PS1"
