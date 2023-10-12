SCRIPT_PATH=${0%/*}
if [ "$0" != "$SCRIPT_PATH" ] && [ "$SCRIPT_PATH" != "" ]; then
	echo "Changing directory"
	cd $SCRIPT_PATH
	pwd
fi
#echo "Copying authorized_keys..."
#cat ../id_rsa.pub > ./baseline/airootfs/root/.ssh/authorized_keys
#echo "Configuring OpenSSH settings..."
#sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' ./work/x86_64/airootfs/etc/ssh/sshd_config
#echo "Creating symlink for SSH daemon..."
#ln -s ./work/x86_64/airootfs/usr/lib/systemd/system/sshd.service ./work/x86_64/airootfs/etc/systemd/system/multi-user.target.wants/sshd.service
#echo "Creating symlink for display manager..."
#ln -s ./work/x86_64/airootfs/usr/lib/systemd/system/lightdm.service ./work/x86_64/airootfs/etc/systemd/system/display-manager.service
#echo "Changing root shell to zsh..."
#sed -i 's#/bin/bash#/bin/zsh#g' ./work/x86_64/airootfs/etc/passwd
#echo "Adding ZSH basic config"
#cat << EOF > ./baseline/airootfs/root/.zshrc
#autoload -Uz compinit promptinit
#compinit
#promptinit
#prompt walters
#zstyle ':completion:*' menu select
#EOF
# needed?
echo "Configuring pacman mirrors..."
reflector --save ./baseline/airootfs/etc/pacman.d/mirrorlist
echo "Building the files need for ISO..."
mkarchiso -r -w work -v -m netboot /root/archlinux-basic-2/baseline/
echo "Finished."


