Node new server
===============

## Install Node

```
	curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
	sudo apt-get install nodejs
	sudo ln -s /usr/bin/nodejs /usr/bin/node

	#sudo apt-get install npm
	#sudo npm install npm -g
```

## Use

watch server :

```
    nodemon --harmony app.js
```