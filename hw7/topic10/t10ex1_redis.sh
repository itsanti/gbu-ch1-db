######################
### solution
######################
apt-get install redis-server
systemctl enable redis-server.service

######################
### result
######################
gbu@vbox:~$ sudo systemctl status redis-server.service
● redis-server.service - Advanced key-value store
   Loaded: loaded (/lib/systemd/system/redis-server.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2019-05-23 01:24:26 MSK; 46s ago

# run redis client. check connection
gbu@vbox:~$ redis-cli
127.0.0.1:6379> ping
PONG
127.0.0.1:6379> quit
gbu@vbox:~$