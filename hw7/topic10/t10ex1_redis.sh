######################
### setup
######################
apt-get install redis-server
systemctl enable redis-server.service

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

######################
### solution
######################
# add IPs
> HSET ips "127.0.0.1" 0
> HSET ips "127.0.0.2" 1

# increment value
> HINCRBY ips "127.0.0.1" 1

######################
### result
######################
> HGETALL ips
1) "127.0.0.1"
2) "1"
3) "127.0.0.2"
4) "1"