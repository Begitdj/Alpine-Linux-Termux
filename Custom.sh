echo '\033[91mIgnore all warning while update repository upgrade package and install package'
echo '\033[92mUpdate Repository..'
command pkg update -y> /dev/null
echo '\033[92mUpgrade Package..'
command pkg upgrade -y> /dev/null
echo '\033[92mInstall Wget..'
command pkg install wget -y> /dev/null
echo '\033[92mInstall Qemu..'
command pkg install qemu-system-x86-64-headless qemu-utils -y> /dev/null
echo '\033[92mGo to home..'
cd $HOME
echo '\033[92mCreate custom folder..'
mkdir custom
cd custom/
echo '\033[92mEnter url to download iso'
read url
echo '\033[92mDownloading iso...'
wget -O custom.iso $url
echo '\033[92m Enter the size of the desired disk in GB just number?(Recommended 15 and Above'
read sizegb
gbn=${sizegb}'G';
echo '\033[92m Creating qcow2 virtual disk..'
qemu-img create -f qcow2 Custom.qcow2 $gbn
command touch $HOME/start-custom.sh
echo "cd $HOME/custom/
qemu-system-x86_64 -smp 2 -m 2048 \
  -drive file=custom.qcow2,if=virtio \
  -netdev user,id=n1,hostfwd=tcp::2222-:22 \
  -device virtio-net,netdev=n1 \
  -nographic" >> $HOME/start-custom.sh
echo '\033[92m IMPORTANT: This is custom os this is maybe work bad or not work'
wait 30
echo '\033[92m Start Vm...'
qemu-system-x86_64 -smp 2 -m 2048 \
  -drive file=custom.qcow2,if=virtio \
  -netdev user,id=n1,hostfwd=tcp::2222-:22 \
  -device virtio-net,netdev=n1 \
  -cdrom custom.iso -boot d \
  -nographic
  
