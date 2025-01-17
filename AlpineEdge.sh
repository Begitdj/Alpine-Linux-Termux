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
echo '\033[92mCreate alpine-linux-edge folder..'
mkdir alpine-linux-edge
cd alpine-linux-edge/
echo '\033[92mDownloading alpine linux edge iso..'
wget https://dl-cdn.alpinelinux.org/alpine/edge/releases/x86_64/alpine-virt-3.8.0-x86_64.iso
echo '\033[92m Enter the size of the desired disk in GB just number?(Recommended 15 and Above'
read sizegb
gbn=${sizegb}'G';
echo '\033[92m Creating qcow2 virtual disk..'
qemu-img create -f qcow2 alpineEdge.qcow2 $gbn
command touch $HOME/start-alpine-edge.sh
echo "cd $HOME/alpine-linux-edge/
qemu-system-x86_64 -smp 2 -m 2048 \
  -drive file=alpineEdge.qcow2,if=virtio \
  -netdev user,id=n1,hostfwd=tcp::2222-:22 \
  -device virtio-net,netdev=n1 \
  -nographic" >> $HOME/start-alpine-edge.sh
echo '\033[92m IMPORTANT: After vm started login as root(no pass) and execute setup-alpine to run alpine go to home directory and run sh start-alpine.sh installation will continue in 30 seconds '
wait 30
echo '\033[92m Start Vm...'
qemu-system-x86_64 -smp 2 -m 2048 \
  -drive file=alpineEdge.qcow2,if=virtio \
  -netdev user,id=n1,hostfwd=tcp::2222-:22 \
  -device virtio-net,netdev=n1 \
  -cdrom alpine-virt-3.8.0-x86_64.iso -boot d \
  -nographic
  
