https://www.nginx.com/resources/wiki/start/topics/tutorials/commandline/

Binary is usualy found at:
/usr/bin/nginx # Or:
/usr/sbin/nginx

Or find the one that is working:
ps -ef|grep nginx

Service controle:
/etc/init.d/nginx

To test the conf files but not running them:
nginx -t

Stop nginx (Graceful Shutdown):
/usr/bin/nginx -s stop

Or:
kill -QUIT $( cat /usr/local/nginx/logs/nginx.pid )
