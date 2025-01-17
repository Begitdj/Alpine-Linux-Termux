# Alpine-Linux-Termux
Script to install alpine linux in termux using qemu
### Installation
#### Update repository
````
pkg update -y
````
#### Install Curl
````
pkg inatall curl -y
````
#### Start installation
````
bash <(curl -s https://raw.githubusercontent.com/Begitdj/Alpine-Linux-Termux/refs/heads/main/Alpine.sh)
````
#### Finish installation
after alpine started login as root (no pass) and run setup-alpine after you setup the installation kill windows with alpine and you can run alpine using 
````
bash $HOME/start-alpine.sh
````
### Uninstall
Run
```
cd $HOME && rm -rf start-alpine.sh && rmdir alpine-linux
```
### Troubleshooting
#### If alpine say 0 gb on disk while instalation re create qemu virtual disk
````
cd $HOME/alpine-linux && rm -rf alpine.qcow2 && qemu-img create -f qcow2 alpine.qcow2 15G
````
you can change disk size changing gb on end of command default:15
#### If alpine say /media/vda not a directory
i dont know i just trying again and it work
### Error? Bug?
#### Please open new issues on github
### Do you have any recommendations or suggestions and questions?
#### Please open new issues on GitHub
