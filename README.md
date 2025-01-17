# Alpine-Linux-Termux
Script to install alpine linux in termux using qemu
Please give a star to thant repository:D
### Installation
#### 1.Update repository
````
pkg update -y
````
#### 2.Install Curl
````
pkg inatall curl -y
````
#### 3.Start installation
````
bash <(curl -s https://raw.githubusercontent.com/Begitdj/Alpine-Linux-Termux/refs/heads/main/Alpine.sh)
````
#### 4.Finish installation
after alpine started login as root (no pass) and run setup-alpine after you setup the installation kill windows with alpine and you can run alpine using 
````
bash $HOME/start-alpine.sh
````
#### Install Alpine Linux Edge
Installing on other folder and other start script can install behind normal alpine
Do everything as in a normal installation up to 3 points
##### 4.Start install
```
bash <(curl -s https://raw.githubusercontent.com/Begitdj/Alpine-Linux-Termux/refs/heads/main/AlpineEdge.sh))
```
just continue 4 point but edge has another start script
````
bash $HOME/start-alpine-edge.sh
````
### Uninstall
Run
```
cd $HOME && rm -rf start-alpine.sh && rmdir alpine-linux
```
##### Uninstall alpine Linux Edge
```
cd $HOME && rm -rf start-alpine-edge.sh && rmdir alpine-linux-edge
```
### Troubleshooting
#### If alpine say 0 gb on disk while instalation re create qemu virtual disk
````
cd $HOME/alpine-linux && rm -rf alpine.qcow2 && qemu-img create -f qcow2 alpine.qcow2 15G
````
##### For edge
````
cd $HOME/alpine-linux-edge && rm -rf alpineEdge.qcow2 && qemu-img create -f qcow2 alpineEdge.qcow2 15G
````
you can change disk size changing gb on end of command default:15
#### If alpine say /media/vda not a directory
i dont know i just trying again and it work
#### Some packages not available?
Maybe this package only in edge repository(Example: Neofetch) you can install edge version or add edge repository
Open /etc/apk/repositories with any text editor(Example: Nano(apk add nano) and add to the end of file
```
http://dl-cdn.alpinelinux.org/alpine/edge/main
http://dl-cdn.alpinelinux.org/alpine/edge/community
http://dl-cdn.alpinelinux.org/alpine/edge/testing
https://wiki.alpinelinux.org/wiki/Edge
```
You can also check offical alpine linux wiki about edge 
https://wiki.alpinelinux.org/wiki/Edge
If this packages available in repository 
try run
```
apk update && apk upgrade
```
#### Graphic bug in terminal
I dont know how to fix that maybe this is qemu or termux issues you can use ssh
and try again
#### Internet not working?
You can try edit /etc/resolv.conf replace all to nameserver 8.8.8.8
### Maybe questions
#### Graphic interface working?
I dont tested but most likely yes use vnc and install graphical interface
#### Can i install docker?
Yes maybe this is too slow work but yes
### Error? Bug?
#### Please open new issues on github
### Do you have any recommendations or suggestions and questions?
#### Please open new issues on GitHub
