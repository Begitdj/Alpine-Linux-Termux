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
after alpine started login as root (no pass) and run setup-alpine after you setup the installation you can run alpine using 
````
bash $HOME/start-alpine.sh
````
