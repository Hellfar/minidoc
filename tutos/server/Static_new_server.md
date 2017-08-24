Static new server
=================

## Install Node

```
	curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
	sudo apt-get install nodejs
	sudo ln -s /usr/bin/nodejs /usr/bin/node

	#sudo apt-get install npm
	#sudo npm install npm -g
```

## Use

Watch static content (need `reload` module installed) :

```
    $(npm bin)/reload -d app/
```

Serve static content :

```
	npm install -g node-static
    static app/
```